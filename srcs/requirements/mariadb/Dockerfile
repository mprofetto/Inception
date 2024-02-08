FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/mariadb.sh

CMD ["/usr/local/bin/mariadb.sh"]

