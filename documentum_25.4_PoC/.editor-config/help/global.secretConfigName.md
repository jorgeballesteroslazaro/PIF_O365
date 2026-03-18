### Secret Configuration Name

<!-- Variable Description -->
Name of the Kubernetes secret that contains the actual credentials such as database password, installation owner password, and so on.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  secretConfigName:
```

<br>

#### Additional Information
* **Notes**: Make sure that the name is same as you mentioned while creating a secret using the documentum/config/vault_secret.yaml file.
* If you have not created a secret using the documentum/config/vault_secret.yaml file but want to use the secret from any cloud providers
* (for example, secret manager in Microsoft Azure, Amazon Web Services, and so on), in External Secret Operator (ESO) configuration,
* synchornize the secret from cloud provider with the value provided for global.secretConfigName as target secret.
* If you set the value for global.vaultType to `K8API`, for OTDS, set the value provided for global.secretConfigName as 
* the value for otds.otdsws.customSecretName in the documentum/config/configuration.yml file.
* If you set the value for global.vaultType to `K8API`, for Intelligent Viewing, set the value provided for global.secretConfigName as 
* the value for otiv.global.existingSecret in the documentum/config/configuration.yml file.
* the value for appworks-gateway.global.secretName in the documentum/config/configuration.yml file.