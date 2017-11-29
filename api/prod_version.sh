#!/bin/sh -eu

# yyyy-mm-dd-hhmm-commit
SHORT_SHA1=`echo $1 | cut -c 1-7`
date "+%Y-%m-%d-%H%M-${SHORT_SHA1}"
