### OTDS Public Host Name

<!-- Variable Description -->
FQDN or IP address of the OTDS Kubernetes service. 

#### Variable Location     
```yaml
# documentum/config/configuration.yml
otds:
  otdsws:
    publicHostname: dctm-classic-qe2-ingress.onedctmqe.otxlab.net
```

<br>

#### Additional Information
* **Notes**
* 1. The host name is dynamically determined using the Kubernetes API if the value of this attribute is empty.
* 2. Format of publicHostname is <value specified for 'dctmint-ingress.ingress.host>.<value specified for 'dctmint-ingress.ingress.clusterDomain>