### OTDS Path

<!-- Variable Description -->
Provides the list of endpoints that are associated with OTDS (backend).

#### Variable Location
```yaml
# documentum/config/configuration.yml
otds:
  ingress:
    paths:
      - "/otds-admin/"
      - "/otdstenant/"
      - "/otdsws/"
      - "/ot-authws/"
      - "/otds-v2/"      
```

<br>

#### Additional Information
* **Notes**: 
* 1. Both the host and path must match to route the traffic to the desired service properly.
* 2. The paths are available only if the value of exposeIndividualEndpoints is set to `true`. 
* 3. The "/otdsadmin/", "/otdstenant/", "/otdsws/", "/ot-authws/ ", and "/otds-v2/" endpoints are supported in OTDS. By default, only root '/' is available.