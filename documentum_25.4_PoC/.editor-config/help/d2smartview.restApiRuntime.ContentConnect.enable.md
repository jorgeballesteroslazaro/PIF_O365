### Enable Content Connect for Smart View

<!-- Variable Description -->
Indicates whether to use Smart View for Content Connect.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
   ContentConnect:
      enable: true
``` 
<br>

#### Additional Information
* **Default Value**: `true`
* **Note**: When you enable Content Connect for the restApiRuntime configuration, it allows Smart View to interact with content repositories through RESTful APIs 
            and perform content management operations such as creating, reading, updating, and deleting content within the repository.
