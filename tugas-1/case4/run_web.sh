#!/bin/sh

docker rm -f webdash4

docker container run \
    -dit \
    --name webdash4 \
    -p 9999:9999 \
    -v $(pwd)/reports:/reports \
    -v $(pwd)/web:/app \
    python:3.13.0a1-alpine3.17 \
    python3 /app/server.py
