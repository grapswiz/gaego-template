#!/bin/sh -eux

cd `dirname $0`

cp -r vendor/* gopath/src/
GOPATH=`pwd`/gopath
gcloud app deploy gae/app.yaml
