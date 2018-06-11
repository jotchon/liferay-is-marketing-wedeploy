#!/bin/bash -x

CONTAINTER_DIR=/docker-entrypoint-initdb.d
CONTAINTER_NAME=${2:-www_prod_mariadb}
CREDENTIALS=""
DATABASE_URL=${1:-https://files.liferay.com/private/lrdcom/www_lportal-$(date -v -1d '+%Y-%m-%d')_19-00-PDT.sql.gz}
INIT_DB_DIR=../mariadb/docker-entrypoint-initdb.d
VOLUME_NAME=${3:-www-prod_www_prod_mariadb}

if [ -f ".username" ] && [ -f ".password" ]; then
	CREDENTIALS="-u $(cat .username):$(cat .password)"
fi

docker rm ${CONTAINTER_NAME}
docker volume rm ${VOLUME_NAME}

rm ${INIT_DB_DIR}/*
curl ${CREDENTIALS} -o ${INIT_DB_DIR}/${DATABASE_URL##*/} -fSL ${DATABASE_URL}

docker-compose up ${CONTAINTER_NAME}