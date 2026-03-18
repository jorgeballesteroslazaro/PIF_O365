### Token URL

<!-- Variable Description -->
URL of OAuth token. Retain the default value.

#### Variable Location
```yaml
# documentum/config/configuration.yml
mailService:
	configMap:
     mailconfig:
		tokenUrl: https://login.microsoftonline.com/{tenantId}/oauth2/v2.0/token
```