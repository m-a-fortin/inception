all: main

main:
	mkdir -p /home/mafortin/data/mariadb/
	mkdir -p /home/mafortin/data/wordpress/
	@docker-compose -f srcs/docker-compose.yml up --build

up:
	@docker compose -f srcs/docker-compose.yml up

down:
	@docker compose -f srcs/docker-compose.yml down

build:
	@docker compose -f srcs/docker-compose.yml build

clean:
	rm -rf /home/mafortin/data/mariadb/*
	rm -rf /home/mafortin/data/wordpress/*
	@docker-compose -f srcs/docker-compose.yml down --rmi all

fclean:	clean

re: fclean all

.PHONY: all up down build clean fclean re