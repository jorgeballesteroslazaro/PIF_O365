### Cryptographic Key Salt Token

<!-- Variable Description -->
Crypto salt for client token encryption and decryption.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
    cryptoKeySalt: password123
```
<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: The value of this variable must not be less than 8 ASCII characters.
* **Notes**: 
* 1. Crypto salt is combined with the cryptographic key to enhance security by adding randomness to the encryption process.
     It ensures that the same plain text encrypted with the same key will produce different cipher texts.
* 2. For a multi-node deployment, this variable must be set across all the REST servers.
     For a single-node deployment of REST servers, this variable is optional.
