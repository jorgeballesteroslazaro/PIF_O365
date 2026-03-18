### New Administrator Password

<!-- Variable Description -->
Password used to sign in to the AppWorks Gateway Administration UI.

#### Variable Location
```yaml
# documentum/config/passwords.yaml
appworks-gateway:
  awg:
    admin:
	   newadminpassword: Password@123
```

<br>

#### Additional Information
* **Default Value**: `Password@123`
* **Note**: Password must meet the OTDS Global password policy.