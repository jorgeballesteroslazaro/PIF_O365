### Old Passphrase

<!-- Variable Description -->
Value of the older AEK passphrase (aek.passphrase). This paramter is required for upgrading AEK.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
cs-secrets:
  contentserver:
  aek:
    oldPassphrase: 
```