# TrueSight Pulse Cassandra Plugin 

Collects metrics from a Cassandra instances

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

* Java 1.7 or later.
* This plugin is compatible with Cassandra 2.1 or later.

#### Boundary Meter versions v4.2 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.boundary.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

### Plugin Setup

In order for the plugin to collect statistics from Cassandra you need to ensure that JMX endpoint is operational. By default Cassandra listens on 7199 of your localhost.

### Plugin Configuration Fields

|Field Name    | Description                                                                                              |
|:-------------|:---------------------------------------------------------------------------------------------------------|
| Host          | Host of the Cassandra JMX endpoint                |
| Port          | Port of the Cassandra JMX endpoint. Defaults to 7199         |
| Username      | Username to access the Cassandra JMX endpoint |
| Password      | Password to access the Cassandra JMX endpoint |
| Source        | The Source to display in the legend for the metrics data.  It will default to the hostname of the server.|
| Poll Interval | How often should the plugin poll for metrics. |

### Metrics Collected

|Metric Name                                   |Description                                                               |
|:---------------------------------------------|:-------------------------------------------------------------------------|
|  CASSANDRA_COMPACTION_PENDING_TASKS | Number of estimated compaction tasks remaining to perform |
| CASSANDRA_COMPACTION_COMPLETED_TASKS | Number of completed compactions since the last start of this Cassandra instance | 
| CASSANDRA_COMPACTION_TOTAL_COMPLETED_RATE |
| CASSANDRA_COMPACTION_BYTES_COMPACTED | The progress of the current compaction. This attribute is null if no compactions are in progress. |
| CASSANDRA_CACHE_KEYCACHE_HITRATE |
| CASSANDRA_CACHE_KEYCACHE_REQUESTS_RATE |
| CASSANDRA_CACHE_KEYCACHE_ENTRIES |
| CASSANDRA_CACHE_KEYCACHE_SIZE |
| CASSANDRA_CACHE_ROWCACHE_HITRATE |
| CASSANDRA_CACHE_ROWCACHE_REQUEST_RATE |
| CASSANDRA_CACHE_ROWCACHE_ENTRIES |
| CASSANDRA_CACHE_ROWCACHE_SIZE |
| CASSANDRA_NET_TOTAL_TIMEOUTS |
| CASSANDRA_WRITE_LATENCY_MEAN |
| CASSANDRA_WRITE_FAILURES_RATE
| CASSANDRA_WRITE_TIMEOUTS_RATE
| CASSANDRA_READ_LATENCY_MEAN
| CASSANDRA_READ_FAILURES_RATE
| CASSANDRA_READ_TIMEOUTS_RATE
| CASSANDRA_CLIENT_CONNECTED_THRIFT_CLIENTS |
| CASSANDRA_STORAGE_LOAD_BYTES |
| CASSANDRA_STORAGE_COMMITLOG_SIZE |

### Dashboards

- Cassandra

### References

http://docs.datastax.com/en/cassandra/2.0/cassandra/operations/ops_monitoring_c.html
