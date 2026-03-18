### REST Store Credential ID

<!-- Variable Description -->
Name of the user accessing the REST store. Use the REST Tenant Owner ID.

#### Variable Location
```yaml
## documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  restStore:
  restStoreCredentialID:
```

<br>

#### Additional Information
* **Notes**: 
* 1. The value for this variable is not required for Google Cloud store.
* 2. If Vault is enabled, provide the Azure credential key secret ID. For more information about the secret ID, 
	 see OpenText Documentum Content Management - Server Administration and Configuration Guide.