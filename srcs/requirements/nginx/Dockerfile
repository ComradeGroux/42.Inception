# Base docker image
FROM debian:bullseye

# Install all the program
RUN	apt-get update
RUN apt-get upgrade
RUN apt-get install apt-utils
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# Create certif + key SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-out /etc/ssl/certs/vgroux.crt \
	-keyout /etc/ssl/private/vgroux.key \
	-subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=vgroux/CN=vgroux/";

# Nginx config
RUN mkdir -p /var/www/html/
RUN chmod 775 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Expose port
EXPOSE 443

# Entrypoint
CMD [ "nginx", "-g", "daemon off;"]