### OTDS Database User Name

<!-- Variable Description -->
Database user name to connect to OTDS.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  otdsUserName: &otds_db_username postgres
```

<br>

#### Additional Information
* **Default Value**: `postgres`
* **Constraints**: Must have a valid user name. 
* **Note**: If you set the value to `postgres`, OTDS is configured to use the `postgres` user when connecting to the database.