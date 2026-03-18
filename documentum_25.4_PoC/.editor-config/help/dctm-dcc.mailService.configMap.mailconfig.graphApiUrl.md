### Graph API URL

<!-- Variable Description -->
URL for the graph API. Retain the default value.

#### Variable Location
```yaml
# documentum/config/configuration.yml
mailService:
	configMap:
     mailconfig:
		graphApiUrl: https://graph.microsoft.com/v1.0/users/{sender-email}/sendMail
```