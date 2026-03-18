### Auth Mode

<!-- Variable Description -->
Set the authentication mode according to your requirement. Supported values for auth mode are ctotds_token and ct-otds_ticket-otds_token.

#### Variable Location
```yaml
# documentum/config/configuration.yml
adminconsole:
  restApiRuntime:
     OTDS:
       authMode: ct-otds_token
```