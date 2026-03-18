## Log File Size

<!-- Variable Description -->
Maximum size of the log file.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  tomcat:
    logfilesize: 5M
```
<br>

#### Additional Information
* **Default Value**: `5M`
* **Notes**: 
* 1. Tomcat allows you to configure the maximum size of log files to ensure that they do not consume excessive disk space. 
     This is important for the applications such as Client REST API that generates a significant amount of log data.
* 2. The log files are rotated only if it exceeds the log file size.