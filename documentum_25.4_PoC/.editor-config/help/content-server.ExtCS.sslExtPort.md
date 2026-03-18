### SSL External Port

<!-- Variable Description -->
Port reserved for externalizing the Documentum CM Server pod.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  ExtCS:
    sslExtPort:  
```

<br>

#### Additional Information
* **Notes**: 
* 1. For Kubernetes, set the reserved port value according to your requirement. 
* 2. For Red Hat OpenShift, set the port value to 81.