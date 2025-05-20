#!/bin/bash

echo "script of initing db is starting"

if [ ! -d "/var/lib/mariadb" ]; then
    echo "maria shoud be initialized"

    maria_install_db --user=mysql

    maria --user=mysql << EOF

use mysql;

EOF
fi