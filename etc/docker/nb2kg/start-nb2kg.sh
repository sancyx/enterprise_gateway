#!/bin/bash

export NB_PORT=${NB_PORT:-8888}

export KG_HTTP_USER=${KG_HTTP_USER:-jovyan}
export KG_REQUEST_TIMEOUT=${KG_REQUEST_TIMEOUT:-180}
export KERNEL_USERNAME=${KG_HTTP_USER}

export KERNEL_LAUNCH_TIMEOUT=360

export KG_URL="http://enterprise-gateway.kubeflow.svc.cluster.local:8888"

echo "Starting nb2kg against gateway: " ${KG_URL}
echo "Nootbook port: " ${NB_PORT}
echo "Kernel user: " ${KERNEL_USERNAME}

echo "${@: -1}"


exec /usr/local/bin/start-notebook.sh --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX} $*
