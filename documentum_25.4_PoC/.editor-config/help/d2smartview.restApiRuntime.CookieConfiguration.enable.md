### Enable Cookie Configuration

<!-- Variable Description -->
Indicates if the cookie configuration for the restApiRuntime configuration is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
    CookieConfiguration:
      enable: true
```
<br>

#### Additional Information
* **Default Value**: `true`
* **Notes**: 
* 1. This configuration is required for managing cookies within the REST API runtime environment of Smart View.
* 2. If you enable this variable, the cookies are properly handled, including setting, reading, and managing cookie attributes such as expiration, domain, and path.
* 3. This configuration must be enabled during the initialization phase of Smart View to ensure that all subsequent API calls can leverage the cookie management.
* 4. When Content Connect or Mobile is enabled, ensure that the value of this variable is set to `true` to set the SameSite and session cookie attributes.