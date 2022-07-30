FROM alpine:3.15

EXPOSE 3306

RUN apk update && apk upgrade

RUN apk add --update mariadb mariadb-client

WORKDIR /tmp/mariadb/

COPY tools/db_script.sh .

#ENTRYPOINT ["sh", "db_script.sh"]

CMD ["mysqld"]
