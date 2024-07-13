#!/bin/sh

REPO_DIR=$(dirname "$0")
cd "$REPO_DIR" || { echo "Error: cd $REPO_DIR"; exit 1; }
[ -f ./config.sh ] || { echo "export WAVES_DEPLOYER_SEED=" > ./config.sh; echo "export WAVES_DEPLOYER_PASSWORD=" >> ./config.sh; }
. ./config.sh
[ -z "$WAVES_DEPLOYER_SEED" ] || [ -z "$WAVES_DEPLOYER_PASSWORD" ] && { echo "Error: WAVES_DEPLOYER_SEED or WAVES_DEPLOYER_PASSWORD is not set or is null."; exit 1; }

WORK_DIR=work
mkdir -p $WORK_DIR
cd $WORK_DIR || { echo "Error: cd $WORK_DIR"; exit 1; }

mkdir -p ./waves/data
mkdir -p ./besu
mkdir -p ./log/besu
mkdir -p ./log/waves

cp ../support/docker-compose.yml ./docker-compose.yml;
cp ../support/genesis.json ./genesis.json;
cp ../support/log4j.xml ./log4j.xml;
cp ../support/waves.conf ./waves.conf;
cp ../support/static-nodes.json ./besu/static-nodes.json;

sed -i "s/\(waves.wallet.password = \).*/\1\"$WAVES_DEPLOYER_PASSWORD\"/g" ./waves.conf
sed -i "s/\(waves.wallet.seed = \).*/\1\"$WAVES_DEPLOYER_SEED\"/g" ./waves.conf

[ -d ./waves/data/tx-meta ] || { printf "WARNING: no blockchain data found. Blockchain data will be downloaded.\n\nPress ENTER to continue..."; read -r dummy; wget -qO- --show-progress https://blockchain-testnet.wavesnodes.com/blockchain_last.tar | tar xv -C ./waves/data; }
[ -d ./waves/data/tx-meta ] && echo "SUCCESS: blockchain data found";
