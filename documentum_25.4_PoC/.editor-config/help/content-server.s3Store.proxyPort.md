### Proxy Port

<!-- Variable Description -->
Port reserved for the proxy server. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  s3Store:
    proxyPort:
```

<br>

#### Additional Information
* **Default Value**: `noproxy`
* **Note**: You must set the value for proxyPort if the Documentum CM Server host is behind the proxy server 
			and S3 object store is in the public cloud.