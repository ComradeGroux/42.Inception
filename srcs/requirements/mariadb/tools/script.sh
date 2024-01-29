#!/bin/bash

# print command
set -x

service mysql start

touch file
chmod 777 file

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "GRANT ALL ON *.* TO '$SQL_ADMIN_USER'@'%' IDENTIFIED BY '$SQL_ADMIN_PASSWORD' WITH GRANT OPTION;" >> file
echo "FLUSH PRIVILEGES;" >> file
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> file
echo "GRANT ALL ON wordpress.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"  >> file
echo "FLUSH PRIVILEGES;" >> file

cat file

mysqld --user=mysql --verbose --bootstrap < file
rm file

exec mysqld