#!/bin/sh -eux

cd `dirname $0`

cd ./gae/

goimports -w .
go tool vet .
golint ./...

go test -v ./...