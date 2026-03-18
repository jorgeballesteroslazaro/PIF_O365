### Metadata Database Schema

<!-- Variable Description -->
Indicates if the database schema init container for the syncnshareManual service is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
	syncnshareManual:
      dbSchemaInit:
		enabled: true
```

<br>

#### Additional Information
* **Notes**:
* 1. For new installation, set the value to `true` to create a database and necessary tables for syncnshareManual service.
* 2. To upgrade the Documentum Connector for Core Share services, set the value to `false`.