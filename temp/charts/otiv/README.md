
### Overview

This README provides instructions for deploying the Intelligent Viewing (IV) solution to kubernetes environments. This is primarily accomplished by installing a helm chart. If at any point in this process you want to see the helm chart you've installed, or need to delete the helm chart, refer to the *Other Helm Commands* section towards the bottom of this README. If you need to modify one or more yaml values for the charts after initial installation, simply run the appropriate *helm upgrade -i ...* command in the _Install (or upgrade)..._ sections below.

- TL;DR
- Prerequisites
- Install (or upgrade) Intelligent Viewing Helm Chart 
- Ingress Configuration
- Documentation/Verification
- Other Helm Commands

### TL;DR

Following is a synopsis of the steps involved in deploying the IV services.

1. Verify or follow the prerequisies described in the next section.
1. Edit otiv/values.yaml; see the "Make yaml update" section for properties to set
2. Install/upgrade IV services  
    `helm upgrade -i otiv ./otiv-25.4.0.tgz -n <namespace> -f otiv/values.yaml `  

> If installing the most recent released version external to the OpenText VPN, the following steps should also be taken:   
* create a kubernetes docker config secret with your OpenText docker credentials (username is your email) in the target namespace
* in otiv/values.yaml, the _global.imagePullSecret_ property value should be updated with the name of the secret created in the prior step


### Prerequisites

The installation command needs to be executed on a machine with at least helm 3.2 installed. The machine needs to be configured to connect to the target kubernetes cluster. The deployed dockers running in the kubernetes cluster need to be able to access the docker registry (e.g. registry.opentext.com ) where the Intelligent Viewing (IV) docker images are downloaded from.

The dockers running in the kubernetes cluster need to be able to access any services that may have been installed externally including OTDS, PostgreSQL, and any integration services.

The kubernetes cluster needs to be set up with a nginx ingress controller so that the IV services can be accessed from outside the cluster. Note that CFCR clusters are automatically set up with a nginx ingress controller.

The kubernetes cluster also needs a storage class that provides ReadWriteMany (RWX) access. Note that CFCR clusters have the trident-nfs storage class that provides this capability.

Also, the kubernetes namespace the services run in must be created. This is done via the command:  
`kubectl create namespace <namespace>`

The IV helm chart needs to be downloaded. This can be accomplished with the following commands:
```
# One time setup: add opentext local helm repo to your list of repos:
helm repo add opentext  https://registry.opentext.com/helm --username <myuser emailaddress> --password <mypassword>

# Setup step; may want to run periodically when a new chart or version is added
#   this refreshes your local list of available helm charts
helm repo update

# download the chart if you want it local 
helm pull opentext/otiv --version 25.4.0

# extract the README.md and the base value.yaml file from the downloaded chart
tar xvfz otiv-25.4.0.tgz otiv/README.md otiv/values.yaml
# You can then modify the otiv/values.yaml and use that for input into the helm install/upgrade command
```

#### Migrating OTDS records if upgrading to v22.2 or later

Intelligent Viewing 22.2 uses OTDS version 22.1 which uses a SQL database to store records instead of a persisted volume mounted to the OTDS container. To migrate records in otds v21.3 or earlier to a SQL based OTDS (v22 or later), follow the instructions at the top otdsMigrate.yaml.

### Install (or upgrade) Intelligent Viewing Cloud Services

##### Make yaml updates

Inspect otiv/values.yaml and update any values required for your environment. In particular, the following properties need to be updated:  
- `global.ingressDomainName`
- `global.imageSource`
- `global.database.adminPassword`
- `global.masterPassword`
- `global.amqp.password`
- `otds.otdsws.cryptKey`
- `otds.otdsws.otsdb.password`
- `postgresql.image.registry # if postgresql.enabled=true, and your cluster is unable to pull from docker.io`

Also the following yaml values may need to be updated for your environment:  
- `global.storageClassName    # used by amqp/postgresql; define if your cluster doesn't have a default storage class`   
- `global.storageClassNameNFS # must be defined and set to a storage class that provides ReadWriteMany (RWX) access; stores published artifacts`  
- `global.nfsPersistenceSize  # amount of storage allocated for storing IV published artifacts`   
- `postgresql.enabled         # if using your own postgresql database instance, this should be set to false`  
For cases when using an external database instance, the `global.database.hostname` property value needs to be set to the service or IP of the PostgreSQL instance.

Other properties to review include the loglevel properties associated with the services.

An alternative to updating otiv/values.yaml is to pass in specific params at the command line (i.e. --set global.otivIngressDomainName=subdomain.domain.com). If doing this, and postgresql.enabled=true, then the properties `postgresql.auth.password` and `postgresql.auth.postgresPassword` need to have their values set to the `global.database.adminPassword` property value.

#### Execute installation
Finally, after any yaml property updates have been made, the installation or upgrade can be executed via the following command:  
`helm upgrade -i otiv ./otiv-25.4.0.tgz -n <namespace> -f otiv/values.yaml`  
> If the target kubernetes cluster is running external to the OpenText VPN, only the released IV dockers are available. The following steps should also be taken for this situation:   
* create a kubernetes docker config secret with your OpenText docker credentials (username is your email) in the target namespace
* in otiv/values.yaml, the _global.imagePullSecret_ property value should be updated with the name of the secret created in the prior step

After a minute or two, the status of the installation can be checked in the Kubernetes dashboard for the specified namespace, or via the command:  
`kubectl get pods -n <namespace>`

Check that there are running pods for the asset, config, highlight, markup, publication, publisher, viewer services, as well as for amqp (otiv-amqp-0) and postgresql (pg-otiv-0). If necessary, logs can be retrieved as described in the following section.

### Ingress Configuration

If deploying to a kubernetes cluster where the DNS automatically resolves your ingress domain name (like OpenText's CFCR), this section isn't relevant. On setups like minikube or microk8s, you may need to add entries to your DNS or hosts files. The following lines are example entries to add to the hosts files on systems where you'll be accessing the Intelligent Viewing services.

```
10.18.81.123    otds-{namespace}.dev.mycompany.com   # if OTDS installed
10.18.83.123    otiv-asset-{namespace}.dev.mycompany.com
10.18.83.123    otiv-highlight-{namespace}.dev.mycompany.com
10.18.83.123    otiv-markup-{namespace}.dev.mycompany.com
10.18.83.123    otiv-publication-{namespace}.dev.mycompany.com
10.18.83.123    otiv-viewer-{namespace}.dev.mycompany.com
```
The value of namespace should be replaced by the namespace argument provided when installing the above charts. The example domain .dev.mycompany.com should be replaced by the value of the ingress.domainName property in the otiv/values.yaml file. The FQDN for the various Intelligent Viewing services is also output after installing/upgrading the otiv helm chart.

### Documentation/Verification

##### Documentation

The output of the above helm command that installs the IV services outputs the URLs of the IV services that are accessible outside the kubernetes cluster. It also reports the URLs of the publicly available Intelligent Viewing documentation.

##### Troubleshooting

If there are errors with the above command, logs within the pods can be investigated. The names of the pods can be determined by running the following command:  
`kubectl get pods -n <namespace>`

If the asset, publication, and publisher pods show a status of _Pending_. the most likely cause is that the property specified in _global.storageClassNameNFS_ does not allow RWX access. It could also mean that the storage class provisioner is unable to allocate the amount of space specified in the property _global.nfsPersistenceSize_.

###### Logs
    
To troubleshoot problems, you can review the kubernetes dashboard for the namespace where the services where installed. Also, the logs for the pods associated with the services can be reviewed. Under the chart's otiv/scripts directory, the scripts _logs.sh_ (linux) or _logs.ps1_ (Windows) can be run, passing in {namespace} as an argument, to gather the IV logs for the specfied namespace. Note that for _logs.ps1_ if the execution policy for your Windoows user or machine is not set to "Unrestricted", the command needs to be:  _powershell.exe -executionpolicy bypass -file .\logs.ps1 {Namespace}_. The logs are written underneath the directory ./output/{namespace}/{mm-dd}  

To see the logs for a particular service, enter the command:  
`kubectl logs -n <namespace> <pod name>`  

Note that most of the IV pods have init containers. If pods show persistently show a status of _Init:..._, you can see the logs for the init container that initializes to OTDS with the command:  
`kubectl logs -n <namespace> <pod name> -c init-otds`  
The config, markup, and publication pods also have an init container that initializes a database within your PostgreSQL instance. The command to see these logs are:  
`kubectl logs -n <namespace> <pod name> -c create-db-user`  

###### Publishing requests unresponsive

The Intelligent Viewing transformation services (asset, config, publication, and publisher) form a hazelcast cluster which is established for communication between these services. If the communication threads get blocked, IV can be unresponsive to publishing requests. In this case, one troubleshooting tactic is to shutdown the IV transformation pods and restart them.  The script otiv/scripts/restartTransformationPods.sh is provided to facilitate this. This script takes a <namespace> argument which indicates the namespace where where this operation is to be performed. There is also a corresponding PowerShell script (otiv/scripts/restartTransformationPods.ps1) for Windows.

### Other Helm Commands

##### List Helm Charts

`helm list --namespace <namespace>`

##### Delete a Chart

The following command removes the kubernetes resources associated with the named helm chart, which in the following command would be otiv. Note that when a chart is deleted, any persistent volumes associated with stateful sets (i.e. postgres, amqp, otds) are not deleted.

`helm delete otiv --namespace <namespace>`

