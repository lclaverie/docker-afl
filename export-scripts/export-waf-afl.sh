#!/bin/bash

HOST=mabwaf-bdd1
DATABASE=waf_afl
SOURCE_DB="$DATABASE"
HOST_USER=$SOURCE_DB
HOST_PASS=$SOURCE_DB
BASEDIR=$(cd "$(dirname "$0")" && pwd)
TARGETDIR="$BASEDIR/../db/mysql/"
LOCAL_USER=root

echo "Dumping $DATABASE"
mysqldump --compress --quick --skip-add-locks --single-transaction -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB --no-data > ${TARGETDIR}/${DATABASE}-structure.sql
mysqldump --compress --quick --skip-add-locks --single-transaction -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB --ignore-table=waf_afl.customers_addresses --ignore-table=waf_afl.customers --ignore-table=waf_afl.logs --ignore-table=waf_afl.orders_addresses --ignore-table=waf_afl.orders_baskets --ignore-table=waf_afl.orders_details --ignore-table=waf_afl._DEV_orders_addresses --ignore-table=waf_afl._DEV_orders_baskets --ignore-table=waf_afl._DEV_orders_details > ${TARGETDIR}/${DATABASE}-data.sql

exit

echo "done"

exit
