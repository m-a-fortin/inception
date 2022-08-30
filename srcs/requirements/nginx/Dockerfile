FROM alpine:3.15

EXPOSE 443

RUN apk update && apk upgrade && apk add nginx openssl net-tools



RUN mkdir -p /var/www/html
RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/certs

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN openssl req -x509 \ 
				-nodes \
				-sha256 \
				-days 3650 \
				-newkey rsa:2048 \
				-subj "/CN=mafortin.42.fr/C=CA/ST=Quebec/L=Quebec City/O=42 Network/OU=42 Quebec" \
				-keyout /etc/ssl/private/nginx_ssl.key \
				-out /etc/ssl/certs/nginx_cert.crt

CMD ["nginx", "-g", "daemon off;"]
