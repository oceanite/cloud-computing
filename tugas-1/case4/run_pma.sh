#!/bin/sh

docker rm -f pma4

docker container run \
    -dit \
    --name pma4 \
    --link mysql4 \
    -p 10001:80 \
    -e PMA_HOST=mysql4 \
    phpmyadmin:5.2.1-apache
