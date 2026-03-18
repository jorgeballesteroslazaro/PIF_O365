# Appworks Gateway

## Appworks Gateway deployment pointing to PostgreSQL DB Server
AWG offers two flexible ways to set up the necessary database required.

##Automatic Setup:
Provide the PostgreSQL admin credentials during installation, and gateway will automatically create the user and database.

##Manual Setup:
If you don't want to provide admin details, and prefer to create the appworksdb yourself.
please ensure to execute the GRANT ALL command on the schema,
command : GRANT ALL ON SCHEMA public TO appworksdb.user;

Eg: If appworksdb.user is customerUser and appworksdb.database is customeAWGDB, execute in PSQL Shell.
Then, \c customeAWGDB;
GRANT ALL ON SCHEMA public TO customerUser;


## OpenText Managed Vault Integration in Appworks Gateway

The OpenText Managed Vault is used to store the OpenText AppWorks Gateway passwords in encrypted form.
note: Only to be used in OpenText cloud

### Configuration used for vault integration

1. enabled :  Set enabled to true to enable integration with OpenText Managed Vault . The default value is false.
2. type: Set to “Opentext”. This is the only value for type that is currently supported.
3. host: The host name of the vault. This is provided by OpenText cloud services.
4. port : The port for the vault host. This is provided by OpenText cloud services.
5. namespace: The namespace in which the vault is configured. This is provided by OpenText cloud services.
6. secrets: The secrets path that is stored on the vault. This is provided by OpenText cloud services..
7. authConfigPath: The Kubernetes service account token path for which the vault has access. This is provided by OpenText cloud services.
8. authPath: The auth path for which the vault has access. This is provided by OpenText cloud services.
9. role: This role authorizes the service account for the given namespace. This is provided by OpenText cloud services..
10. authType: Type “jwt” for JSON web token. This is the format that is used to authenticate the pods.
11. serviceaccount: The service account that has been created in Managed Vault. This is provided by OpenText cloud services. 

### Adding vault configuration to values.yaml of Appworks Gateway

Note: "data" is mandatory in the secrets i.e: secrets: kv/data/lab/..

vault:  
  enabled: true  
  type: Opentext
  host: # Provide the vault host  
  port: 
  namespace: 
  secrets: 
  authConfigPath: 
  authPath: 
  role: 
  authType: 
  serviceAccount: 

### AWG Secrets to be added/placed in vault.otxlab.net
#### secrets required by the init-container and the main container
AWG_DB_ADMIN_PASSWORD - this is the DB admin password
AWG_DB_PASSWORD - this is the DB password
AWG_GATEWAY_NEW_ADMIN_PASSWORD - this is gateway admin password
AWG_OTDS_ADMIN_PASSWORD - this is otds admin password
#### secrets required for SMTP mail
AWG_OTAG_SMTP_PASSWORD - this is smtp mail password
#### secret required for oauth mail
AWG_OTAG_OAUTH_CLIENT_SECRET - this is oauth mail client secret
