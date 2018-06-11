#!/bin/bash

echo Enter your username for mirrors.liferay
read username
echo $username > .username

echo Enter your password for mirrors.liferay
read -s password
echo $password > .password

echo Thanks, your username and password have been stored locally.
