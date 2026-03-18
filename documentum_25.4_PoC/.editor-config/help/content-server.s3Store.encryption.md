### Enable Encryption

<!-- Variable Description -->
Indicates if encryption is enabled for the S3 store. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  s3Store:
    encryption:
```

<br>

#### Additional Information
* **Note**: To enable file store encryption for the S3 store, 
			set the value of content-server.contentserver.enableFilestoreEncryption 
			and content-server.s3Store.encryption to `true`.
