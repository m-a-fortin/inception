
FROM debian:buster


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client 

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB"

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh .
ENTRYPOINT ["bash", "init_db.sh"]

CMD ["mysqld"]


