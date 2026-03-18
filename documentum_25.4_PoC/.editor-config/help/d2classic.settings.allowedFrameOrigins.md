### Verify multiple lines of data

<!-- Variable Description -->
Response headers that control whether the web page can load Documentum Client into a frame or iframe.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2classic:
  settings:
    allowedFrameOrigins: frame-ancestors https://*.sharepoint.com https://outlook.office.com https://*.officeapps.live.com/ https://outlook.office365.com https://inc-word-edit.officeapps appsforoffice.microsoft.com https://kum.gcp-classic-clients.otl-cs-dctm.otxlab.net
```

<br>
 
#### Additional Information
* **Note**: When Content Connect is enabled, set allowedFrameOrigins to the following value: frameancestors https://*.sharepoint.com https://outlook.office.com 
# https://*.officeapps.live.com/https://outlook.office365.com https://inc-word-edit.officeappsappsforoffice.microsoft.com <ingressURL>