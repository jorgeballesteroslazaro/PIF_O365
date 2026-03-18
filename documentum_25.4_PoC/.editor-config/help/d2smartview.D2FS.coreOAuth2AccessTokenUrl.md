### Core OAuth2 Access Token URL

<!-- Variable Description -->
Access token URL for Core OAuth2 integration in the Documentum Foundation Services (D2FS) in Smart View.

#### Variable Location
```yaml
# documentum/config/configuration.yml
d2smartview:
  D2FS:
    coreOAuth2AccessTokenUrl:
```
<br>

#### Additional Information
* **Default Value**: `https://sso.core.opentext.com/otdsws/oauth2/token`
* **Note**: This variable is used to authenticate and authorize users to access protected resources within the D2FS environment.