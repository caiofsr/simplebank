package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	"github.com/caiofsr/simplebank/util"
	_ "github.com/lib/pq"
)

var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error

	config, err := util.LoadTestConfig("../..")
	if err != nil {
		log.Fatal("cannot load config file", err)
	}

	testDB, err = sql.Open(config.DBDriver, config.DBSource)

	if err != nil {
		log.Fatal("cannot connect with database", err)
	}

	testQueries = New(testDB)

	os.Exit(m.Run())
}
