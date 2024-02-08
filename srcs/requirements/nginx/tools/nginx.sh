#!/bin/bash

openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out $CERTS -keyout $KEY -subj "/C=BE/O=19/OU=student/L=Brussels/ST=Brussels/CN=mprofett"

sed -i -e "s%my_server_name%$DOMAIN_NAME%g" /etc/nginx/conf.d/nginx.conf
sed -i -e "s%my_certificates%$CERTS%g" /etc/nginx/conf.d/nginx.conf
sed -i -e "s%my_key%$KEY%g" /etc/nginx/conf.d/nginx.conf

nginx -g "daemon off;"
