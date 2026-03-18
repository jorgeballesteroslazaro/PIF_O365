### HVP Job Encrypt SAP User

<!-- Variable Description -->
Indicates the complexity of the password stored in the sap_user_config objects.

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-cssap:
  containers:
    cssap:
	  hvpJobEncryptSapUser: false
```

<br>

#### Additional Information
* **Notes**:
* 1. If you set the value to `true`, the complexity of the password is high and you need to reset the passwords of the existing users. 
* 2. If you set the value to `false`, the complexity of the password is low.