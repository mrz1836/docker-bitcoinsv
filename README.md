# Bitcoin SV Docker Image
> Optimized [docker](https://docs.docker.com) image of the Bitcoin SV node

[![BSV Version](https://img.shields.io/badge/BSV-1.0.7-blue.svg)](https://download.bitcoinsv.io/bitcoinsv/1.0.7/)
[![Docker Version](https://img.shields.io/badge/Docker-18.0.xx-blue.svg)](https://docs.docker.com/release-notes/)

## Table of Contents
- [Installation](#installation)
- [Maintainers](#maintainers)
- [Credits](#credits)
- [Contributing](#contributing)
- [License](#license)

## Installation
**Objective:** install a full [Bitcoin SV node](https://download.bitcoinsv.io/bitcoinsv/) using [docker](https://docs.docker.com)

### Install Docker via Homebrew (Mac)
```shell script
brew cask install docker
```

_Install docker for Mac_
```text
1) Open the docker application for your applications folder
2) Finish the installation of the docker desktop application
```

_Login to docker_
```shell script
docker login
```

### Install Bitcoin SV Node

_(Optional) Start with this repository as an example project_
```shell script
git clone git@github.com:mrz1836/docker-bitcoinsv.git
cd ~/docker-bitcoinsv
```

**1) Create a bsvd-data volume** to persist the bsvd blockchain data, should exit immediately. 
The bsvd-data container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):
```shell script
docker volume create --name=bsvd-data
```

_Confirm the volume exists_
```shell script
docker volume ls

DRIVER              VOLUME NAME
local               bsvd-data
```

**2) Build the docker image**
```shell script
docker build --tag=bsv-node-image .
```

_Confirm the image exists_
```shell script
docker image ls -a

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bsv-node-image      latest              bea2961dbc29        47 seconds ago      112MB
```

**3) Run the docker image**
```shell script
docker run -v bsvd-data:/bitcoinsv --name=bsvd-node-server -d \
      -p 8333:8333 \
      -p 8332:8332 \
      bsv-node-image:latest
```

_Check that the container exists_
```shell script
docker container ls -a
```

_Connect to the docker instance_
```shell script
docker exec -it bsvd-node-server /bin/bash
```

_Test: Are there are node connections?_
```shell script
root@zfr2961dbc55:~# bitcoin-cli getconnectioncount
```

_Test: Is there blockchain info?_
```shell script
root@zfr2961dbc55:~# bitcoin-cli getblockchaininfo
```

_Test: Are there logs?_
```shell script
root@zfr2961dbc55:~# tail -f ~/.bitcoin/bitcoind.log
```

## Maintainers
| [<img src="https://github.com/mrz1836.png" height="50" alt="MrZ" />](https://github.com/mrz1836) | [<img src="https://github.com/rohenaz.png" height="50" alt="Satchmo" />](https://github.com/rohenaz)
|:---:|:---:|
| [MrZ](https://github.com/mrz1836) | [Satchmo](https://github.com/rohenaz) 
 
Support the development of this project and the development team 🙏

[![Donate](https://img.shields.io/badge/donate-bitcoin-brightgreen.svg)](https://mrz1818.com?af=docker-bitcoinsv)

## Credits
Inspiration and some code from: [docker-bitcoinsv](https://github.com/BitslerCasino/docker-bitcoinsv)

## Contributing
Feel free to dive in! [Open an issue](https://github.com/mrz1836/docker-bitcoinsv/issues/new) or submit PRs.

## License
![License](https://img.shields.io/github/license/mrz1836/docker-bitcoinsv.svg?style=flat)
