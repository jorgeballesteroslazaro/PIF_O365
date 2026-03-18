### Auth Mode

<!-- Variable Description -->
Authentication mode for the REST API runtime.
  
#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  restApiRuntime:
    authMode: ct-otds_token
```
<br>

#### Additional Information
* **Default Value**: `ct-otds_token`
* **Notes**: 
* 1. This variable determines how the REST API will handle authentication.
* 2. This variable is important for securing the REST API and ensuring that only authorized users can access the resources.
* 3. Supported values are: basic-ct, oauth2, ct-oauth2, ct-otds_token, 
     otds_token, otds_ticket-otds_token, ct-otds_ticket-otds_token, otds_password, and ct-otds_password.
