#!/bin/bash

docker build flowforge-docker -t flowforge/forge-docker
docker build node-red-container -t flowforge/node-red --build-arg P4NR_LICENSE_TOKEN=$P4NR_LICENSE_TOKEN
docker build file-server -t flowforge/file-server
