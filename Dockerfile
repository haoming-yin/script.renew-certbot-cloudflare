FROM certbot/certbot:v0.30.2

RUN pip install certbot-dns-cloudflare

RUN mkdir -p /usr/src
WORKDIR /usr/src

VOLUME [ "/usr/src" ]

ENTRYPOINT [ "./main.sh" ]