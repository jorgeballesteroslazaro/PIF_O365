### Client REST API Exposed Headers

<!-- Variable Description -->
Configuration in a REST API context refers to the HTTP headers that are exposed to the client in a Cross-Origin Resource Sharing (CORS) request.


#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  restApiRuntime:
    AllowCors:
      restExposedHeaders: 
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**: 
* 1. When a web application makes a request to a different domain, the server uses the `Access-Control-Expose-Headers` header to specify which headers are safe 
     to be accessed by the client, thereby enhancing security and ensuring that only necessary information is exposed.
* 2. The restAllowedHeaders variable specifies which HTTP headers can be used when making requests to the server.
     This is important because it allows the server to control which headers are allowed in cross-origin requests, 
     and enhances security by preventing unauthorized headers from being sent.
* 3. By default, the following headers are exposed when CORS is enabled: Accept-Ranges, Content-Encoding, Content-Length, Content-Range, Authorization, and Content-Disposition.
     You can also add additional headers.