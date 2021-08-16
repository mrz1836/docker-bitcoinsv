# Common makefile commands & variables between projects
include .make/common.mk

## Set the distribution folder
ifndef DISTRIBUTIONS_DIR
	override DISTRIBUTIONS_DIR=./release
endif

## Not defined? Use default repo name which is the application
ifeq ($(REPO_NAME),)
	REPO_NAME="docker-bitcoinsv"
endif

## Not defined? Use default repo owner
ifeq ($(REPO_OWNER),)
	REPO_OWNER="mrz1836"
endif

## Default branch
ifndef REPO_BRANCH
	override REPO_BRANCH="master"
endif

.PHONY: clean release test

build: ## Builds the docker image
	@docker build --tag=bsv-node-image .

run: ## Runs the docker container
	@docker run -v bsvd-data:/bitcoinsv --name=bsvd-node-server -d \
		-p 8333:8333 \
		-p 8332:8332 \
		bsv-node-image:latest
