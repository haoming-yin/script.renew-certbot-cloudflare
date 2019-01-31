# script.renew-certbot-cloudflare
Scripts integrating Certbot to renew SSL certificates for DNS records on Cloudflare

## Required Environment Variables

|Env|Description|
|:---:|:---:|
|DOMAIN| The domain to be renewed |
|ADMIN_EMAIL| Cloudflare username |
|CLOUDFLARE_API_KEY| Cloudflare API key|
|ENV| Either `prod` or `staging`|

# Usage

Run commands,
```bash
docker build -t certbot .
docker run -v /etc/letsencrypt:/etc/letsencrypt -v $(pwd)/scripts:/usr/src certbot
```