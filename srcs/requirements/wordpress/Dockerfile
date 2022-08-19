FROM debian:buster

EXPOSE 9000

RUN apk update && apk upgrade

RUN apk add php7-fpm php7-common php7-mysqli \
php7-xml php7-xmlrpc php7-curl php7-gd \
php7-imagick php7-cli php7-dev php7-imap \
php7-mbstring php7-opcache php7-redis \
php7-soap php7-zip

CMD ["php-fpm7", "-v"]
  