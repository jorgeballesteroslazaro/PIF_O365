### syncnshareManual Database URL

<!-- Variable Description -->
Connection string URL to connect to the database for the syncnshareManual service.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
	syncnshareManual:
      configMap:
		database:
		  url: jdbc:postgresql://<DB_HOST>:<DB_PORT>/<DB_NAME>?escapeSyntaxCallMode=callIfNoReturn
```

<br>

#### Additional Information
* **Notes**:
* 1. For Oracle: jdbc:oracle:thin:@//<DBhost>:<DBPort>/<SID>
* 2. For PostgreSQL: jdbc:postgresql://<DBHost>:<DBport>/<DB_NAME>?escapeSyntaxCallMode=callIfNoReturn
* 3. The <DB_NAME> is the same as dbSchemaInit.dbname.