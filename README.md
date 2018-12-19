# DockerNginxAccessDenied

## About : 
This is a simple docker image which is used to 

The purpose of this project is educational only, the goal is to :
- Maintain an Nginx webserver
- Secure an Nginx webserver
- Gain experience with Docker

## Security measures :
- Docker/Dockerfile :
  - Base image "alpine:3.8" has been used in order to have a minimalist base image.
  - Official repository have being used for the base image and the nginx package.
  - Only one service has been installed.
  - No volume has been initialized.
  
- Image :
  - Nginx is running as user "www" which means that once the socket will be open, Nginx will run as "www".

- Nginx : 
  - "server_tokens" variable has been set to "off" in order to display its current version on error pages. (1)
  - Return a 403 response if the user agent string is in the black list defined in "blockuseragents.rules"
  - Disable unwanted HTTP Methods (different than GET, HEAD and POST)
  - Set buffer size limitations 
  - Added "X-Content-Type-Options=nosniff" header to prevents the browser from doing MIME-type sniffing. (2) 
 
(1) It's always better to hide the version of the service which are running as an attacker can use this information in order use a specific vulnerability matching our service with this specific version.
(2) MIME sniffing was, and still is, a technique used by some web browsers (primarily Internet Explorer) to examine the content of a particular asset. An attacker can leverage MIME sniffing to send an XSS attack.

## Updates : 
 - 19 December 2018 : Added "gzip Module". 
 
## Mention : 

Thanks to : 

- @[hellochad](https://codepen.io/hellochad/) for his [Lost in Space Error Page](https://codepen.io/hellochad/pen/weMpgE)
- @[digitalocean](https://github.com/digitalocean/) for their tutorial : [How To Add the gzip Module to Nginx on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-add-the-gzip-module-to-nginx-on-ubuntu-14-04)
