### Database Type

<!-- Variable Description -->
Type of the database used for the connection.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  dbtype: postgres
```

<br>

#### Additional Information
* **Default Value**: `postgres`
* **Constraints**: Must be a valid database type.
* **Note**: If you want to use the Oracle database, set the value to `oracle`.