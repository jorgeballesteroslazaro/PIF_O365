### Classic View Webapp Name  

<!-- Variable Description -->
Default name for the Classic View web application.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  d2classicWebappName: &d2classic_webapp_name D2
```

<br>

#### Additional Information
* **Default Value**: `D2`
* The default value for other Webapp names are as follows:
* 1. `D2-Config` for d2configWebappName
* 2. `d2-rest` for d2restWebappName
* 3. `D2-Smartview` for d2smartviewWebappName
* **Constraints**: Must be a unique name.
* **Note**: If you want to customize the default Webapp names, update `d2classicWebappName`, `d2configWebappName`, `d2restWebappName` and `d2smartviewWebappName` with the custom Webapp name you want to use for the different Webapps.
* Do not use different or conflicting names for the custom Webapp names. Each custom Webapp name should be unique.
* For example:
* d2classicWebappName: &d2classicWebappName OTD2
* d2configWebappName: &d2configWebappName OTD2Config
* d2restWebappName: &d2restWebappName OTd2rest
* d2smartviewWebappName: &d2smartviewWebappName OTD2Smartview