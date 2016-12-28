#!/usr/bin/env bash

USER_NAME=$1

echo "DROP DATABASE IF EXISTS $1;"

echo "CREATE DATABASE $1;"

echo "USE $1;"

echo "DROP USER IF EXISTS '$USER_NAME'@'%';"

echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_NAME' ;"

echo "GRANT ALL PRIVILEGES ON \`$USER_NAME\`.* TO '$USER_NAME'@'%';"

exit