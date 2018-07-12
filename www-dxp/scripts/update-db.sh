#!/bin/bash -x

CONTAINTER_DIR=/docker-entrypoint-initdb.d
CONTAINTER_NAME=${2:-www_dxp_mariadb}
DATABASE_URL=${1:-https://files.liferay.com/private/lrdcom/www_lportal-$(date -v -1d '+%Y-%m-%d')_19-00-PDT.sql.gz}
INIT_DB_DIR=../mariadb/docker-entrypoint-initdb.d
REPO_ROOT=$(git rev-parse --show-toplevel)
VOLUME_NAME=${3:-www-prod_www_dxp_mariadb}

CREDENTIALS="$(source ${REPO_ROOT}/scripts/get-credentials.sh)"

rm ${INIT_DB_DIR}/*
curl ${CREDENTIALS} -o ${INIT_DB_DIR}/${DATABASE_URL##*/} -fSL ${DATABASE_URL}

docker stop ${CONTAINTER_NAME}
docker rm ${CONTAINTER_NAME}
docker volume rm ${VOLUME_NAME}

echo -e "\n\n\n Now starting up the container to source the database. Press CTRL + C when the logs say 'MySQL init process done. Ready for start up.'\n\n\n"
docker-compose up ${CONTAINTER_NAME}