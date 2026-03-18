### No Proxy

<!-- Variable Description -->
Host name or IP address that does not require any proxy. 
 
#### Variable Location
``` yaml
# documentum/config/configuration.yml
contentconnect:
    configmap:
       no_proxy:
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**: 
* 1. If Vault is enabled, set `dsis.dctm.host` as the value of this variable.
* 2. Specify asterisk (*) if all the values must be added.
* 3. If there are multiple host names, add it as a comma-separated value.