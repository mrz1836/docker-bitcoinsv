# Bitcoin SV Docker Image
Optimized [docker](https://docs.docker.com) image of the Bitcoin SV node for use with [Planaria](https://docs.planaria.network/#/)

## Table of Contents
- [Installation](https://github.com/mrz1836/bitcoinsv-docker#installation)
- [Maintainers](https://github.com/mrz1836/bitcoinsv-docker#maintainers)
- [Contributing](https://github.com/mrz1836/bitcoinsv-docker#contributing)
- [License](https://github.com/mrz1836/bitcoinsv-docker#license)

## Installation
**Objective:** install a full [Bitcoin SV node](https://download.bitcoinsv.io/bitcoinsv/) using [docker](https://docs.docker.com) for use with [Planaria](https://docs.planaria.network/#/)

Read more about [Planaria](https://docs.planaria.network/#/) and [docker](https://docs.docker.com).

### Install Docker via Homebrew (Mac)
```bash
$ brew cask install docker
```

_Login to docker_
```bash
$ docker login
```

### Install Bitcoin SV Node

_(Optional) Start with this repository as an example project_
```bash
$ git clone git@github.com:mrz1836/docker-bitcoinsv.git
$ cd ~/docker-bitcoinsv
```

**1) Create a bsvd-data volume** to persist the bsvd blockchain data, should exit immediately. The bsvd-data container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):
```bash
$ docker volume create --name=bsvd-data
```

_Confirm the volume exists_
```bash
$ docker volume ls

DRIVER              VOLUME NAME
local               bsvd-data
```

**2) Build the docker image**
```bash
$ docker build --tag=bsv-node-image .
```

_Confirm the image exists_
```bash
$ docker image ls -a

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bsv-node-image      latest              bea2961dbc29        47 seconds ago      112MB
```

**3) Run the docker image**
```bash
$ docker run -v bsvd-data:/bitcoinsv --name=bsvd-node-server -d \
      -p 8333:8333 \
      -p 8332:8332 \
      bsv-node-image:latest
```

_Check that the container exists_
```bash
$ docker containers ls -a
```

_Connect to the docker instance_
```bash
$ docker exec -it bsvd-node-server /bin/bash
```

Test if bitcoin node is working properly (view the connections active logs)
```bash
root@zfr2961dbc55:~# bitcoin-cli getblockchaininfo
root@zfr2961dbc55:~# bitcoin-cli getconnectioncount
root@zfr2961dbc55:~# tail -f ~/.bitcoin/bitcoind.log
```

_Stop the server_
```bash
$ docker stop bsvd-node-server
```

## Maintainers
Forked from: [docker-bitcoinsv](https://github.com/BitslerCasino/docker-bitcoinsv)

[MrZ](https://github.com/mrz1836) - [Satchmo](https://github.com/rohenaz)

Support the development of this project and the development team 🙏

[![Donate](https://img.shields.io/badge/donate-bitcoin%20SV-brightgreen.svg)](https://mrz1818.com?af=docker-bitcoinsv)

## Contributing
Feel free to dive in! [Open an issue](https://github.com/mrz1836/docker-bitcoinsv/issues/new) or submit PRs.

## License
![License](https://img.shields.io/github/license/mrz1836/docker-bitcoinsv.svg?style=flat)