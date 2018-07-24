#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

docker-compose pull

if [ ! -f "${REPO_ROOT}/scripts/.username" ] && [ ! -f "${REPO_ROOT}/scripts/.password" ]; then
	${REPO_ROOT}/scripts/update-credentials.sh
fi

./update-db.sh