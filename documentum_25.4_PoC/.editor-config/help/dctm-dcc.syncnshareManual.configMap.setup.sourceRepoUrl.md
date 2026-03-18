### Internal Client REST API Service URL

<!-- Variable Description -->
Internal Client REST API or Smart View service URL.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  syncnshareManual:
    configMap:
      setup:
        sourceRepoUrl: <Provide the internal Client REST API or Smart View service url>
```
<br>

#### Additional Information
* **Default Value**: Null
* **Example**: http://<service-name>.<namespace>.svc.cluster.local:8080/d2-rest, http://<service-name>.<namespace>.svc.cluster.local:8080/D2-Smartview