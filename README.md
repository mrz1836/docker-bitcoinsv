# BitcoinSV Docker Image
> Optimized [docker](https://docs.docker.com) image of the [BitcoinSV](https://bitcoinsv.io) node

[![last commit](https://img.shields.io/github/last-commit/mrz1836/docker-bitcoinsv.svg?style=flat&v=1)](https://github.com/mrz1836/docker-bitcoinsv/commits/master)
[![version](https://img.shields.io/github/release-pre/mrz1836/docker-bitcoinsv.svg?style=flat&v=1)](https://github.com/mrz1836/docker-bitcoinsv/releases)
[![BSV Version](https://img.shields.io/badge/BSV-1.0.11-blue.svg?v=1)](https://download.bitcoinsv.io/bitcoinsv/1.0.9/)
[![Docker Version](https://img.shields.io/badge/Docker-18.0.xx-blue.svg?v=1)](https://docs.docker.com/release-notes/)
[![Sponsor](https://img.shields.io/badge/sponsor-MrZ1836-181717.svg?logo=github&style=flat&v=1)](https://github.com/sponsors/Mrz1836)

## Table of Contents
- [Installation](#installation)
- [Documentation](#documentation)
- [Maintainers](#maintainers)
- [Credits](#credits)
- [Contributing](#contributing)
- [License](#license)

<br/>

## Installation
**Objective:** install a full [BitcoinSV node](https://download.bitcoinsv.io/bitcoinsv/) using [docker](https://docs.docker.com)

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

<br/>

## Documentation

<details>
<summary><strong><code>Makefile Commands</code></strong></summary>

View all `makefile` commands

```shell script
make help
```

List of all current commands:

```text
build                Builds the docker image
help                 Show this help message
release              Full production release (creates release in Github)
release-snap         Test the full release (build binaries)
release-test         Full production test release (everything except deploy)
replace-version      Replaces the version in HTML/JS (pre-deploy)
run                  Runs the docker container
tag                  Generate a new tag and push (tag version=0.0.0)
tag-remove           Remove a tag if found (tag-remove version=0.0.0)
tag-update           Update an existing tag to current commit (tag-update version=0.0.0)
```

</details>

<br/> 

## Maintainers
| [<img src="https://github.com/mrz1836.png" height="50" alt="MrZ" />](https://github.com/mrz1836) | [<img src="https://github.com/rohenaz.png" height="50" alt="Satchmo" />](https://github.com/rohenaz) |
|:------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
|                                [MrZ](https://github.com/mrz1836)                                 |                                [Satchmo](https://github.com/rohenaz)                                 |
 
Support the development of this project and the development team 🙏

[![Donate](https://img.shields.io/badge/donate-bitcoin-brightgreen.svg)](https://mrz1818.com?af=docker-bitcoinsv)

<br/>

## Credits
Inspiration and some code from: [docker-bitcoinsv](https://github.com/BitslerCasino/docker-bitcoinsv)

<br/>

## Contributing
View the [contributing guidelines](.github/CONTRIBUTING.md) and please follow the [code of conduct](.github/CODE_OF_CONDUCT.md).

### How can I help?
All kinds of contributions are welcome :raised_hands:!
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:.
You can also support this project by [becoming a sponsor on GitHub](https://github.com/sponsors/Mrz1836) :clap:
or by making a [**bitcoin donation**](https://mrz1818.com/?utm_source=github&utm_medium=sponsor-link&utm_campaign=docker-bitcoinsv&utm_term=docker-bitcoinsv&utm_content=docker-bitcoinsv) to ensure this journey continues indefinitely! :rocket:

[![Stars](https://img.shields.io/github/stars/mrz1836/docker-bitcoinsv?label=Please%20like%20us&style=social)](https://github.com/mrz1836/docker-bitcoinsv/stargazers)

<br/>

## License
[![License](https://img.shields.io/github/license/mrz1836/docker-bitcoinsv.svg?style=flat)](LICENSE)
