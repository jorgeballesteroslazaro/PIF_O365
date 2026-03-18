### Solr Auth Password

<!-- Variable Description -->
The Solr authentication password used to connect to Solr. The fixed value for this variable is Password@123.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  documentumsearch:
    solr_auth_password: 
```

<br>

#### Additional Information
* **Note**: The solr_auth_password is not retrieved from Vault.