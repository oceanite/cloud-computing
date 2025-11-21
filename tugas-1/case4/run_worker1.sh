#!/bin/sh

docker rm -f worker_weather

docker container run \
    -dit \
    --name worker_weather \
    --link mysql4 \
    -v $(pwd)/worker1:/script \
    alpine:3.18 \
    /bin/sh /script/fetch_weather.sh
