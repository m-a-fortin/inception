#! /bin/bash

echo "START OF INIT_DB SCRIPT"
if [ ! -d "./var_mysql.tmp" ]; then
	echo "INSTALLING DB"
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	mysqld --user=mysql --datadir=/var/lib/mysql &
	sleep 5
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
	echo "ROOT PASSWORD SET"
	mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
	echo "DB CREATED"
	mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS'${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
	echo "USER CREATED"
	mysql -u root -p$DB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	echo "PRIVILEGES GRANTED"
	mysql -u root -p$DB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	touch ./var_mysql.tmp
	killall mysqld
fi
echo "MARIADB SETUP COMPLETED"
echo "MARIADB SERVER LISTENING ON 3306"
exec $@
