### Source Repository Password

<!-- Variable Description -->
Encrypted password from the Documentum Content Management superuser repository. Provide a value only if you are using syncnshareManual.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
dctm-dcc:
	syncnshareManual:
      configMap:
		setup:
		  sourceRepoPassword: <Provide the Documentum super user repository encrypted password>
```

<br>

#### Additional Information
* **Notes**:
* 1. For Oracle: jdbc:oracle:thin:@//<DBhost>:<DBPort>/<SID>
* 2. For PostgreSQL: jdbc:postgresql://<DBHost>:<DBport>/<DB_NAME>?escapeSyntaxCallMode=callIfNoReturn
* The <DB_NAME> is the same as dbSchemaInit.dbname.