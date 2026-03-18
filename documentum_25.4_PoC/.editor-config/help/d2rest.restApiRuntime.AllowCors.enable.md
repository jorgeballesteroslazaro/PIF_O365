### Allow CORS

<!-- Variable Description -->
Indicates if the Cross-Origin Resource Sharing (CORS) for API requests is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  restApiRuntime:
    AllowCors:
      enable: true
```
<br>

#### Additional Information
* **Default Value**: `true`
* **Notes**: 
* 1. CORS is a security feature implemented by web browsers to prevent web pages from making requests to a different domain than the one that served the web page.
* 2. By enabling CORS, you can allow your API to be accessed from different domains, which is useful for integrating with external services and APIs.