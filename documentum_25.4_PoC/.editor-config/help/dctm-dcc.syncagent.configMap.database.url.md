### Sync Agent Database URL

<!-- Variable Description -->
Connection string URL used to connect to the database for the syncagent service.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc: 
  syncagent:
    configMap: 
      database:
        url: jdbc:postgresql://<DB_HOST>:<DB_PORT>/<DB_NAME>?escapeSyntaxCallMode=callIfNoReturn
```
<br>

#### Additional Information
* **Notes**:
* 1. For Oracle, the default value is `jdbc:oracle:thin:@//<DBhost>:<DBPort>/<SID>`.
* 2. For PostgreSQL, the default value is `jdbc:postgresql://<DB_HOST>:<DB_PORT>/<DB_NAME>?escapeSyntaxCallMode=callIfNoReturn`.
* 3. The value that you provide for <DB_NAME> should be same for dbSchemaInit.dbname too.
