#!/bin/sh -eux

cd `dirname $0`

GOPATH=`pwd`/gopath
gcloud app deploy gae/app.yaml
