#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)

echo Enter your username for mirrors.liferay
read username
echo $username > ${REPO_ROOT}/scripts/.username

echo Enter your password for mirrors.liferay
read -s password
echo $password > ${REPO_ROOT}/scripts/.password

echo Thanks, your username and password have been stored locally.
