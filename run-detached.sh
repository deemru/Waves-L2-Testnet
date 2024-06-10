#!/bin/sh

REPO_DIR=$(dirname $0)
cd $REPO_DIR
WORK_DIR=work
cd $WORK_DIR
touch ./log/waves/waves.log
chmod a+w ./log/waves/waves.log
chown -R 1000:1000 ./besu
chown -R 1000:1000 ./waves
chown -R 1000:1000 ./log
docker compose pull
docker compose up -d
