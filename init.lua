-- Copyright 2015 BMC Software, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local framework = require('framework')
local Plugin = framework.Plugin
local CommandOutputDataSource = framework.CommandOutputDataSource
local params = framework.params
local clone = framework.table.clone
local split = framework.string.split
local notEmpty = framework.string.notEmpty
local ipack = framework.util.ipack

local JMXDataSource = CommandOutputDataSource:extend()
function JMXDataSource:initialize(options)
  options.path = 'java'
  options.use_popen = true
  local args  = ('-jar jmxquery.jar -U "service:jmx:rmi:///jndi/rmi://%s:%d/jmxrmi"'):format(options.host, options.port)
  if notEmpty(options.username) and notEmpty(options.password) then
    local auth = ('-username "%s" -password "%s"'):format(options.username, options.password)
    args = args .. auth
  end
  local mbeans = table.concat(options.mbeans, ';') 
  options.args = { args .. ' -O "java.lang:type=Memory" -A "NonHeapMemoryUsage" -K committed -X "' .. mbeans .. '"' }

  CommandOutputDataSource.initialize(self, options)
end

local options = clone(params)
local metric_mapping = {
  ['org.apache.cassandra.metrics:type=Compaction,name=PendingTasks.Value'] = "CASSANDRA_COMPACTION_PENDING_TASKS",
  ['org.apache.cassandra.metrics:type=Compaction,name=CompletedTasks.Value'] = "CASSANDRA_COMPACTION_COMPLETED_TASKS",
  ['org.apache.cassandra.metrics:type=Compaction,name=TotalCompactionsCompleted.MeanRate'] = "CASSANDRA_COMPACTION_TOTAL_COMPLETED_RATE",
  ['org.apache.cassandra.metrics:type=Compaction,name=BytesCompacted.Count'] = "CASSANDRA_COMPACTION_BYTES_COMPACTED",
  ['org.apache.cassandra.metrics:type=Cache,scope=KeyCache,name=HitRate.Value'] = "CASSANDRA_CACHE_KEYCACHE_HITRATE",
  ['org.apache.cassandra.metrics:type=Cache,scope=KeyCache,name=Requests.MeanRate'] = "CASSANDRA_CACHE_KEYCACHE_REQUESTS_RATE",
  ['org.apache.cassandra.metrics:type=Cache,scope=KeyCache,name=Entries.Value'] = "CASSANDRA_CACHE_KEYCACHE_ENTRIES",
  ['org.apache.cassandra.metrics:type=Cache,scope=KeyCache,name=Size.Value'] = "CASSANDRA_CACHE_KEYCACHE_SIZE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_NET_TOTAL_TIMEOUTS",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Write,name=Latency.Mean'] = "CASSANDRA_WRITE_LATENCY_MEAN",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Write,name=Failures.MeanRate'] = "CASSANDRA_WRITE_FAILURES_RATE",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Write,name=Timeouts.MeanRate'] = "CASSANDRA_WRITE_TIMEOUTS_RATE",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Read,name=Latency.Mean'] = "CASSANDRA_READ_LATENCY_MEAN",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Read,name=Failures.MeanRate'] = "CASSANDRA_READ_FAILURES_RATE",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Read,name=Timeouts.MeanRate'] = "CASSANDRA_READ_TIMEOUTS_RATE",
  ['org.apache.cassandra.metrics:type=Client,name=connectedThriftClients.Value'] = "CASSANDRA_CLIENT_CONNECTED_THRIFT_CLIENTS",
}

local mbeans = {}
for k, _ in pairs(metric_mapping) do
  table.insert(mbeans, k)
end
options.mbeans = mbeans

local dataSource = JMXDataSource:new(options)
local plugin = Plugin:new(params, dataSource)

function plugin:onParseValues(data)
  local result = {}
  local lines = split(data.output, '\n');
  for _, l in pairs(lines) do
    if notEmpty(l) then
      local metric, value = l:match('JMX OK%s*-%s*([%p%w]+)%s([%d.?]+)$')
      local boundary_metric = metric_mapping[metric] 
      if boundary_metric then
        ipack(result, boundary_metric, value)
      end
    end
  end
  return result
end

plugin:run()

