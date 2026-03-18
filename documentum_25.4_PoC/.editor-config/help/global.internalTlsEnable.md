### Internal TLS

<!-- Variable Description -->
Indicates to enable TLS from Ingress to the web application server.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  internalTlsEnable: false
```

<br>

#### Additional Information
* **Note**: If you set the value to `true`, you must also set the value of global.useCertificate to `true`.