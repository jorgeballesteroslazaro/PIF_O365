### Driver Class Name

<!-- Variable Description -->
Class name of the JDBC driver.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  driverClass_Name: org.postgresql.Driver
```

<br>

#### Additional Information
* **Default Value**: `org.postgresql.Driver`
* **Constraints**: Must be a valid class name.
* **Note**: Valid values are:
* 1: org.postgresql.Driver for PostgreSQL
* 2: oracle.jdbc.driver.OracleDriver for Oracle