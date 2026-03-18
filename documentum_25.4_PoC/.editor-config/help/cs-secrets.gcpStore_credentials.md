### GCP Store Credentials

<!-- Variable Description -->
GCP Store credentials.

#### Variable Location
```yaml
## documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  gcpStore_credentials:
```

<br>

#### Additional Information
* **Note**: If Vault is enabled, provide the Google Cloud storage type service account credentials secret ID. 
			For more information about the secret ID, see OpenText Documentum Content Management - Server Administration and Configuration Guide.