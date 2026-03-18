### External Native Node Port

<!-- Variable Description -->
Node port used for external access to the native Connection Broker services.

#### Variable Location
```yaml
# documentum/config/configuration.yml
docbroker:
  ExtDocbroker: 
    extNativeNodePort:
```

<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: Must be a valid node port number within the range of 30000-32767.
* **Note**: If you set the value to `30133`, the native Connection Broker service is accessible using the `30133` port.