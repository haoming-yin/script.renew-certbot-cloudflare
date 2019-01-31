#!/bin/sh

# set server URL
server_url="https://acme-staging-v02.api.letsencrypt.org/directory"
if [ "$ENV" == "prod" ]; then
    server_url="https://acme-v02.api.letsencrypt.org/directory"
fi
echo $server_url

# generate cloudflare credential file
echo "dns_cloudflare_email = $ADMIN_EMAIL" > ./cloudflare.ini
echo "dns_cloudflare_api_key = $CLOUDFLARE_API_KEY" >> ./cloudflare.ini

# run renew command
echo "Start renewing SSL cert ..."

certbot certonly \
--dns-cloudflare \
--dns-cloudflare-credentials ./cloudflare.ini \
--dns-cloudflare-propagation 30 \
-d $DOMAIN \
-m $ADMIN_EMAIL \
--agree-tos \
--server $server_url

# clean up
rm ./cloudflare.ini
echo "Successfully finished!"