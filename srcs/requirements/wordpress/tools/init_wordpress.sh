#! /bin/bash

echo "START OF INIT_WORDPRESS SCRIPT"

DB_NAME="wordpress_db"
DB_USER="mafortin"
DB_PASSWORD='pass'
DB_ROOT_PASSWORD='root'

if [ ! -d "./wp_is_installed.tmp" ]; then
	curl -LO https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	echo "WORDPRESS DOWNLOADED AND EXTRACTED"
	mv wordpress html
	touch ./wp_is_installed.tmp

fi

tail -f
