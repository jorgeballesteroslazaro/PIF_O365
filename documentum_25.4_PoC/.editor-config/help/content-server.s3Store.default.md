### Enable as Default Store 

<!-- Variable Description -->
Indicates if S3 store is the default object store.

#### Variable Location
``` yaml
# documentum/config/configuration.yml
content-server:
  s3Store:
    default: false
```
<br>

#### Additional Information
* **Default Value**: `false`
* **Constraints**: Must be a boolean value.
* **Notes**:
* 1. If you want to set the S3 store as the default store, set the value to `true` and deploy the Documentum Ingress Helm before deploying the Documentum CM Server Helm.
* 2. If you set the S3 store as the default object store, compression and de-duplication are not supported.
* 3. To migrate the contents from the existing store to the default S3 store, use the MIGRATE_CONTENT method.
     For more information about the S3 store, see OpenText Documentum Content Management - Server Administration and Configuration Guide.