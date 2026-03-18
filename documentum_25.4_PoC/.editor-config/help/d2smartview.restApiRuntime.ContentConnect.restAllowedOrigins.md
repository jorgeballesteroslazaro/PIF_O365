### REST Allowed Orgin URLs

<!-- Variable Description -->
Origins that are permitted to access the resources of the ContentConnect service within the restApiRuntime configuration in Smart View. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
    ContentConnect:
      restAllowedOrigins: frame-ancestors https://*.sharepoint.com https://outlook.office.com
	  https://*.officeapps.live.com/ https://outlook.office365.com https://inc-word-edit.officeapps appsforoffice.microsoft.com
```
<br>

#### Additional Information
* **Default Value**: `frame-ancestors https://*.sharepoint.com https://outlook.office.com https://*.officeapps.live.com/ https://outlook.office365.com https://inc-word-edit.officeapps appsforoffice.microsoft.com`
* **Notes**:
* 1. By defining these origins, you can control and restrict which external domains are allowed to make requests to your API, thereby enhancing security by preventing unauthorized access.
     If additional urls are required, then add the urls separated by a space. 
* 2. After the Smart View pod is deployed, edit the ConfigMap variables to modify the rest-apiruntime.properties using the following commands and restart the Smart View pod:
     kubectl edit configmap<smartviewservicename>rest-api-runtimeproperties-n <namespace>rest.security.headers.csp.allowed_frame_ancestors=<OpenText Content Connect URL>
* 3. With ALB, the variable value must be added after the deployment as the Content Connect URL gets generated dynamically.