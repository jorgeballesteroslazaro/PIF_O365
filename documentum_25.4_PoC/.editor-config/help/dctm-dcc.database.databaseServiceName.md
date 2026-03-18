### Database Service Name

<!-- Variable Description -->
Information provided while configuring the database.
 
#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  database:
    databaseServiceName:
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**:
* 1. This variable is applicable only when Vault is enabled.
* 2. If Documentum Connector for Core Share uses a common database with Documentum CM Server, 
     ensure that the value of this variable is same as mentioned in Documentum CM Server.
* 3. If Documentum Connector for Core Share is using a separate database, then the value of this variable can be different, 
     but a new secret/key combination of DATABASE_PASSWORD/<databaseServiceName>_<username> must be created in the Vault server.