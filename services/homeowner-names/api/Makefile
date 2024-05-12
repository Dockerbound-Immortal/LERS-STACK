.PHONY: networks api stop

api: networks
	cd ./src && composer install
	cd ./src && docker-compose -f docker-compose.yml up --build -d

networks:
	docker network create microservice-network
	docker network create street-group-network

stop:
	docker-compose -f docker-compose.yml down
	docker network rm microservice-network || true
	docker network rm street-group-network || true
