#!/bin/bash

DATABASE=$1

echo "loading structure"
docker exec -it localdb /opt/scripts/db/init-db.sh $DATABASE
