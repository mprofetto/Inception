FROM debian:bullseye

RUN apt-get update && apt-get install -y wget && apt-get install -y php7.4 php-fpm php-mysql php-redis mariadb-client 
#RUN apt install -y php-redis
RUN mkdir -p /var/www/html && mkdir -p /run/php/

#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/config.sh
#RUN chmod +x /usr/local/bin/wp/wp-cli.phar

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/bin/config.sh"]
