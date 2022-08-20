FROM debian:buster

LABEL version="1.0"
LABEL description="Wordpress"

EXPOSE 9000

RUN apt-get update  && apt-get upgrade -y

RUN apt-get install -y php-fpm php-mysql mariadb-client wget


RUN mkdir -p /var/www
RUN chmod 777 -R /var/www
 

WORKDIR /var/www
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/init_wordpress.sh .

ENTRYPOINT ["bash", "init_wordpress.sh"]

CMD ["php-fpm7.3", "-v"]