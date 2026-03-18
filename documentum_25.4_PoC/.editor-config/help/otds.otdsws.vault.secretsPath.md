### Vault Secret Path

<!-- Variable Description -->
Path in Vault to one of the following secrets: CryptKey, AdminPassword, JDBCCreds, or OpenDJPassword.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otds:
  otdsws:
    vault:
      secretsPath:
```
<br>

#### Additional Information
* **Note**: The path should not include the /v1 prefix, namespace, or the /data/ qualifier bacause these are automatically added by OTDS.

