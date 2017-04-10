#!/usr/bin/env bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

$BASEDIR/create-db-statements.sh $1 > /tmp/db-creation.sql

cat $BASEDIR/mysql/$1-structure.sql >> /tmp/db-creation.sql
cat $BASEDIR/mysql/$1-data.sql >> /tmp/db-creation.sql

mysql -u root -proot < /tmp/db-creation.sql

exit
