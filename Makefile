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

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen --package mockdb --destination db/mock/store.go github.com/caiofsr/simplebank/db/sqlc Store

.PHONY: createdb dropdb containers dbmigrate dbrollback sqlc test server mock
