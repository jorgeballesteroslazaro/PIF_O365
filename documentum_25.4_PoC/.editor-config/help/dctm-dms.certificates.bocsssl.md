### Branch Office Caching Services SSL Certificate

<!-- Variable Description -->
SSL certificate of Branch Office Caching Services configured in the push mode and SSL. Multiple certificates are supported.
For Messaging Service to connect to the Branch Office Caching Services server to push the messages, import the Branch Office Caching Services public certificate in the Messaging Service Java virtual machine. 

#### Variable Location
```yaml
# documentum/config/passwords.yaml or passwords_vault.yaml or documentum/config/passwords_k8api.yaml
dctm-dms:
  certificates:
    bocsssl:  
```