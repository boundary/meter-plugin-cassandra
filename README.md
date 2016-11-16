# TrueSight Pulse Plugin for Apache Cassandra

Collects metrics from an instance of Apache Cassandra

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
| CASSANDRA_CACHE_KEYCACHE_CAPACITY | Cache capacity in bytes for KeyCache. |
| CASSANDRA_CACHE_ROWCACHE_HITRATE | Cache hit rate for RowCache. |
| CASSANDRA_CACHE_ROWCACHE_REQUESTS_RATE | Cache request count for RowCache per second. | 
| CASSANDRA_CACHE_ROWCACHE_ENTRIES | Number of entries on RowCache. |
| CASSANDRA_CACHE_ROWCACHE_SIZE | Cache size in bytes for RowCache. |
| CASSANDRA_CACHE_ROWCACHE_CAPACITY | Cache capacity in bytes for RowCache. |
| CASSANDRA_CACHE_COUNTERCACHE_HITRATE | Cache hit rate for CounterCache. |
| CASSANDRA_CACHE_COUNTERCACHE_REQUESTS_RATE | Cache request count for CounterCache per second. | 
| CASSANDRA_CACHE_COUNTERCACHE_ENTRIES | Number of entries on CounterCache. |
| CASSANDRA_CACHE_COUNTERCACHE_SIZE | Cache size in bytes for CounterCache. |
| CASSANDRA_CACHE_COUNTERCHE_CAPACITY | Cache capacity in bytes for CounterCache. |
| CASSANDRA_HEAP_MEMORY_USED | Total Heap Memory used by the Cassandra instance. |
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
| CASSANDRA_WRITE_LATENCY_95P | Write latency 95th percentile. |
| CASSANDRA_WRITE_1MIN_RATE | Write 1m rate. |
| CASSANDRA_READ_LATENCY_95P | Read latency 95th percentile. |
| CASSANDRA_READ_1MIN_RATE | Read 1m rate. |
| CASSANDRA_RANGE_SLICE_LATENCY_MEAN | Range slice latency mean. |
| CASSANDRA_RANGE_SLICE_LATENCY_95P | Range slice latency 95th percentile. |
| CASSANDRA_RANGE_SLICE_1MIN_RATE | Range slice 1m rate. |
| CASSANDRA_RANGE_SLICE_FAILURES_RATE | Range slice failure rate. |
| CASSANDRA_RANGE_SLICE_TIMEOUTS_RATE | Range slice timeout rate. |
| CASSANDRA_CAS_READ_LATENCY_MEAN | CAS read latency mean. |
| CASSANDRA_CAS_READ_LATENCY_95P | CAS read latency 95th percentile. |
| CASSANDRA_CAS_READ_1MIN_RATE | CAS read 1m rate. |
| CASSANDRA_CAS_READ_FAILURES_RATE | CAS read failures rate. |
| CASSANDRA_CAS_READ_TIMEOUTS_RATE | CAS read timeouts rate. |
| CASSANDRA_CAS_WRITE_LATENCY_MEAN | CAS write latency mean. | 
| CASSANDRA_CAS_WRITE_LATENCY_95P | CAS write latency 95th percentile. |
| CASSANDRA_CAS_WRITE_1MIN_RATE | CAS write 1m rate. |
| CASSANDRA_CAS_WRITE_FAILURES_RATE | CAS write failures rate. |
| CASSANDRA_CAS_WRITE_TIMEOUTS_RATE | CAS write timeouts rate. |
| CASSANDRA_DROPPED_MUTATION_RATE | Dropped mutation rate. |
| CASSANDRA_DROPPED_READ_RATE | Dropped read rate. |
| CASSANDRA_DROPPED_COUNTER_MUTATION_RATE | Dropped counter mutation rate. |
| CASSANDRA_DROPPED_HINT_RATE | Dropped hint rate. |
| CASSANDRA_PENDING_MUTATIONS | Pending mutations. |
| CASSANDRA_PENDING_COUNTER_MUTATIONS | Pending counter mutations. |
| CASSANDRA_PENDING_READS | Pending reads. |

### Dashboards

- Cassandra General
- Cassandra Caches 

### References

http://cassandra.apache.org/doc/latest/operating/metrics.html
