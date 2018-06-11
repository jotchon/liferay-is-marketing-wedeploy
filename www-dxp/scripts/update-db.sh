#!/bin/bash -x

CONTAINTER_DIR=/docker-entrypoint-initdb.d
CONTAINTER_NAME=${2:-www_dxp_mariadb}
CREDENTIALS=""
DATABASE_URL=$1
INIT_DB_DIR=../mariadb/docker-entrypoint-initdb.d
VOLUME_NAME=${3:-www-dxp_www_dxp_mariadb}

if [ -f ".username" ] && [ -f ".password" ]; then
	CREDENTIALS="-u $(cat .username):$(cat .password)"
fi

docker rm ${CONTAINTER_NAME}
docker volume rm ${VOLUME_NAME}

rm ${INIT_DB_DIR}/*
curl ${CREDENTIALS} -o ${INIT_DB_DIR}/${DATABASE_URL##*/} -fSL ${DATABASE_URL}

docker-compose up ${CONTAINTER_NAME}