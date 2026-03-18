### Proxy Host

<!-- Variable Description -->
IP address of the proxy server.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  s3Store:
    proxyHost:
```

<br>

#### Additional Information
* **Default Value**: `noproxy`
* **Note**: You must set the value for proxyHost if the Documentum CM Server host is behind the proxy server
			and S3 object store is in the public cloud.