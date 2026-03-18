### Connection Timeout

<!-- Variable Description -->
Tomcat connection timeout in milliseconds.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
    tomcat:
      connectionTimeoutInMilliseconds: 60000
```
<br>

#### Additional Information
* **Default Value**: `60000`
* **Notes**: 
* 1. If this variable is set to the maximum number of milliseconds, the connector will wait after accepting a connection for the request URI line to be presented.
* 2. This variable is important for managing server resources and ensuring that idle connections do not consume resources.
* 3. It is important to balance the timeout setting based on the expected client behavior and server capacity to optimize performance and resource utilization.