### DQL Access Mode

<!-- Variable Description -->
Access mode for Document Query Language (DQL) operations in the REST API runtime.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2rest:
  restApiRuntime:
    dqlAccessMode: all
```
<br>

#### Additional Information
* **Default Value**: `all`
* **Notes**: 
* 1. This variable determines how DQL queries are executed within the Client REST API module's REST API runtime.
* 2. It can be configured to control the level of access and permissions for performing DQL operations.
* 3. Supported values are: all, group, and admin.