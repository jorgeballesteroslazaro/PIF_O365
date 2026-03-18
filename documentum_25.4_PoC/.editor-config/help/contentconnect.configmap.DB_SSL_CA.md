### Database SSL Certificate

<!-- Variable Description -->
Indicates the database certificate. Set this attribute with the certificate(.cert) file content to connect to the database when SSL is enabled.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or passwords_k8api.yaml
contentconnect:
  configmap:
    DB_SSL_CA: 
```