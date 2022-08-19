
FROM debian:buster

EXPOSE 443

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

COPY ./conf/default.conf ./etc/nginx/http.d/default.conf

RUN cat ./etc/nginx/http.d/default.conf

#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -subj "/CN=mafortin.42.fr/C=CA/ST=Quebec/L=Quebec City/O=42 Network/OU=42 Quebec" \
 -keyout /etc/ssl/private/nginx-selfsigned.key -out \
 /etc/ssl/certs/nginx-selfsigned.crt

#-g daemon off; option allows us to run nginx in foreground allowing us to loop the container
#src = https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
CMD ["nginx", "-g", "daemon off;"]

