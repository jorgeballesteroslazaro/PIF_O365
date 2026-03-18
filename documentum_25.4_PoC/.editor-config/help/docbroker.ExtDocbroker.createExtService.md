### Create External Service

<!-- Variable Description -->
External service for connection broker.

#### Variable Location
```yaml
# documentum/config/configuration.yml
docbroker:
  ExtDocbroker:
    createExtService: true
```
br>

#### Additional Information
* **Default Value**: `true`
* **Note**: To externalize the connection broker in Red Hat OpenShift, set the value to `false`.