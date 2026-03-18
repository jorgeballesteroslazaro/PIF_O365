### Client Secret

<!-- Variable Description -->
If you set the value of authenticationType to oauth, provide the user's encrypted client secret from the Microsoft Entra admin center after completing the app registration.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or passwords_k8api.yaml
mailService:
	configMap:
     mailconfig:
		clientSecret: <CLIENT_SECRET>
```