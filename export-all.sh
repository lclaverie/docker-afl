#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

for file in ${BASEDIR}/conf/mysql/*conf; do
    filename=$(basename $file)
    dbname=`echo $filename | sed 's/.conf//g'`
    echo "exporting $dbname"
    ${BASEDIR}/bin/docker-mysql-export.sh $dbname
done
