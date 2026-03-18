### SSL Mode

<!-- Variable Description -->
Establish a secure connection when connecting to an SSL-enabled database.

#### Variable Location
```yaml
# documentum/config/configuration.yml
appworks-gateway:
  database:
    sslMode: verify-ca  
```

<br>

#### Additional Information
* **Default Value**: `verify-ca`
* **Notes**: 
* 1. The supported values are `require`, `verify-ca`, and `verify-full`.
* 2. Use `require` or `verify-ca` for a Google Cloud SQL database instance.
