FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    php7.4-fpm \ 
    php7.4-mysql  && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    sed -i 's/listen \/run\/php\/php7.4-fpm-sock/listen = 0.0.0.9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/htmp && \
RUN echo "<?php echo '<h1>Hello from WordPress container!</h1>'; phpinfo(); ?>" > /var/www/html/index.php


EXPOSE 9000

ENTRYPOINT [ "/usr/sbin/php-fpm7.4", "-F" ]