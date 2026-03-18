### Enable REST Store

<!-- Variable Description -->
Indicates if the Azure Blob REST store is enabled.

#### Variable Location
``` yaml
# documentum/config/configuration.yml
content-server:
  restStore:
    enable: false
```
<br>

#### Additional Information
* **Default Value**: `false`
* **Constraints**: 
* 1. Must be a boolean value.
* 2. Only HTTP is supported. Do not change this value.
* 3. Creation of both the Azure Blob and Google Cloud stores at the same time is not supported in a cloud platform.
* **Note**: If you enable the Azure Blob REST store, provide the name, proxy host, and proxy port information according to the Microsoft Azure cluster network.