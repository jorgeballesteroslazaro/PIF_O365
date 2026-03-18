### RWM Storage Class

<!-- Variable Description -->
Name of the storage class with PVC access mode as ReadWriteMany.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  rwmStorage: &rwm_storage_class trident-nfs
```

<br>

#### Additional Information
* **Default Value**: `trident-nfs`
* **Constraints**: Must be a valid storage class name.
* **Note**: The `trident-nfs` storage class name is used for the NFS storage class.
