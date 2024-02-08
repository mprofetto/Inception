FROM debian:bullseye

RUN apt update && apt install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client
RUN apt-get install -y net-tools
RUN mkdir -p /var/www/html
RUN mkdir -p /run/php/
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -P /var/www/html 
RUN cp /var/www/html/adminer-4.8.1.php /var/www/html/index.php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"] 
