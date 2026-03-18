### Auth Mode

<!-- Variable Description -->
Authentication mode for OpenText Directory Services (OTDS) in the restApiRuntime configuration in Smart View.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
    OTDS:
      authMode: ct-otds_token
```
<br>

#### Additional Information
* **Default Value**: `ct-otds_token`
* **Note**: Supported values are: ctotds_token and ct-otds_ticket-otds_token