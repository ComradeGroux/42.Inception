# Base docker image
FROM debian:bullseye

# Install the base programs
RUN	apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

# Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz
RUN mkdir /var/www
RUN chmod 777 /var/www
RUN mv latest.tar.gz /var/www
RUN cd /var/www && tar xfz latest.tar.gz && rm latest.tar.gz
RUN chmod 755 /var/www/wordpress

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php
RUN chmod 755 /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/auto_config_wp.sh /etc/auto_config_wp.sh

RUN chmod +x /etc/auto_config_wp.sh

EXPOSE 9000

WORKDIR /var/www/wordpress
RUN mv wp-config-sample.php wp-config.php

CMD [ "sh", "/etc/auto_config_wp.sh" ]