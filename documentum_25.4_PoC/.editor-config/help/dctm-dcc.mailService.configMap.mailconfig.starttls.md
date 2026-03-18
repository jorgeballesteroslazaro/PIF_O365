### Enable TLS

<!-- Variable Description -->
If this variable is enabled and is supported by the server, it allows use of the STARTTLS command to switch the connection to a TLS-protected connection before 
issuing any login command.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:  
  mailService:
    configMap:
      mailconfig:
        starttls: false
```