### Core Notification Database Name

<!-- Variable Description -->
Name of the database for the coreNotification service in PostgreSQL.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  coreNotification:
    dbSchemaInit:
      dbname: <DB_NAME>
```
<br>

#### Additional Information
* **Default Value**: Null
* **Note**: This variable is applicable only for PostgreSQL.