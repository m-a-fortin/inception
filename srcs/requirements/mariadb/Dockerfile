
FROM debian:buster


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB"

COPY tools/db.sh .
ENTRYPOINT ["sh", "db.sh"]

#CMD ["mysqld", "--bind-adress=0.0.0.0"]


