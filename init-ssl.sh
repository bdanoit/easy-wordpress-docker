#!/bin/bash
#use the nginx.challenge template to prevent missing certificate error
export NGINX_CONFIG_FILE=nginx.challenge.conf && \
docker compose up -d webserver
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/
#reset to default template
export NGINX_CONFIG_FILE=nginx.conf && \
docker compose up -d webserver
