#!/bin/bash -x

CONTAINTER_DIR=/docker-entrypoint-initdb.d
CONTAINTER_NAME=${2:-www_prod_mariadb}
DATABASE_URL=$1
INIT_DB_DIR=../mariadb/docker-entrypoint-initdb.d
VOLUME_NAME=${3:-liferay-is-marketing-wedeploy_www_prod_mariadb}

docker volume rm ${VOLUME_NAME}

rm ${INIT_DB_DIR}/*
curl -o ${INIT_DB_DIR}/${DATABASE_URL##*/} -fSL ${DATABASE_URL}

docker-compose up ${CONTAINTER_NAME}