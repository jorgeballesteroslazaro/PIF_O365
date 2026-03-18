### Intelligent Viewing Secret Name

<!-- Variable Description -->
Kubernetes secret that stores passwords relevant for the Intelligent Viewing services.

#### Variable Location
```yaml
# documentum/config/configuration.yml
otiv:
  existingSecret:
```

<br>

#### Additional Information
* **Notes**: The secrets needs to be created prior to the Helm installation.
* When this is set, it is not necessary to set Helm password/secret properties.
* For example: global.masterPassword, global.database.adminPassword, publication.clientSecret, and so on. See otiv/example-secret.yaml.
* This variable handles Intelligent Viewing passwords/secrets only and does not support OTDS or the PosgreSQL container secrets.
* This means that the keys within the otiv/example-secrets.yaml file starting with OTDS and postgres are not relevant,
* and assumes the database and OTDS will be set up prior to the Intelligent Viewing installation.