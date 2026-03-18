### Database URL

<!-- Variable Description -->
JDBC URL of the notification service.

#### Variable Location
```yaml
# documentum/config/configuration.yml
notificationservice:
   configMap:
     database:
	   url: jdbc:postgresql://<db_hostname>:<db_port>/svns?escapeSyntaxCallMode=callIfNoReturn
```

<br>

#### Additional Information
* **Example**: For example, the URL format is:
* 1. For non-SSL Oracle: jdbc:oracle:thin:@//<oracledbhost>:<port>/<OracleDB servicename> driverClassName: oracle.jdbc.driver.OracleDriver
* 2. For SSL Oracle: jdbc:oracle:thin:@(description=(address=(protocol=tcps)(host=<hostname>)(port=<port>))(connect_data=(service_name=<OracleDBservice name>))
* (SECURITY=(MY_WALLET_DIRECTORY=/opt/ccsmartview/data/oracle_wallet))) driverClassName: org.postgresql.Driver
* 3. For non-SSL PostgreSQL: jdbc:postgresql://<host>:5432/<db_name> driverClassName:oracle.jdbc.driver.OracleDriver
* 4. For SSL PostgreSQL: jdbc:postgresql://<db_hostname>:<db_port>/<db_name>?ssl=true&sslmode=verify-ca driverClassName: org.postgresql.Driver