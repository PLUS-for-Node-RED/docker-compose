# Node-RED Docker


### Build and Run Docker Container

    cd node-red-container

    export P4NR_LICENSE_TOKEN=$NPM_TOKEN

    docker build . --no-cache -t p4nr/node-red:latest --build-arg P4NR_LICENSE_TOKEN=$NPM_TOKEN

    docker-compose up