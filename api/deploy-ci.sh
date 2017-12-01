#!/bin/sh -eu

if [ $# -lt 3 ]; then
  echo "usage: deploy-ci.sh application_id branch_name gloud_key_base64"
  exit 1;
fi

cd `dirname $0`

APPLICATION=$1
VERSION=`echo $2 | sed -e s/\[/_]/-/g | awk '{print tolower($0)}'`
GCLOUD_KEY=$3
echo $GCLOUD_KEY | base64 --decode > service_account.json
ACCOUNT=`node -e "var a = \`cat service_account.json\`; console.log(a.client_email);"`

echo "APPLICATION=${APPLICATION}"
echo "VERSION=${VERSION}"

gcloud auth activate-service-account ${ACCOUNT} \
  --key-file ./service_account.json \
  --project ${APPLICATION}

GOPATH=`pwd`/gopath
gcloud app deploy --project=$APPLICATION --version=$VERSION --no-promote gae/app.yaml
