### List of Annotations

<!-- Variable Description -->
Annotations to be enabled in the load balancer services used for externalizing Documentum CM Server.   

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  ExtCS:
    LBAnnotations:
      networking.gke.io/load-balancer-type: Internal
```