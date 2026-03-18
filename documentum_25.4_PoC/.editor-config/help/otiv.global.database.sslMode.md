### Database SSL Mode

<!-- Variable Description -->
SSL mode to use for PostgreSQL when SSL is enabled. Valid values (in order of increasing security) are prefer, require, verify-ca, and verify-full. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
otiv:
  global:
    database:
      sslMode: prefer
```