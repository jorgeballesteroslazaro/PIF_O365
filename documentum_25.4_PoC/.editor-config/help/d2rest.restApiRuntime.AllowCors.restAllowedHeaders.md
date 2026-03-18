### Client REST API Allowed Headers

<!-- Variable Description -->
Configuration used in the context of Cross-Origin Resource Sharing (CORS) in REST APIs.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  restApiRuntime:
    AllowCors:
      restAllowedHeaders: 
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**: 
* 1. The restAllowedHeaders variable specifies which HTTP headers can be used when making requests to the server. 
     This is important because it allows the server to control which headers are allowed in cross-origin requests, 
     and enhances security by preventing unauthorized headers from being sent. 
* 2. By default, the following headers are allowed when CORS is enabled: DOCUMENTUM-CUSTOM-UNAUTH-SCHEME, OT-DCTM-PRODUCT-CODE, Authorization, 
     Content-Type, Accept, X-CLIENT-LOCATION, X-CLIENT-APPLICATION-NAME. You can also add additional headers.