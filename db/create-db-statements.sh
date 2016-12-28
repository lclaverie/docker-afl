#!/usr/bin/env bash

echo "DROP DATABASE IF EXISTS $1;"

echo "CREATE DATABASE $1;"

./create-user.sh $1

exit