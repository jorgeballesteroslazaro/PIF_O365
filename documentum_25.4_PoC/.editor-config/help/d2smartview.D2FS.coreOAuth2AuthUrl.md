### Core OAuth2 Auth URL
 
<!-- Variable Description -->
Authentication URL for Core OAuth2 integration in the Documentum Foundation Services (D2FS) in Smart View.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  D2FS:
    coreOAuth2AuthUrl:
```
<br>

#### Additional Information
* **Default Value**: `https://sso.core.opentext.com/otdsws/login`
* **Note**: The URL includes necessary query parameters such as client ID, redirect URL, response type, and scope to ensure proper authentication flow.