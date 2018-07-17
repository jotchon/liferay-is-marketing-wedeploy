#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

# Delete every Docker container
docker rm -f $(docker ps -a -q)

# Delete every Docker image
docker rmi -f $(docker images -q)

docker-compose pull

if [ ! -f "${REPO_ROOT}/scripts/.username" ] && [ ! -f "${REPO_ROOT}/scripts/.password" ]; then
	${REPO_ROOT}/scripts/update-credentials.sh
fi

./update-db.sh