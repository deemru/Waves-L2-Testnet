#!/bin/sh

REPO_DIR=$(dirname $0)
cd $REPO_DIR
WORK_DIR=work
cd $WORK_DIR
touch ./waves/waves.log
chmod a+w ./waves/waves.log
chown -R 1000:1000 ./besu
chown -R 1000:1000 ./waves
docker compose up
