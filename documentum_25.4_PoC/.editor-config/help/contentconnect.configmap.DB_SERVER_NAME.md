### Database Server Name

<!-- Variable Description -->
Database server used to deploy Content Connect on SSL-enabled PostgreSQL on Google Cloud Platform (GCP).
 
#### Variable Location
``` yaml
# documentum/config/configuration.yml
contentconnect:
    configmap:
      DB_SERVER_NAME:
```
<br>

#### Additional Information
* **Default Value**: Null
* **Notes**: To find the SAN value, do the following:
* 1. Find the pseudo-DNS name using the following command: openssl s_client -connect [IPaddrees]:5432--showcerts --starttlspostgres
* 2. From the preceding command output, copy the certificate content(between --OPEN CERTIFICATE and --END CERTIFICATE) and 
     use the following command to find the SAN value that can be used as server name:| openssl x509 --noout --