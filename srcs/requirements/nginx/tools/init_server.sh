#! /bin/bash
 echo "START OF INIT_SERVER SCRIPT"

 #mkdir -p /var/www/html/wordpress/public_html
 #nginx -t\

cd /etc/nginx/sites-enabled
ln -s ../sites-available/wordpress.conf .

service nginx restart
	tail -f
 exec $@