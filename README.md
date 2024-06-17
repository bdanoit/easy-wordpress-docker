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
To initialize your ssl certificate run the following commands. The NGINX_CONFIG_FILE env variable is updated in order to process the challenge. Note: --dry-run is included for testing purposes, remove it once you have tested your setup
```
export NGINX_CONFIG_FILE=nginx.challenge.conf && \
docker compose up -d webserver
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run
```
Once you have the certificate, reset your NGINX_CONFIG_FILE to the default
```
export NGINX_CONFIG_FILE=nginx.conf && \
docker compose up -d webserver
```
## Certificate renewal
You can use the included renew-ssl.sh with crontab (change the paths as needed)
```
0 5 * * * /var/www/renew-ssl.sh
```

