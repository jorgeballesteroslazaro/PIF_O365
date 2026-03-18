### SSL Root Certificate for OES Connector

<!-- Variable Description -->
Value to set the PostgreSQL server certificate (cert file).

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
oesconnector:
   configMap:
     database:
	   db_ssl_rootcert: <db_ssl_rootcert>	  	
```