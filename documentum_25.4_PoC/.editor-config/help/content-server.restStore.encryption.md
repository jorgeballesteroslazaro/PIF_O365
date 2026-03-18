### Enable Encryption

<!-- Variable Description -->
Indicates if encryption is enabled for the REST store. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  restStore:
  encryption:
```

<br>

#### Additional Information
* **Note**: If you want to enable file store encryption for the REST store, 
			set the value of content-server.contentserver.enableFilestoreEncryption 
			and content-server.restStore.encryption to `true`.