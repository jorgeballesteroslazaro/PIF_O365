### Kubernetes API Range

<!-- Variable Description -->
Range of IP addresses for the Kubernetes API server. Used when istio sidecars are used and may be blocking communication to the Kubernetes API.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otiv:
  global:  
    k8sApiIPRanges: 10.0.0.0/32,172.0.0.0/32
```