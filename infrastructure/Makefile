# Infrastructure
INFRASTRUCTURE_COMPOSE_FILE=docker-compose.yml

.PHONY: all infra networks

all: networks infra

infra: networks
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

networks:
	docker network create microservice-network
	docker network create street-group-network

stop:
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) down
	docker network rm microservice-network || true
	docker network rm street-group-network || true
