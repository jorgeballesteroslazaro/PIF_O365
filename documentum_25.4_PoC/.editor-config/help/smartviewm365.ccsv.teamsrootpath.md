### Teams Root Path

<!-- Variable Description -->
Microsoft Teams home page or mapped folder. 

#### Variable Location
```yaml
# documentum/config/configuration.yml
smartviewm365:
  ccsv:    
    teamsrootpath: "/TeamsM365"
```

<br>

#### Additional Information
* **Notes**:
* 1. Make sure that this parameter is not blank. 
* 2. Make sure that the dm_world group has the WRITE permission on this folder in OpenText Documentum Content Management.