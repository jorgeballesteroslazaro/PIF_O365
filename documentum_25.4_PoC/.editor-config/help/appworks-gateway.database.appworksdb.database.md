### AppWorks Gateway Database

<!-- Variable Description -->
Database name to be used for the AppWorks Gateway container deployment.

#### Variable Location
```yaml
# documentum/config/configuration.yml
appworks-gateway:
  database:
     appworksdb:
        database: postgres
```

<br>

#### Additional Information
* *Note*:
* PostgreSQL: Database is created automatically only if it does not exist.
* Amazon RDS(PostgreSQL): Create the database manually using a PostgreSQL administration tool before deployment.
* Azure(PostgreSQL): Add the required users to the database manually using a PostgreSQL administration tool before deployment.
* Oracle: Database creation is not required. It uses an existing service.