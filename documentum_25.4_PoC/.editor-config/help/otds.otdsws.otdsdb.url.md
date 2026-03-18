### OTDS Database URL

<!-- Variable Description -->
URL to connect to the database for OTDS.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otds:
  otdsws:
    otdsdb:
      url: jdbc:postgresql://db-pg:5432/postgres
```

<br>

#### Additional Information
* **Notes**
* 1. For the PostgreSQL database, update <\namespace> placeholder.
* 2. For the Oracle database VM, update the jdbc:oracle:thin :@<\host>:1521:<databaseServiceName>.url
* 3. For encrypted connection, update the jdbc:postgresql://db-pg-0.db-pg.<\namespace>.svc.cluster.local:5432/postgres
* 4. For Microsoft Azure, Amazon Web Services, or Google Cloud Platform deployment, if PostgreSQL instance is used, update the otdsdb URL as: url: jdbc:postgresql://<\Database End point>:5432/<\otdsdb>