### OTIV New Relic App Name

<!-- Variable Description -->
New Relic base application name. Each service appends its service name to the New Relic application name. If the value is empty, it defaults to global.ingressDomainName.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otiv:
  global:
    newRelic:
      baseAppName: 
```