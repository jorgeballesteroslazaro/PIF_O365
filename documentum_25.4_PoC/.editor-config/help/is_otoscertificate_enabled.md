### Import OTOS Certificate on Print and Smart View Pod

<!-- Variable Description -->
Indicates to import the OTOS self-signed certificate on Print and Smart View. Disable this setting when using a valid CA certificate.

#### Variable Location
```yaml
# documentum/addons/lss/ls-config.yaml
lss:
  is_otoscertificate_enabled: &is_otoscertificate_enabled false
```