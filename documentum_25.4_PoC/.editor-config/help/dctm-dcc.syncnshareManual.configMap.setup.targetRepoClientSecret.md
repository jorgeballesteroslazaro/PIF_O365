### Target Repository Client Secret

<!-- Variable Description -->
Encrypted client secret generated from Core Share administrator. Provide a value only if you are using syncnshareManual.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
dctm-dcc:
	syncnshareManual:
      configMap:
		setup:
		  targetRepoClientSecret: <Provide the Core Share encrypted Client Secret>
```