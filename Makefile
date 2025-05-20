all : build up

build:
	docker compose -f srcs/docker-compose.yml build
up:
	docker compose -f srcs/docker-compose.yml up -d
down:
	docker compose -f srcs/docker-compose.yml down
stop:
	docker compose -f srcs/docker-compose.yml stop
restart:
	docker compose -f srcs/docker-compose.yml restart
ps:
	docker compose -f srcs/docker-compose.yml ps
.PHONY: all build up down