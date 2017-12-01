#!/bin/sh -eux

cd `dirname $0`

GOPATH=`pwd`/gopath
gcloud app deploy --no-promote gae/app.yaml
