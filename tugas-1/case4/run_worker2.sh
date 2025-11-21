#!/bin/sh

docker rm -f worker_report

docker container run \
    -dit \
    --name worker_report \
    --link mysql4 \
    -v $(pwd)/worker2:/script \
    -v $(pwd)/reports:/reports \
    alpine:3.18 \
    /bin/sh /script/daily_report.sh
