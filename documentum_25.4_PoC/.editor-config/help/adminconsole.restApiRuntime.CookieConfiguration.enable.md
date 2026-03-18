### Cookie Configuration

<!-- Variable Description -->
When OpenText Content Connect or Mobile is enabled, set the value to `true` to set SameSite and session cookie attributes.

#### Variable Location
```yaml
# documentum/config/configuration.yml
adminconsole:
  restApiRuntime:
     CookieConfiguration:
       enable: true
```