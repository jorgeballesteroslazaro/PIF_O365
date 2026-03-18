### Enable GCP Store

<!-- Variable Description -->
Indicates if Google Cloud store is enabled.

#### Variable Location
```yaml
# documentum/config/configuration.yml
content-server:
  gcpStore:
    enable: false 
```

<br>

#### Additional Information
* **Default Value**: `false`
* **Constraints**: Must be a boolean value.
* **Note**: To enable Google Cloud store, set the value of both `gcpStore.enable` and `restStore.enable` to `true`.