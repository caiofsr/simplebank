containers:
	docker-compose up -d

createdb:
	docker exec -it pgsql createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it pgsql dropdb simple_bank

dbmigrate:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

dbrollback:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb containers dbmigrate dbrollback sqlc
