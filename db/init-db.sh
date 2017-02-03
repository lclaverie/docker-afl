#!/usr/bin/env bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

$BASEDIR/create-db-statements.sh $1 > /var/data/sql/db-creation.sql

cat $BASEDIR/mysql/$1-structure.sql >> /var/data/sql/db-creation.sql
cat $BASEDIR/mysql/$1-data.sql >> /var/data/sql/db-creation.sql

mysql -u root -proot < /var/data/sql/db-creation.sql

exit
