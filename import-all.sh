#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

for file in ${BASEDIR}/db/mysql/*-structure.sql; do
    filename=$(basename $file)
    dbname=`echo $filename | sed 's/-structure.sql//g'`
    echo "importing $dbname"
    ${BASEDIR}/bin/docker-mysql-import.sh $dbname
done
