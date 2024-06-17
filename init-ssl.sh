#!/bin/bash
docker compose kill webserver
docker compose run -d -P -e NGINX_CONFIG_FILE=nginx.challenge.conf webserver
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/
