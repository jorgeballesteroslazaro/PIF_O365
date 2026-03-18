### Vault ConfigMap Name

<!-- Variable Description -->
Indicates the configuration required for Vault. The configuration changes are populated in the application.properties file.

#### Variable Location
```yaml
# documentum/config/configuration.yml
cs-logging-configMap:
  vault:
    configmap:  
```

<br>

#### Additional Information
* **Note**: If you change the Vault configuration details in the cslogging-configMap section in the documentum/config/configuration.yml file any time after the 
initial deployment of the pod with Vault, you must change the value of secrets_Change variable in Global Variables in the documentum/values.yaml file to a 
different value other than the one mentioned during the initial deployment. Then, run the Helm upgrade command for the changes to take effect.	