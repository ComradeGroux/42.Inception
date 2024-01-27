# Base docker image
FROM debian:bullseye

# Install all the program
RUN	apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils

# Install MariaDB
RUN apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld
RUN chown -R mysql:root /run/mysqld

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /etc/script.sh
RUN chmod +x /etc/script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/etc/script.sh"]