# boundary-plugin-cassandra

Collects metrics from a Cassandra instance

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

#### Boundary Meter versions v4.2 or later

- To install new meter go to Settings->Installation or [see instructions](https://help.boundary.com/hc/en-us/sections/200634331-Installation).
- To upgrade the meter to the latest version - [see instructions](https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter).

### Plugin Setup

In order for the plugin to collect statistics from Cassandra you must enable the JMX metrics.

### Plugin Configuration Fields

|Field Name    | Description                                                                                              |
|:-------------|:---------------------------------------------------------------------------------------------------------|
| Source        | The Source to display in the legend for the haproxy data.  It will default to the hostname of the server.|
| Statistics URL| The URL endpoint of where the elasticsearch statistics are hosted.                                       |
| Poll Interval | How often should the plugin poll for metrics.                                                            |

### Metrics Collected

|Metric Name                                   |Description                                                               |
|:---------------------------------------------|:-------------------------------------------------------------------------|
| ActiveCount | 
| BloomFilterDiskSpaceUsed |
| BloomFilterFalsePositives |
| BloomFilterFalseRatio |
| Capacity |
| CompletedTasks |
| CompletedTasks |
| CompressionRatio | 
| CurrentlyBlockedTasks |
| ExceptionCount |
| Hits |
| LiveDiskSpaceUsed |
| LiveSSTableCount |
| Load |
| MaxRowSize |
| MeanRowSize |
| MemtableColumnsCount |
| MemtableDataSize |
| MemtableSwitchCount |
| MinRowSize |
| PendingTasks |
| ReadCount |
| RecentHitRate |
| Requests |
| Size |
| TotalBlockedTasks |
| TotalDiskSpaceUsed |
| TotalReadLatencyMicros |
| TotalTimeouts |
| TotalWriteLatencyMicros |
| UpdateInterval |
| WriteCount |


### Dashboards

- Cassandra

### References

None
