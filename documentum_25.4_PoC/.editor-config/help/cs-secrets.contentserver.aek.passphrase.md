### New Passphrase

<!-- Variable Description -->
Passphrase to protect the AEK file. Make sure that you follow the password complexity rules.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  contentserver:
    aek:
      passphrase: 
```