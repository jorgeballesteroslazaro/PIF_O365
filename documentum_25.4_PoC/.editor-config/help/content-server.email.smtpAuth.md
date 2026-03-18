### SMTP Auth

<!-- Variable Description -->
Indicates if SMTP authentication is enabled. If enabled, provide the value for email.smtpUser and email.smtpPass in cs-secrets.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  email:
    smtpAuth: false 
```