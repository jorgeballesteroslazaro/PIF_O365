### Create/Update Workspace Endpoint for SOAP Config

<!-- Variable Description -->
Create or update the workspace endpoint. This variable is related to OpenText Content Management.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-cssap:
  containers:
    cssap:
	  soapConfigCreateUpdateWorkspaceEndPoint: http:\\/\\/<ip-host>:<port>\\/otsapxecm\\/services\\/ECMLink
```