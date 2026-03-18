### Trusted Source Origins for Anonymous

<!-- Variable Description -->
Comma-delimited set of origins, for example, http(s)://<host name><:port> where source files to be converted are allowed to be retrieved from.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otiv:
  global:
    trustedSourceOrigins:
```
<br>

#### Additional Information
* **Note**: 
* If neither trustedSourceOrigins nor trustedSourceOriginsAnonymous is set, then there is no origin restriction and Intelligent Viewing attempts 
to retrieve source files from the requested file URL. However, if the file URL is at an HTTP endpoint (as opposed to HTTPS), no Authorization header 
is sent with the request. If either property is defined, then retrievals are restricted to the defined origins. Origins defined in trustedSourceOrigins 
will pass along an Authorization header, whereas origins defined in trustedSourceOriginsAnonymous will not include an Authorization header. 
The same origin should not be listed in both the trustedSourceOrigins and trustedSourceOriginsAnonymous properties.