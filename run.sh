#!/bin/bash

git pull
docker build -t tdefise/nginx .
docker stop nginx
docker rm nginx
docker run --name=nginx      \
           --detach=true          \
           --publish=80:80/tcp  \
           tdefise/nginx
