#!/usr/bin/env bash
set -euo pipefail

# === Configuración ===
ACCOUNT_ID="594171188460"
REGION="eu-south-2"
ECR_REPO="aws-spa-ecr-pocdocumentum-02"
SRC_REGISTRY="registry.opentext.com"

ECR_REGISTRY="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com"
TARGET_REPO_URI="${ECR_REGISTRY}/${ECR_REPO}"

# === Login a ECR ===
echo ">> Haciendo login a ECR en ${REGION} para ${ECR_REGISTRY}..."
aws ecr get-login-password --region "${REGION}" \
  | docker login --username AWS --password-stdin "${ECR_REGISTRY}"

# === Lista de imágenes OpenText (nombre:tag) ===
IMAGES=(
#"ot-dctm-client-rest:25.4.1"
#"ot-dctm-client-smartview:25.4.1"
"ot-dctm-smartviewm365customjar-25.4.1"
#"ot-dctm-client-config:25.4.1"
#"ot-dctm-tomcat:25.4.1"
#"ot-dctm-dsis:25.4.1"
#"ot-dctm-rest:25.4.1"
#"ot-dctm-dcme-installer:25.4.1"
#"ot-dctm-lswfd-initcontainer:25.4.1"
#"ot-dctm-content-connect:25.4.1"
#"ot-dctm-content-connect-dbinit:25.4.1"
#"ot-dctm-bpm-installer:25.4.1"
#"ot-dctm-bpm-installer:25.4.1"
#"ot-dctm-dcc-syncnshare-manual:25.4.1"
#"ot-dctm-dcc-dbschema:25.4.1"
#"ot-dctm-reports-client:25.4.1"
#"ot-dctm-ijms:25.4.1"
#"ot-dctm-client-ijms:25.4.1"
#"ot-dctm-admin-console:25.4"
#"dctm-xplore-indexserver:22.1.14"
#"dctm-xplore-indexagent:22.1.14"
#"dctm-xplore-cps:22.1.14"
#"ot-dctm-smartviewm365:25.4.1"
#"ot-dctm-smartviewm365-ns:25.4.1"
#"ot-dctm-oesconnector:25.4.1"
#"ot-dctm-bps:25.4.1"
#"ot-dctm-xda:25.4.1"
#"ot-dctm-client-ijms:25.4.1"
#"ot-dctm-client-installer:25.4.1"
#"ot-dctm-client-mobile:25.4.1"
#"ot-dctm-cmis:25.4.1"
#"ot-dctm-content-connect:25.4"
#"ot-dctm-content-connect-dbinit:25.4"
#"ot-dctm-dfs:25.4.1"
#"ot-dctm-dsis:25.4"
#"ot-dctm-fluentd:25.4"
#"ot-dctm-oesconnector:25.4.1"
#"ot-dctm-rest:25.4.1"
#"ot-dctm-server:25.4.1"
#"ot-dctm-tomcat:25.4"
#"ot-dctm-admin-tomcat:25.4.1"
#"ot-dctm-client-classic:25.4.1"
#"ot-dctm-admin:25.4.1"
#"ot-dctm-bpm-installer:25.4"
#"ot-dctm-records-darinstallation:25.4.1"
#"ot-dctm-rest:25.4"
#"ot-dctm-workflow-designer:25.4.1"
#"otds-server:25.4.1"
#"ot-dctm-records:25.4.1"
)

# === Función auxiliar: pull, tag, push, borrado ===
process_image () {
  local name_tag="$1"
  local name="${name_tag%%:*}"
  local tag="${name_tag##*:}"

  local src="${SRC_REGISTRY}/${name}:${tag}"
  local target_tag="${name}-${tag}"
  local dest="${TARGET_REPO_URI}:${target_tag}"

  echo ""
  echo "=============================="
  echo ">> PULL : ${src}"
  docker pull "${src}"

  echo ">> TAG  : ${src} -> ${dest}"
  docker tag "${src}" "${dest}"

  echo ">> PUSH : ${dest}"
  docker push "${dest}"

  echo ">> DELETE local :"
  docker rmi "${src}" || true
  docker rmi "${dest}" || true
}

# === Bucle principal ===
for it in "${IMAGES[@]}"; do
  process_image "${it}"
done

echo ""
echo "✅ Listo. Todas las imágenes han sido subidas y borradas localmente."
echo "   Repositorio en ECR: ${TARGET_REPO_URI}"

