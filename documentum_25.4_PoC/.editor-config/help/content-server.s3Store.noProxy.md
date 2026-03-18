### No Proxy

<!-- Variable Description -->
Hosts that can be accessed directly without routing through the proxy.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  s3Store:
    noProxy: 
```

<br>

#### Additional Information
* **Note**: You can define multiple hosts separated using the pipe operator (|).