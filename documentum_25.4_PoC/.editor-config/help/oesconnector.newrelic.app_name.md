### New Relic App Name for OES Connector

<!-- Variable Description -->
Application name to represent the Online Editing Service pod in the New Relic dashboard.

#### Variable Location
```yaml
# documentum/config/configuration.yml
oesconnector:
   newrelic:
    app_name: DCTM_OESCONNECTOR
```
<br>

#### Additional Information
* **Note**: App name is used to view the Online Editing Service metrics in the New Relic dashboard.