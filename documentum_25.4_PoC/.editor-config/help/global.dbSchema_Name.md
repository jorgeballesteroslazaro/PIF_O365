### Database Schema Name

<!-- Variable Description -->
Schema name of the JDBC database.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  dbSchema_Name: postgres
```

<br>

#### Additional Information
* **Default Value**: `postgres`
* **Constraints**: Must be a valid schema name.
* **Note**: If you want to use the Oracle database, set the value to `oracle`.

