# Inception

## Project Overview

This project sets up a secure, containerized web infrastructure using Docker Compose. The stack includes NGINX (with SSL), WordPress (with PHP-FPM), and MariaDB, each running in its own dedicated container. All containers are built from custom Dockerfiles based on Debian, and no pre-built images (except base OS) are used.

## Features

- **NGINX**: Serves as the single entrypoint, listening on port 443 with TLSv1.2/1.3 only.
- **WordPress**: Runs with PHP-FPM, without NGINX, in its own container.
- **MariaDB**: Dedicated container for the database, no web server.
- **Volumes**: 
  - One for WordPress database data.
  - One for WordPress website files.
- **Networking**: All containers are connected via a custom Docker network.
- **Environment Variables**: All sensitive data is managed via a `.env` file.
- **Automatic Restart**: Containers restart on failure.
- **No hacky entrypoints**: Containers use proper daemons, not infinite loops or `tail -f`.

