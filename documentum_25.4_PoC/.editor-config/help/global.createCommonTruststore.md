### Create Common Trust Store

<!-- Variable Description -->
Indicates to create common trust store for communication between services.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  createCommonTruststore: false
```

<br>

#### Additional Information
* **Note**: When commonTruststore is set to `true`, make sure useCertificate is also set to `true`.