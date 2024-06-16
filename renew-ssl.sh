#!/bin/bash
docker compose -f /var/www/docker-compose.yml run --rm certbot renew
docker compose -f /var/www/docker-compose.yml exec webserver nginx -t && docker compose -f /var/www/docker-compose.yml exec webserver nginx -s reload
