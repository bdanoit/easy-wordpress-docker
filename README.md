# WordPress container

## Maintained by Baleze Danoit

---

## Commands

To initialize the server certificate run the following:
docker compose up -d webserver && \
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run

Don't forget to add a crontab for renew-ssl.sh
0 5 * * * /var/www/renew-ssl.sh
