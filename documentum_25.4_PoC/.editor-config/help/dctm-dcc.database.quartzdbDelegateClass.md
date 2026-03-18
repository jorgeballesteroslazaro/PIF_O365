### Quartz Scheduler Database Delegate Class

<!-- Variable Description -->
Database delegate class of Quartz scheduler .

#### Variable Location
```yaml
# documentum/config/configuration.yml
dctm-dcc:
  database:
    quartzdbDelegateClass: org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
```

OR

```yaml
# documentum/config/configuration.yml
dctm-dcc:
  database:
    quartzdbDelegateClass: org.quartz.impl.jdbcjobstore.oracle.OracleDelegate
```
<br>

#### Additional Information
* **Notes**:
* 1. For PostgreSQL, the default value is `org.quartz.impl.jdbcjobstore.PostgreSQLDelegate`.
* 2. For Oracle, the default value is `org.quartz.impl.jdbcjobstore.oracle.OracleDelegate`.
