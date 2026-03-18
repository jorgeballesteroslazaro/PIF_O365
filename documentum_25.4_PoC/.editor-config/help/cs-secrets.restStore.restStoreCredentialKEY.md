### REST Store Credential Key

<!-- Variable Description -->
Password of the user accessing the REST store. Use the Object Access Key.

#### Variable Location
```yaml
## documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  restStore:
  restStoreCredentialKEY:
```

<br>

#### Additional Information
* **Notes**: 
* 1. The value for this variable is not required for Google Cloud store.
* 2. If Vault is enabled, provide the Azure credential key. For more information about the secret key, 
	 see OpenText Documentum Content Management - Server Administration and Configuration Guide.