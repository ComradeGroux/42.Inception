#!/bin/bash

sleep 10

if ! wp core is-installed --allow-root ; then
	wp core download --allow-root --force
	wp core install --url="vgroux.42.fr" --title="Inception" --admin_user=$SQL_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root --force
	wp user create $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
	wp config shuffle-salts --allow-root
fi

if wp core is-installed --allow-root ; then
	echo "Wordpress is installed and running"
	php-fpm7.3 -F -R
else
	echo "Wordpress's installation and/or configuration failed"
fi
