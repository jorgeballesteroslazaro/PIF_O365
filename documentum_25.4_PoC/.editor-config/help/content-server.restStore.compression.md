### Enable Compression

<!-- Variable Description -->
Indicates if compression is enabled for the REST store. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  restStore:
  compression:
```

<br>

#### Additional Information
* **Note**: If you want to enable file store compression for the REST store, 
	        set the value of content-server.contentserver.enableFilestoreCompression 
			and content-server.restStore.compression to `true`.