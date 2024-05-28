# Node-RED Docker


### Build and Run Docker Container

## Linux

    cd node-red-container

    export P4NR_LICENSE_TOKEN=$NPM_TOKEN

    docker build . --no-cache -t p4nr/node-red:latest --build-arg P4NR_LICENSE_TOKEN=$NPM_TOKEN

    docker-compose up

## Windows

    cd node-red-container

    set P4NR_LICENSE_TOKEN=%NPM_TOKEN%

    docker build . --no-cache -t p4nr/node-red:latest --build-arg P4NR_LICENSE_TOKEN=%NPM_TOKEN%

    docker-compose up

### Build Image for multiple architectures with buildx and directly push it to cloudsmith (Cannot be used locally)

    cd node-red-container

    docker login docker.cloudsmith.io

    export P4NR_LICENSE_TOKEN=$NPM_TOKEN

    docker buildx build . --platform 'linux/amd64,linux/arm64,linux/arm/v7' -t docker.cloudsmith.io/iniationware-gmbh/p4nree/p4nr/node-red:1.0.0 -t docker.cloudsmith.io/iniationware-gmbh/p4nree/p4nr/node-red:latest --build-arg P4NR_LICENSE_TOKEN=$NPM_TOKEN --no-cache -o type=registry --provenance=false


### Push Docker Image to Cloudsmith

    docker login docker.cloudsmith.io

    docker tag p4nr/node-red:latest docker.cloudsmith.io/iniationware-gmbh/flowforge/p4nr/node-red:latest

    docker push docker.cloudsmith.io/iniationware-gmbh/flowforge/p4nr/node-red:latest

### Upload Docker Image to Cloudsmith

    docker tag p4nr/node-red:latest docker.cloudsmith.io/iniationware-gmbh/flowforge/p4nr/node-red:latest

    docker save -o p4nr-node-red.docker docker.cloudsmith.io/iniationware-gmbh/flowforge/p4nr/node-red:latest
