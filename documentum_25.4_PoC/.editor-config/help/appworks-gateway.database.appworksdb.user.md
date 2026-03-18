### Database User Name

<!-- Variable Description -->
Database user name to be used for the Appworks Gateway container deployment.

#### Variable Location
```yaml
# documentum/config/configuration.yml
appworks-gateway:
  database:
    appworksdb:
	   user: postgres  
```

<br>

#### Additional Information
* **Note**: User is created for PostgreSQL if it does not exist.