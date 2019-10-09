# Use an official Python runtime as a parent image
FROM alpine:3.8

HEALTHCHECK CMD curl --fail http://192.168.190.122 || exit 1

LABEL maintainer = "t.defise@gmail.com"

EXPOSE 80/tcp

ENTRYPOINT ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf","-g","pid /tmp/nginx.pid;daemon off;"]


RUN apk add --no-cache nginx curl && \
    adduser -D -g 'www' www &&\
    mkdir -p /www/website &&\
    chown -R www:www /var/lib/nginx &&\
    chown -R www:www /www/website

COPY nginx.conf blockuseragents.rules buffer.conf /etc/nginx/
COPY www/website/* /www/website/

USER www

WORKDIR /www/website
