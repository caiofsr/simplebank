package util

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateRandomInt(t *testing.T) {
	randomInt := RandomMoney()

	require.NotNil(t, randomInt)
}

func TestCreateRandomString(t *testing.T) {
	randomString := RandomOwner()

	require.NotNil(t, randomString)
}

func TestCreateCurrency(t *testing.T) {
	currencies := []string{"EUR", "USD", "CAD"}
	randomCurrency := RandomCurrency()

	require.Contains(t, currencies, randomCurrency)
}
