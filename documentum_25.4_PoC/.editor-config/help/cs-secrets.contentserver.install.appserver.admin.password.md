### Administrator Password

<!-- Variable Description -->
Administrator password of the application server.

#### Variable Location
```yaml
# documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  contentserver:
    install:
      appserver:
        admin:
          password:
```