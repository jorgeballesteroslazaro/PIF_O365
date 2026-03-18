### Email Server Configuration

<!-- Variable Description -->
Indicates if the email server configuration is enabled. Use this parameter to externalize the setting of email server in dm_server_config in the Documentum CM Server pod.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  email:
    configure: false 
```