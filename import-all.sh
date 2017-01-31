#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

for file in ${BASEDIR}/db/mysql/*-structure.sql; do
    filename=$(basename $file)
    dbname=`echo $filename | sed 's/-structure.sql//g'`
    echo "importing $dbname"
    ${BASEDIR}/db/init-db.sh $dbname
done
