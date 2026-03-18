###  Enable SyncAgent for Database

<!-- Variable Description -->
Indicates if the database schema init container for the syncagent service is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
 dctm-dcc:
   syncagent:
     dbSchemaInit:
       enabled: true
```
<br>

#### Additional Information
* **Default Value**: `true`
* **Notes**: 
* 1. For new installation, set the value of this variable to `true` to create a database and necessary tables for syncagent service.
* 2. To upgrade the Documentum Connector for Core Share services, set the value of this variable to `false`.