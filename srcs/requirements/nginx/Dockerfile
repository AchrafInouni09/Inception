FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y nginx openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/generate_ssl.sh /usr/local/bin

RUN chmod +x /usr/local/bin/generate_ssl.sh

EXPOSE 443

ENTRYPOINT ["/bin/bash", "-c", "  generate_ssl.sh && nginx -g \"daemon off;\""]