#!/bin/sh -eux

cd `dirname $0`

dev_appserver.py --go_debugging true --enable_watching_go_path false gae/app.yaml
