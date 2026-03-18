### Protocol

<!-- Variable Description -->
By default, Content Connect runs on the IPv6 protocol. When you install only IPv4 protocol on the server machine, ensure to update the protocol value to IPV4. 

#### Variable Location
``` yaml
# documentum/config/configuration.yml
contentconnect:
    configmap:
      protocol: IPV6
```
<br>

#### Additional Information
* **Default Value**: `IPV6`
* **Note**: Update the value of protocol to IPV4 for Kubernetes version 1.20 or earlier and IPV6 for Kubernetes versions later than 1.20.