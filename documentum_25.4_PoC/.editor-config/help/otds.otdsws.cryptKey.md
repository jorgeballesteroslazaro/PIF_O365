### OTDS Cryptographic Key

<!-- Variable Description -->
Encryption key for encrypting secrets and passwords to other systems in the OTDS database.

#### Variable Location
```yaml
# documentum/config/passwords.yaml OR documentum/config/passwords_vault.yaml or documentum/config/passwords_k8api.yaml
otds:
  otdsws:
    cryptKey: Z2hkN2hyNDBkbWNGcVQ0TA==
```
<br>

#### Additional Information
* **Note**: The value is a 16 character Base64-encoded ASCII string.
* **Example**: "MTIzNDU2Nzg5YWNiZGVmZw==" is the Base64-encoded value of "123456789acbdefg".