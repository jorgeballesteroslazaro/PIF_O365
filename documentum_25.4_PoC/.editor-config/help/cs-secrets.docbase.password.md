### Repository Password

<!-- Variable Description -->
Password to connect to the repository.

#### Variable Location
```yaml
# documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  docbase:
    password:
```

<br>

#### Additional Information
* **Notes**: 
* 1. Make sure that you follow the password complexity rules.
* 2. Use the DM_CRYPTO_MIN_PASSWORD_LENGTH environment variable in extraEnv to change the minimum length of the password.
* 3. If you want to change the repository password in the database, ensure that you set the value of 
     docbaseOwnerPasswordChange to true in content-server and then change the repository password during the Helm upgrade.