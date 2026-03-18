### Vault Type

<!-- Variable Description -->
Indicates the type of vault you want to use.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  vaultType:
```

<br>

#### Additional Information
* **Notes**: Valid values are `K8API` and `HashiCorp`.
* If you set the value to `K8API`, OpenText Documentum Content Management retrieves the
* passwords through the Kubernetes API directly instead of storing as an environment variable.
* Do the following:
* 1: Set the value of otds.otdsws.vault.enabled to `false`.
* 2. Set the value of otiv.global.secretlink.enabled to `false`.
* 3. Set the value of appworks-gateway.vault.enabled to `false`.
* If you set the value to `HashiCorp`, OpenText Documentum Content Management retrieves the passwords automatically from the HashiCorp Vault server.