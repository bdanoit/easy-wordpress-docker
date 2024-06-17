# Easy WordPress Docker Container
Setup a single-tenant docker container complete with Wordpress FPM, Nginx, MySQL, Certbot, and Redis

---

## Setup
Create your .env (see example.env)
```
DB_NAME=mydb
DB_USER=myuser
DB_PASS=mypass
HOSTNAME=example.com
```
## Setting up certificates
To initialize your ssl certificate run the following
```
export NGINX_CONFIG_FILE=nginx.challenge.conf && \
docker compose up -d webserver
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run
```
*Note: --dry-run is included for testing purposes, remove it once you have tested your setup*

 
Once you have the certificate, reset your NGINX_CONFIG_FILE to the default
```
export NGINX_CONFIG_FILE=nginx.conf && \
docker compose up -d webserver
```
## Certificate renewal
Renew the certificate
```
docker compose run --rm certbot renew
```
Test and reload nginx
```
docker compose exec webserver nginx -t && \
docker compose exec webserver nginx -s reload
```
You can use the included renew-ssl.sh in crontab, make sure to change the paths as needed
```
0 5 * * * /var/www/renew-ssl.sh
```

