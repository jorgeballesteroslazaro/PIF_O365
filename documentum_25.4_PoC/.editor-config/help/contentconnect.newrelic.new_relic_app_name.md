### New Relic App Name

<!-- Variable Description -->
A unique application name. OpenText Content Connect constructs the application name as NODE_NAME, appNameSuffix in newrelic.yaml.

#### Variable Location
```yaml
# documentum/config/configuration.yml
contentconnect:
  newrelic:
    new_relic_app_name: ContentConnect
```