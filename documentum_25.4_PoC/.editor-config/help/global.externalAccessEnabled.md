### Enable External Connection

<!-- Variable Description -->
Indicates if the external access (outside of the Kubernetes cluster) of the connection broker and Documentum CM Server is enabled.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  externalAccessEnabled: true
```
<br>

#### Additional Information
* **Default Value**: `true`
* **Constraints**: Must be a boolean value.
* **Note**: For example, to configure Transformation Services, a value is required to enable or disable interaction with the Documentum CM environment.
* In addition, when the value is set to `true`, provide the information for the following fields:
* **For Connection Broker**: `External Native Node Port`, `External SSL Node Port`, `Create External Service`, `Enable Liveness` (Optional), 
* `Enable Load balancer Annotations` (Optional), and `List of Annotations` (Optional).
* **For Documentum CM Server**: `IP address of the node`, `Native External Port`, `SSL External Port`, `External Docbroker Port`, 
* `Create External Service`, `Enable Load balancer Annotations` (Optional), and `List of Annotations` (Optional).