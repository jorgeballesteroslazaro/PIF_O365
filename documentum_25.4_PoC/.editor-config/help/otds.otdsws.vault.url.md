### Vault URL

<!-- Variable Description -->
URL to connect to the Vault server. Use http://localhost:8200 for the Vault Agent Injector.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otds:
  otdsws:
    vault:
      url: https://<vault_host_name>:<vault_port>
```