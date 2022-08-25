containers:
	docker-compose up -d

createdb:
	docker exec -it simplebank-pg createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it simplebank-pg  dropdb  --username=postgres simple_bank

dbmigrate:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

dbrollback:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

dbrevert:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen --package mockdb --destination db/mock/store.go github.com/caiofsr/simplebank/db/sqlc Store

.PHONY: createdb dropdb containers dbmigrate dbrollback sqlc test server mock dbrevert
