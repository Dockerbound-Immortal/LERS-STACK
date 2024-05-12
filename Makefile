# Infrastructure
INFRASTRUCTURE_COMPOSE_FILE=infrastructure/docker-compose.yml

# Street Group
STREET_GROUP_CLIENT_COMPOSE_FILE=services/homeowner-names/client/docker-compose.yml
STREET_GROUP_API_COMPOSE_FILE=services/homeowner-names/api/docker-compose.yml

.PHONY: all infra street-group networks dev stop client api

all: networks street-group infra

dev: networks street-group

street-group: networks
	cd services/homeowner-names/client && yarn install
	cd services/homeowner-names/api/src && composer install
	docker-compose -f $(STREET_GROUP_CLIENT_COMPOSE_FILE) up --build -d
	docker-compose -f $(STREET_GROUP_API_COMPOSE_FILE) up --build -d

api: networks
	cd services/homeowner-names/api/src && composer install
	docker-compose -f $(STREET_GROUP_API_COMPOSE_FILE) up --build -d

client: networks
	cd services/homeowner-names/client && yarn install
	docker-compose -f $(STREET_GROUP_CLIENT_COMPOSE_FILE) up --build -d

infra: networks
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

networks:
	docker network create microservice-network
	docker network create street-group-network

stop:
	docker-compose -f $(STREET_GROUP_CLIENT_COMPOSE_FILE) down
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) down
	docker network rm microservice-network || true
	docker network rm street-group-network || true
