### Enable SSL Certificate

<!-- Variable Description -->
Set the value of this variable to `true` if SSL database server requires valid client certificate, and provide the `sslcert` (client certificate) and `sslkey` (key) value.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  database:
    sslcertRequired: false
```