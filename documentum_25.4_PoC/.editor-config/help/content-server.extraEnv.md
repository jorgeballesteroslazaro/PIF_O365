### Default extraEnv Sequence

<!-- Variable Description -->
Additional environment variables.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  extraEnv:
    - name: LOG4J_FORMAT_MSG_NO_LOOKUPS
      value: "true"
    - name: CERTIFICATE_1
      value: ""    
```