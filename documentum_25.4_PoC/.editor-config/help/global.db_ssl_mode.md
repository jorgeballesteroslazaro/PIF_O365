### Database SSL Mode

<!-- Variable Description -->
SSL connection mode used to deploy the SSL-enabled PostgreSQL database.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  db_ssl_mode: <ssl_mode> 
```

<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: Must be a valid database SSL mode.
* **Note**: Valid values are:
* 1. prefer
* 2. require
* 3. verify-ca
* 4. verify-full