#!/bin/bash

HOST=mabwaf-bdd1
DATABASE=waf_aflpro
SOURCE_DB="$DATABASE"
HOST_USER=$SOURCE_DB
HOST_PASS=$SOURCE_DB
BASEDIR=$(cd "$(dirname "$0")" && pwd)
TARGETDIR="$BASEDIR/../db/mysql/"
LOCAL_USER=root

echo "Dumping $DATABASE"
mysqldump --compress --quick --skip-add-locks --single-transaction -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB --no-data > ${TARGETDIR}/${DATABASE}-structure.sql
mysqldump --compress --quick --skip-add-locks --single-transaction -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB --ignore-table=waf_aflpro.addresses --ignore-table=waf_aflpro.customers --ignore-table=waf_aflpro.logs_notices --ignore-table=waf_aflpro.notices --ignore-table=waf_aflpro._DEV_notices > ${TARGETDIR}/${DATABASE}-data.sql

exit

echo "done"

exit
