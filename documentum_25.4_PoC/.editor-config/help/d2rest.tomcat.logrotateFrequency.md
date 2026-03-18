### Log Rotate Frequency

<!-- Variable Description -->
Indicates the frequency at which the log files are rotated. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  tomcat:
    logrotateFrequency: 1d
```
<br>

#### Additional Information
* **Default Value**: `1d`
* **Note**: Log file rotation is a process that renames the current log file and starts a new log file. 
            This helps in managing disk space and limits the size of log files.
* **Example**: 10m, 10h, 10d.