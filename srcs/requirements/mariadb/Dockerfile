FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY tools/init_db.sh /usr/local/bin/

COPY conf/50-server.conf /etc/mysql/mariadb.conf.d/

RUN chmod +x  /usr/local/bin//init_db.sh

EXPOSE 3306

ENTRYPOINT ["init_db.sh"]
CMD ["mysqld_safe"]