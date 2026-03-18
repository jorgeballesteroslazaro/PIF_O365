### Enable SSL Root Certificate

<!-- Variable Description -->
The value of this variable must be `true` for SSL mode verify-ca/verify-full, and can be `true` or `false` for SSL mode prefer/require.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  database:
    sslrootcertRequired: true 
```