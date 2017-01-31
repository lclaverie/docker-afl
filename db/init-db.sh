#!/usr/bin/env bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

$BASEDIR/create-db-statements.sh $1 > /var/data/sql/db-creation.sql

cat $BASEDIR/mysql/$1-structure.sql >> /var/data/sql/db-creation.sql
cat $BASEDIR/mysql/$1-data.sql >> /var/data/sql/db-creation.sql

echo "#!/bin/bash" > /var/data/sql/init-db.sh
echo 'mysql -u root -proot < /var/sql/db-creation.sql' >> /var/data/sql/init-db.sh

chmod +x /var/data/sql/init-db.sh

docker exec -it localdb /var/sql/init-db.sh

exit
