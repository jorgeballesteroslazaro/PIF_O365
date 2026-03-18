### Mail Password

<!-- Variable Description -->
If the value of authenticationType is basic and SMTP server requires credentials, provide the encrypted password for the server.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or passwords_k8api.yaml
mailService:
	configMap:
     mailconfig:
		mailpassword:
```