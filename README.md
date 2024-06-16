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
To initialize the server certificate run the following (remove --dry-run once you have tested your setup):
```
docker compose kill webserver
docker compose run -d -e NGINX_CONFIG_FILE=nginx.challenge.conf webserver
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run
```
Don't forget to add a crontab for renew-ssl.sh
```
0 5 * * * /var/www/renew-ssl.sh
```
