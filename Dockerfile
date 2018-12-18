# Use an official Python runtime as a parent image
FROM alpine:3.8

RUN apk add --no-cache nginx curl

LABEL maintainer = "t.defise@gmail.com"


RUN apk add --no-cache nginx
RUN adduser -D -g 'www' www &&\
    mkdir /www &&\
    chown -R www:www /var/lib/nginx &&\
    chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY www/* /www/

HEALTHCHECK CMD curl --fail http://192.168.190.122 || exit 1

# Make port 123 available to the world outside this container
EXPOSE 80/tcp
WORKDIR /www
USER www
ENTRYPOINT ["/usr/sbin/nginx", "-g", "pid /tmp/nginx.pid;daemon off;"]
