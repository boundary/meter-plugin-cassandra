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
|  CASSANDRA_COMPACTION_PENDING_TASKS | Estimated number of pending compaction tasks. |
| CASSANDRA_COMPACTION_COMPLETED_TASKS | Estimated number of completed compaction tasks. | 
| CASSANDRA_COMPACTION_TOTAL_COMPLETED_RATE | Estimated number of completed compaction tasks per second. |
| CASSANDRA_COMPACTION_BYTES_COMPACTED | Number of bytes compacted since node started. |
| CASSANDRA_CACHE_KEYCACHE_HITRATE | Cache hit rate for KeyCache. |
| CASSANDRA_CACHE_KEYCACHE_REQUESTS_RATE | Cache request count for KeyCache per second. |
| CASSANDRA_CACHE_KEYCACHE_ENTRIES | Number of entries on KeyCache. |
| CASSANDRA_CACHE_KEYCACHE_SIZE | Cache size in bytes for KeyCache. |
| CASSANDRA_CACHE_ROWCACHE_HITRATE | Cache hit rate for RowCache. |
| CASSANDRA_CACHE_ROWCACHE_REQUEST_RATE | Cache request count for RowCache per second. | 
| CASSANDRA_CACHE_ROWCACHE_ENTRIES | Number of entries on RowCache. |
| CASSANDRA_CACHE_ROWCACHE_SIZE | Cache size in bytes for RowCache. |
| CASSANDRA_NET_TOTAL_TIMEOUTS | Total number of timeouts ocurred for this node. |
| CASSANDRA_WRITE_LATENCY_MEAN | Latency on write operations. |
| CASSANDRA_WRITE_FAILURES_RATE | Number of failures per second on write operations. |
| CASSANDRA_WRITE_TIMEOUTS_RATE | Number of timeouts per second on write operations. | 
| CASSANDRA_READ_LATENCY_MEAN | Latency on read operations. |
| CASSANDRA_READ_FAILURES_RATE | Number of failures per second on read operations. |
| CASSANDRA_READ_TIMEOUTS_RATE | Number of timeouts per second on read operations. |
| CASSANDRA_CLIENT_CONNECTED_NATIVE_CLIENTS | Number of native clients connected. |
| CASSANDRA_CLIENT_CONNECTED_THRIFT_CLIENTS | Number of thrift clients connected. |
| CASSANDRA_STORAGE_LOAD_BYTES | Total disk space in bytes used for this node. |
| CASSANDRA_STORAGE_COMMITLOG_SIZE | Current data size of all commit log segments. |

### Dashboards

- Cassandra General
- Cassandra Caches 

### References

http://docs.datastax.com/en/cassandra/2.0/cassandra/operations/ops_monitoring_c.html
