FROM debian:bullseye

RUN apt update && apt install -y nginx && apt install -y openssl
RUN mkdir /etc/nginx/ssl && mkdir -p run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./tools/nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/nginx.sh

ENTRYPOINT [ "/usr/local/bin/nginx.sh" ]
