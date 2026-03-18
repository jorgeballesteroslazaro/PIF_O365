### Disable User Agents

<!-- Variable Description -->
Disable specific user agents in the restApiRuntime configuration in Smart View. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  restApiRuntime:
    disableUserAgents:
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**:
* 1. This variable is used to block certain user agents, known malicious bots, or outdated browsers from accessing the REST API.
* 2. Set this variable to `OT DCC` when Documentum Connector for Core Share is used by Smart View.
