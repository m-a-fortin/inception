
FROM alpine:3.15

EXPOSE 443

RUN apk update && apk upgrade

RUN apk add nginx openssl

#-g daemon off; option allows us to run nginx in foreground allowing us to loop the container
#src = https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
CMD ["nginx", "-g", "daemon off;"]

