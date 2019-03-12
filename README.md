## Install Bitcoin SV Node for Planaria
**Objective:** install a full Bitcoin SV node using Docker for use with Planaria

Read more about [Planaria](https://docs.planaria.network/#/) and [docker](https://docs.docker.com).

## Install Docker via Homebrew (Mac)
```bash
$ brew cask install docker
```

Login to docker
```bash
$ docker login
```

## Install BitcoinSV

(Optional) Start with this repository
```
$ git clone this-repo
$ cd ~/this-repo
```

1) Create a bsvd-data volume to persist the bsvd blockchain data, should exit immediately. The bsvd-data container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):
```bash
$ docker volume create --name=bsvd-data
```

Confirm the volume exists
```bash
$ docker volume ls

DRIVER              VOLUME NAME
local               bsvd-data
```

2) Build the docker image
```bash
$ docker build --tag=bsv-node-image .
```

Confirm the image exists
```bash
$ docker image ls -a

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bsv-node-image      latest              bea2961dbc29        47 seconds ago      112MB
```

3) Run the docker image
```bash
$ docker run -v bsvd-data:/bitcoinsv --name=bsvd-node-server -d \
      -p 8333:8333 \
      -p 8332:8332 \
      bsv-node-image:latest
```

Check container
```bash
$ docker containers ls -a
```

Connect to the docker instance
```bash
$ docker exec -it bsvd-node-server /bin/bash
```

Test if bitcoin node is working properly (view the connections active logs)
```bash
root@zfr2961dbc55:~# bitcoin-cli getblockchaininfo
root@zfr2961dbc55:~# bitcoin-cli getconnectioncount
root@zfr2961dbc55:~# tail -f ~/.bitcoin/bitcoind.log
```

Stop the server
```bash
$ docker stop bsvd-node-server
```