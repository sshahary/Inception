.PHONY: all up down clean

all: up

up:
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -f
	docker volume prune -f