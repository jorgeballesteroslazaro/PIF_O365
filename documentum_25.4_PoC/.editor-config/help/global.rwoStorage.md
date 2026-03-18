### RWO Storage Class

<!-- Variable Description -->
Name of the storage class with PVC access mode as ReadWriteOnce.

#### Variable Location
```yaml
# documentum/values.yaml
global:
  rwoStorage: &rwo_storage_class trident-nfs
```

<br>

#### Additional Information
* **Default Value**: `trident-nfs`
* **Constraints**: Must be a valid storage class name.
* **Note**: The `trident-nfs` storage class name is used for the NFS storage class.