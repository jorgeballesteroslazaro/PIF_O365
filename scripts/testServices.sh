#!/bin/bash

# Configuración
ALB_URL="http://internal-k8s-dctminternalgroup-525511e572-234219210.eu-south-2.elb.amazonaws.com"
#HOST_HEADER="lab-dokumentu-kudeaketarako.batera.euskadi.eus"
HOST_HEADER_ALB="internal-k8s-dctminternalgroup-525511e572-234219210.eu-south-2.elb.amazonaws.com"
HOST_HEADER_NLB="aws-spa-nlb-pocdocumentum-02-802fb54c3c14ad5c.elb.eu-south-2.amazonaws.com"

# Lista de rutas extraídas de tu Ingress
paths=(
    "/DmMethods/servlet/DoMethod"
    "/ACS/servlet"
    "/thumbsrv/getThumbnail"
    "/D2-Config"
    "/da"
    "/dsearchadmin"
    "/IndexAgent"
    "/dmotdsrest"
    "/otds-admin"
    "/otdsws"
    "/DocumentumWorkflowDesigner"
    "/bpm"
    "/records"
    "/D2-Smartview"
    "/d2-rest"
    "/AdminConsole/"
    "/oes-connector/"
    "/D2"
    "/nlb-health"
)

echo "Probando disponibilidad de servicios en el ALB..."
echo "--------------------------------------------------"

for path in "${paths[@]}"; do
    # Usamos -L para seguir redirecciones y -s para modo silencioso
    # El health check de NLB no requiere el host específico en tu regla, pero lo probamos igual
    
    if [ "$path" == "/nlb-health" ]; then
        current_host="*"
    else
        current_host=$HOST_HEADER_ALB
    fi
	echo "Host: $current_host" "$ALB_URL$path"
    status=$(curl -o /dev/null -s -w "%{http_code}" -H "Host: $current_host" "$ALB_URL$path")

    if [ "$status" == "200" ] || [ "$status" == "302" ] || [ "$status" == "401" ]; then
        echo -e "[OK]  $status - $current_host$path"
    else
        echo -e "[ERR] $status - $current_host$path"
    fi
done

