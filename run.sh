#!/bin/bash

docker ps -a
docker stop nginx
docker rm nginx
docker run --name=nginx      \
           --detach=true          \
           --publish=80:80/tcp  \
           --publish=443:443/tcp \
           tdefise/nginx
