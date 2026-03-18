### OTDS Migration Password

<!-- Variable Description -->
Indicates if the migration from OpenDJ must be attempted and defines how the migration must be performed.

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
otds:
  otdsws:
    migration:
	  password:
```

<br>

#### Additional Information
* **Notes**:
* From the OTDS 22.1.0 release, OpenDJ is not supported as a directory server. Instead, the existing or new PostgreSQL or SQL Server or Oracle or SAP database can be used.
* The three different types of migration are:
* 1. From a legacy OTDS deployment (for example, otds:21.3.0 images): Requires the value of usingLegacyImage set to true and that the information for legacyImagePVC 
* is specified. In addition, the minimum memory requirements are increased such as the value of resource.requests.memory is set to 2Gi and the value of resource.limits.memory is set to 3Gi.
* 2. From an existing OTDS deployment in the same cluster: Requires the existing servicename, servicePort, and password information of OpenDJ is specified.
* 3. From an external OpenDJ such as a VM deployment: Requires the opendjUri (for example, ldap://otds.domain.local:1389) and password information is specified.
* If you set the value of otdsws.migration.enabled to true, then the default values are migrated from the previous default configuration.
* If you set the value of otdsws.migration.usingLegacyImage to true, then the other non-relevant values are ignored.
* In addition, if opendjUri is specified, then the servicename and servicePort are ignored.