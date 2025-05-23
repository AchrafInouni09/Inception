#!/bin/bash

echo "script of initing db is starting"

mkdir -p /run/mysqld
mkdir -p /var/mysqld

chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/mysqld

mkdir -p /var/mariadb
chown -R mysql:mysql /var/mariadb


if [ ! -d "/var/mariadb/mysql" ]; then
    echo "maria shoud be initialized"

    mysql_install_db --user=mysql --datadir=/var/mariadb

    mysqld --user=mysql --datadir=/var/mariadb --bootstrap <<EOF
use mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
    echo "maria db initialized"
else
    echo "maria db already initialized"
fi

exec "$@"