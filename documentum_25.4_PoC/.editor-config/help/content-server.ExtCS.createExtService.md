### Create External Service

<!-- Variable Description -->
Indicates if creating an external service for Documentum CM Server is enabled. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  ExtCS:
    createExtService: true
```

<br>

#### Additional Information
* **Note**: To externalize Documentum CM Server in Red Hat OpenShift, set the value to `false`.