### Enable Metadata DB Schema

<!-- Variable Description -->
Indicates if the database schema init container for the metadata service is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
 dctm-dcc:
   coreNotification:
     dbSchemaInit:
       enabled: true
```
<br>

#### Additional Information
* **Default Value**: `true`
* **Notes**:
* 1. For new installation, set the value of this variable to `true` to create a database and necessary tables for metadata service.
* 2. To upgrade the Documentum Connector for Core Share services, set the value of this variable to `false`.