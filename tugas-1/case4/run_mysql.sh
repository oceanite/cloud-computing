#!/bin/sh

docker rm -f mysql4

docker run -dit \
    --name mysql4 \
    -v $(pwd)/dbdata:/var/lib/mysql \
    -v $(pwd)/mysql-init:/docker-entrypoint-initdb.d \
    -e MYSQL_ROOT_PASSWORD=weather123 \
    mysql:8.0-debian
