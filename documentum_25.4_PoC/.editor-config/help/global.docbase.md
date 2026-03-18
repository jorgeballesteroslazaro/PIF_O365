### Repository Name

<!-- Variable Description -->
Name of the Documentum Content Management repository.

#### Variable Location
``` yaml
# documentum/values.yaml
global:
  docbase: <docbase_name>
```

<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: Must be a valid name for the Documentum Content Management repository.
* **Note**: If you set the value to `myrepo`, the application is configured to use the Documentum repository name as `myrepo`.