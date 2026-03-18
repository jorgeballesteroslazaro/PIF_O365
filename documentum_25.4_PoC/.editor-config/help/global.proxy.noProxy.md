### No Proxy

<!-- Variable Description -->
List of domains or IP addresses separated by comma that should bypass the proxy.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  proxy:
    noProxy: localhost,127.0.0.1,*.otxlab.net
```