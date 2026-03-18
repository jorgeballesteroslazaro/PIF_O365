### S3 Store Credential ID

<!-- Variable Description -->
Name of the user accessing the S3 store. Use the S3 Tenant Owner ID.

#### Variable Location
```yaml
## documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  s3Store:
    s3StoreCredentialID:
```

<br>

#### Additional Information
* **Default Value**: nocredentials
* **Notes**: 
* 1. For S3 role-based access, use the default value.
* 2. If Vault is enabled, provide the S3 store credential ID. For more information about Amazon S3 store and secret ID, 
	 see OpenText Documentum Content Management - Server Administration and Configuration Guide.