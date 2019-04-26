#!/bin/bash
HOST=mabwaf-bdd1
DATABASE=$1
SOURCE_DB="$DATABASE"
HOST_USER=$SOURCE_DB
HOST_PASS=$SOURCE_DB
BASEDIR=$(cd "$(dirname "$0")" && pwd)
TARGETDIR="db/mysql"
LOCAL_USER=root

CONF_FILE="${BASEDIR}/../conf/mysql/${DATABASE}.conf"
MYSQL_CONFIG=""

EXCLUDED_TABLES=(
logs
_DEV_customers
_DEV_customers_addresses
_DEV_customers_tokens
orders_baskets
orders_details
)

IGNORED_TABLES_STRING=''
for TABLE in "${EXCLUDED_TABLES[@]}"
do :
   IGNORED_TABLES_STRING+=" --ignore-table=${SOURCE_DB}.${TABLE}"
done

if [ -f "${CONF_FILE}" ]
then
  echo "loading ${CONF_FILE}"
  MYSQL_CONFIG=`cat ${CONF_FILE}`
fi

echo "Dumping $DATABASE structure"
docker exec -it localdb mysqldump --compress --quick --skip-add-locks --single-transaction -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB --no-data > ${TARGETDIR}/${DATABASE}-structure.sql
echo "Dumping $DATABASE data"
docker exec -it localdb mysqldump --compress --quick --skip-add-locks --single-transaction --no-create-info -h $HOST -u $HOST_USER -p$HOST_PASS $SOURCE_DB $MYSQL_CONFIG ${IGNORED_TABLES_STRING} > ${TARGETDIR}/${DATABASE}-data.sql

exit

echo "done"

exit
