### AEK Location

<!-- Variable Description -->
Path where Application Encryption Key (AEK) is available.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  aekLocation: Local
```

<br>

#### Additional Information
* **Default Value**: `Local`
* **Constraints**: Must be a valid value.
* **Note**: If Vault is not enabled, use the default value, `Local`. If Vault is enabled, set the value to `Remote_Vault`.