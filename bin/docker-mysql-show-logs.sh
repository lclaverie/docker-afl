#!/bin/bash

docker exec -it localdb mysql -u root -proot -e 'SET GLOBAL general_log = "ON"'

docker exec -it localdb mysql -u root -proot -e 'SET GLOBAL general_log_file = "/tmp/mysql.log"'

docker exec -it localdb tail -f /tmp/mysql.log
