### Enable Multiple Ingress

<!-- Variable Description -->
Indicates if multiple ingresses are enabled.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  multiIngress: false
```

<br>

#### Additional Information
* **Default Value**: `false`
* **Constraints**: Must be a boolean value.
* **Note**: If you set the value to `false`, `dctm-ingress` is enabled by default.
* If you set the value to `true`, `d2publicingress`, `vpningress` and `dctm-ingress` are enabled as internal ingresses.