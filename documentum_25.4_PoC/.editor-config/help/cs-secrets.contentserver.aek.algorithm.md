### Algorithm for Encryption

<!-- Variable Description -->
Algorithm for the encryption.

#### Variable Location
``` yaml
# documentum/config/configuration.yml
cs-secrets:
  contentserver:
    aek:
      algorithm: AES_256_CBC
```

<br>

#### Additional Information
* **Default Value**: `AES_256_CBC`
* **Constraints**: Must be a valid algorithm.
* **Note**:  Valid values are:
* 1. AES_128_CBC
* 2. AES_192_CBC
* 3. AES_256_CBC