#!/usr/bin/env bash
set -euo pipefail

# === Configuración ===
ACCOUNT_ID="594171188460"
REGION="eu-south-2"
ECR_REPO="aws-spa-ecr-pocdocumentum-02"   # repo único existente en tu cuenta
SRC_REGISTRY="registry.opentext.com"

ECR_REGISTRY="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com"
TARGET_REPO_URI="${ECR_REGISTRY}/${ECR_REPO}"

# === Login a ECR ===
echo ">> Haciendo login a ECR en ${REGION} para ${ECR_REGISTRY}..."
aws ecr get-login-password --region "${REGION}" | docker login --username AWS --password-stdin "${ECR_REGISTRY}"

# === Lista de imágenes OpenText (nombre:tag) ===
# NOTA: He corregido las líneas con espacios, usando ':' como separador de tag.
IMAGES=(
"ot-dctm-admin-console:25.4"
"ot-dctm-records-darinstallation:25.4.1"
"ot-dctm-content-connect:25.4"
"ot-dctm-content-connect-dbinit:25.4"
"ot-dctm-bpm-installer:25.4"
"ot-dctm-tomcat:25.4"
"ot-dctm-server:25.4.1"
"ot-dctm-fluentd:25.4"
"ot-dctm-dsis:25.4.1"
"ot-dctm-client-installer:25.4.1"
"ot-dctm-client-config:25.4.1"
"ot-dctm-client-classic:25.4.1"
"ot-dctm-client-smartview:25.4.1"
"ot-dctm-client-ijms:25.4.1"
"ot-dctm-client-mobile:25.4.1"
"ot-dctm-client-rest:25.4.1"
"ot-dctm-cmis:25.4.1"
"ot-dctm-dfs:25.4.1"
"ot-dctm-rest:25.4.1"
"ot-dctm-admin:25.4.1"
"ot-dctm-admin-tomcat:25.4.1"
"ot-dctm-records:25.4.1"
"ot-dctm-recordsdarinstallation:25.4.1"
"ot-dctm-rqm:25.4.1"
"ot-dctm-workflow-designer:25.4.1"
"ot-dctm-bpm-installer:25.4.1"   # (duplicada en tu lista original; la dejo por si quieres forzar la 25.4.1)
"ot-dctm-xda:25.4.1"
"ot-dctm-bps:25.4.1"
"ot-dctm-content-fetcher:25.4"    # corregido
"ot-dctm-search-parser:25.4"      # corregido
"dctm-xplore-cps:22.1.14"         # corregido
"dctm-xplore-indexagent:22.1.14"  # corregido
"dctm-xplore-indexserver:22.1.14" # corregido
"ot-dctm-dms:25.4.1"
"ot-dctm-reports-client:25.4.1"
"ot-dctm-reports-base:25.4.1"
"ot-dctm-reports-installer:25.4.1"
"ot-dctm-smartviewm365:25.4.1"
"ot-dctmsmartviewm365customjar:25.4.1"
"ot-dctm-smartviewm365-ns:25.4.1"
"ot-dctm-oesconnector:25.4.1"
"ot-dctm-content-connect:25.4.1"      # también quieres esta versión
"ot-dctm-content-connectdbinit:25.4.1"
"ot-dctm-dcc-consul:25.4.1"
"ot-dctm-dcc-dbschema:25.4.1"
"ot-dctm-dccmetadataservice:25.4.1"
"ot-dctm-dcccorenotificationservice:25.4.1"
"ot-dctm-dcc-syncagent:25.4.1"
"ot-dctm-dcc-syncnsharemanual:25.4.1"
"ot-dctm-dcc-mailservice:25.4.1"
"ot-dctm-dccdarinitcontainer:25.4.1"
"ot-dctm-assap:25.4.1"
"ot-dctm-assap-ilm:25.4.1"
"ot-dctm-cssap:25.4.1"
"ot-dctm-ijms:25.4.1"
"otawg:25.4.1"
"otawg-init:25.4.1"
"otiv-amqp:25.4.1"
"otiv-asset:25.4.1"
"otiv-config:25.4.1"
"otiv-highlight:25.4.1"
"otiv-markup:25.4.1"
"otiv-publication:25.4.1"
"otiv-init-otds:25.4.1"
"otiv-publisher:25.4.1"
"otiv-viewer:25.4.1"
"ot-dctm-tomcat:25.4.1"
)

# === Función auxiliar: pull, tag, push ===
process_image () {
  local name_tag="$1"
  local name="${name_tag%%:*}"   # antes de ':'
  local tag="${name_tag##*:}"    # después de ':'

  local src="${SRC_REGISTRY}/${name}:${tag}"
  local target_tag="${name}-${tag}"      # ej: ot-dctm-client-installer-25.4
  local dest="${TARGET_REPO_URI}:${target_tag}"

  echo ""
  echo "=============================="
  echo ">> Pull  : ${src}"
  docker pull "${src}"

  echo ">> Tag   : ${src}  ->  ${dest}"
  docker tag "${src}" "${dest}"

  echo ">> Push  : ${dest}"
  docker push "${dest}"
}

# === Bucle principal ===
for it in "${IMAGES[@]}"; do
  process_image "${it}"
done

echo ""
echo "✅ Listo. Todas las imágenes han sido subidas a:"
echo "   ${TARGET_REPO_URI}  (con tags del tipo nombreimagen-versión)"

