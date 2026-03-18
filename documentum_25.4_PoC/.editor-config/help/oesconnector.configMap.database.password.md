### Database Password for OES Connector

<!-- Variable Description -->
Encrypted database password obtained through the encryptionutil.jar file, which you can download from My Support.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
oesconnector:
	configMap:
      database:
	    password: <encrypted_db_password>
```

<br>

#### Additional Information
* **Note**: Use the following command format to encrypt the database password: java -jar encryptionutil.jar <password>