FROM alpine:3.15

EXPOSE 3306

RUN apk update && apk upgrade

RUN apk add --update mariadb mariadb-client

WORKDIR /tmp/mariadb/

RUN mkdir /run/mysqld

RUN chmod 777 /run/mysqld

COPY tools/db.sh .

ENTRYPOINT ["sh", "db.sh"]

CMD ["\n etst teste aasdasd"]

