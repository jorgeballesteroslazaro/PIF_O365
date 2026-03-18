### File Name of Custom Configuration

<!-- Variable Description -->
Indicates the file name of the custom client configuration to be imported.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2config:
  customConfigurations:
     filename: 
    - <docbase_name>:DCTM-Reports-Application-25.4.0-Export-Config.zip
```

<br>

#### Additional Information
* **Notes**:
* 1. In a multi-repository deployment, if the client configuration file must be imported and if there are common config import files across repositories, 
     update the common config files under default and update the file name.
* 2. If there are no common config files to be imported across repositories, do not provide the default parameter.
* 3. When there are multiple config import files for each repository, add the config import files separated by comma.
* 4. In a single-repository deployment, provide the repository name followed by config import files seperated by comma (if there are mutliple config import files).
* 5. Remove `DCTM-Reports-Application-25.2.0-Export-Config.zip` if Reports is disabled.