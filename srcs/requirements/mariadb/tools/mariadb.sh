#!/bin/sh

service mariadb start


echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
echo "GRANT SELECT ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_ADMIN'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /run/mysqld/mysqld.pid)

mysqld
