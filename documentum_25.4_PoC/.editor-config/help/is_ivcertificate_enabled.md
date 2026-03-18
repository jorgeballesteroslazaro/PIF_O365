### Import IV Certificate on Smart View Pod

<!-- Variable Description -->
Indicates to import the Intelligent Viewing self-signed certificate on Smart View. Disable this setting when using a valid CA certificate.

#### Variable Location
```yaml
# documentum/addons/lss/ls-config.yaml
lss:
  is_ivcertificate_enabled: &is_ivcertificate_enabled false
```