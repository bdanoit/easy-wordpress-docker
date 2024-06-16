#!/bin/bash
#cat .env | grep HOSTNAME= | tr -d HOSTNAME= | \
docker compose up -d webserver && \
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run
