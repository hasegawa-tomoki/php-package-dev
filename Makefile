all: up install migrate
.PHONY: all

up:
	docker-compose up -d
.PHONY: up

build:
	docker-compose up -d --build
.PHONY: build

down:
	docker-compose down
.PHONY: down

