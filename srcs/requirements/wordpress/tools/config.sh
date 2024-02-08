#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already installed"
else
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
	
	#config mariadb info
	sed -i "s/username_here/$DB_ADMIN/g" wp-config-sample.php
	sed -i "s/password_here/$DB_ADMIN_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	
	#config first pages
	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

	#config redis cache
	
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root

fi

/usr/sbin/php-fpm7.4 -F
