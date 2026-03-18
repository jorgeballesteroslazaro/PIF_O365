### Database Table Space Name

<!-- Variable Description -->
Tablespace name to create the database.

#### Variable Location
``` yaml
# documentum/config/configuration.yml
contentconnect:
    configmap:
      DB_TABLESPACE_NAME: 
```
<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: To use the default tablespace, the variable value must be empty.
* **Notes**:
* 1. Set the database tablespace name as the value of this variable if the database type is postgres.
* 2. Set the server name as the value of this variable if you are connecting to GCP postgres database.
* **Example**: contentconnect_tablespace