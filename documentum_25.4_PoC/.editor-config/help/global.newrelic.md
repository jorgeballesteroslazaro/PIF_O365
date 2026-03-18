### Enable New Relic

<!-- Variable Description -->
Indicates if New Relic is enabled.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  newrelic: &newrelic_enabled false
```

#### Additional Information
* **Default Value**: `false`
* **Constraints**: Must be a boolean value.
* **Note**: If you set the value to `true`, the New Relic feature is enabled for the connection broker and Documentum CM Server pods.