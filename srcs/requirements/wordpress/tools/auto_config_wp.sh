#!/bin/bash

if ! wp core is-installed --allow-root ; then
	wp core download --allow-root --force
	wp config create --dbname=wordpress --dbuser=$SQL_ADMIN_USER --dbpass=$SQL_ADMIN_PASSWORD --dbhost=mariadb --allow-root --force
	wp core install --url="vgroux.42.fr" --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
	wp config shuffle-salts --allow-root
fi

if wp core is-installed --allow-root ; then
	echo "Wordpress is installed and running"
	php-fpm7.4 -F -R
else
	echo "Wordpress's installation and/or configuration failed"
fi
