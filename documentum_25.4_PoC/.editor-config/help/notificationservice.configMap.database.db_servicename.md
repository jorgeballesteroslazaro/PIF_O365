### Database Service Name

<!-- Variable Description -->
Database name when Oracle non-SSL is used and net service name when Oracle SSL database server is used.

#### Variable Location
```yaml
# documentum/config/configuration.yml
notificationservice:
   configMap:
     database:
	   db_servicename: <oracle_tls_servicename>	  	
```