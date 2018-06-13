#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

cd ${REPO_ROOT}/www-prod/scripts
./init.sh

cd ${REPO_ROOT}/web-prod/scripts
./init.sh