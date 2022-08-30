#! /bin/bash

echo "START OF INIT_WORDPRESS SCRIPT"

if [ ! -d "./wp_is_installed.tmp" ]; then
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz
	echo "WORDPRESS DOWNLOADED AND EXTRACTED"
	mv wordpress html
	touch ./wp_is_installed.tmp
	wp core download --allow-root --path="/var/www/html"
fi

# loop to wait for mariadb to start
echo "WAITING FOR MARIADB CLIENT TO CONNECT"
for i in {0..30}; do
    if mariadb -hmariadb -u$DB_USER -p$DB_PASSWORD --database=$DB_NAME <<<'SELECT 1;' &>/dev/null; then
        break
    fi
        sleep 2
	done
if [ "$i" = 30 ]; then
        echo "ERROR WHILE CONNECTING TO DB"
		exit
	fi
echo "CONNECTED"
echo "CREATING WP CONFIG"
wp core download --allow-root --path="/var/www/html"


wp config create \
			--allow-root \
			--dbname=$DB_NAME \
			--dbuser=$DB_USER \
			--dbpass=$DB_PASSWORD \
			--dbhost=mariadb \
			--dbcharset="utf8" \
			--dbcollate="utf8_general_ci" \
			--path="/var/www/html"
echo "CONFIG CREATED"
echo "CORE INSTALL"
		wp 	core install \
			--allow-root \
			--title="Wordpress" \
			--admin_name="${DB_USER}" \
			--admin_password="${DB_PASSWORD}" \
			--admin_email="wordpress@superuser.com" \
			--skip-email \
			--url="${DOMAIN_NAME}" \
			--path="/var/www/html" 
echo "INSTALL DONE"
echo "CREATING USER"
		wp 	user create \
			--allow-root \
			$WP_USER \
			$WP_EMAIL \
			--role=author \
			--user_pass=$DB_PASSWORD \
			--path="/var/www/html" 
echo "USER CREATED"
echo "LAUNCHING PHP-FPM"
$@
