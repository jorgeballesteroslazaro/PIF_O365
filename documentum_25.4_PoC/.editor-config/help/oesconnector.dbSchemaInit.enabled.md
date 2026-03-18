### Database Schema Init Container for OES Connector

<!-- Variable Description -->
Indicates if the database schema init container for the Online Editing Service is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
oesconnector:
	dbSchemaInit:
      enabled: true
```
<br>

#### Additional Information
* **Note**: For a new deployment, set the value to `true` to create a database and necessary tables for Online Editing Service.