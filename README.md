# Waves-L2-Testnet

**Never copy and paste commands that you do not understand or that were given to you by unknown people. This can be dangerous for your system, your security and your privacy. You can accidentally delete important files, get infected by a virus, give access to your data or do other unwanted actions. Always check and learn the commands before running them and use reliable sources of information.**

### Setup OS

- You need some Debian or Ubuntu on amd64
- Switch to root if not already (`su -` or `sudo su -`)
- Install `docker compose` on Debian:
```bash
apt update && \
apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
apt-get -y install docker-ce && \
docker compose version
```
- Install `docker compose` on Ubuntu:
```bash
apt update && \
apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
apt update && \
apt-get -y install docker-ce && \
docker compose version
```

### Clone

```
git clone https://github.com/deemru/Waves-L2-Testnet.git
cd Waves-L2-Testnet
```

### Setup Blockchain Data

```
./setup.sh
nano config.sh
./setup.sh
```

### Run

```
./run.sh
```

or

```
./run-detached.sh
```

You can view docker logs from detached containers as:
```
docker ps -q | xargs -L 1 -P 0 docker logs --since 30s -f
```
