### Installation Owner User Password

<!-- Variable Description -->
Password of the installation owner.

#### Variable Location
```yaml
# documentum/config/passwords.yml
installOwnerPassword: &installOwner_password
```

<br>

#### Additional Information
* **Default Value**: Null
* **Constraints**: Must be a valid password.
* **Note**: The installation owner user password should be the same as the global repository password for all the additional repositories.