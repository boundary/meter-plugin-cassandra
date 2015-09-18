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
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_ACTIVE_COUNT",
  ['org.apache.cassandra.metrics:type=ClientRequest,scope=Read,name=Latency.Mean'] = "CASSANDRA_BLOOM_FILTER_FALSE_POSITIVE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_BLOOM_FILTER_FALSE_RADIO",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_CAPACITY",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_COMPLETED_TASKS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_COMPRESSION_RATIO",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_CURRENTLY_BLOCKED_TASKS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_EXCEPTION_COUNT",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_HITS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_LIVE_DISK_SPACED_USED",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_LIVE_SSTABLE_COUNT",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_LOADC",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_MAX_ROW_SIZE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_MEAN_ROW_SIZE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_MEMTABLE_COLUMNS_COUNT",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_MIN_ROW_SIZE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_PENDING_TASKS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_READ_COUNT",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_RECENT_HIT_RATE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_REQUESTS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_SIZE",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_TOTAL_BLOCKED_TASKS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_TOTAL_DISK_SPACE_USED",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_TOTAL_READ_LATENCY_MICROS",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_UPDATE_INTERVAL",
  ['org.apache.cassandra.net:type=MessagingService.TotalTimeouts'] = "CASSANDRA_WRITE_COUNT",
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

