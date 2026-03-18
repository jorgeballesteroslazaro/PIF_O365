### Documentum CM Server Service Account

<!-- Variable Description -->
Service account information.

#### Variable Location
``` yaml
# documentum/values.yaml
global:
  documentumserviceaccount: &documentum_service_account default
```
<br>

#### Additional Information
* **Default Value**: `default`
* **Note**: Default service account is used by default.
* If you want to use any non-default service account, then update the `&documentumserviceaccount` anchor tag to the common service account name you want to use for the deployment.
* During the upgrade process from the older deployments to the latest version, if there is no service account already configured with the pods,
* then do not update the anchor tag value.
* When Vault is configured with the Kubernetes authentication in the Kubernetes namespace, then the `&documentumserviceaccount` anchor tag
* should be updated with the correct service account name which has access to Vault.
