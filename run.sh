#!/bin/bash

git pull
docker build -t tdefise/nginx .
docker stop nginx
docker rm nginx
docker run --name=nginx            \
           --detach=true           \
           --publish=80:80/tcp     \
           --cap-drop=setpcap      \
           --cap-drop=setfcap      \
           --cap-drop=audit_write  \
           --cap-drop=mknod        \
           --cap-drop=fsetid       \
           --cap-drop=fowner       \
           tdefise/nginx
