FROM nodered/node-red:latest

ARG P4NR_LICENSE_TOKEN
ARG REGISTRY
ARG REGISTRY_TOKEN
ARG BUILD_TAG=latest

RUN if [[ ! -z "$REGISTRY_TOKEN" ]]; then echo "//$REGISTRY/:_authToken=$REGISTRY_TOKEN" >> ~/.npmrc ; fi
RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @flowforge:registry "https://$REGISTRY"; fi

COPY healthcheck.js /healthcheck.js

COPY .npmrc /data
COPY package.json /data

USER root

WORKDIR /data
RUN chown node-red:node-red /data/*

RUN export P4NR_LICENSE_TOKEN=$P4NR_LICENSE_TOKEN
RUN source .npmrc
RUN npm install

RUN npm install @plus4nodered/node-red-contrib-opcua-client
RUN npm install @plus4nodered/node-red-contrib-opcua-services
RUN npm install @plus4nodered/node-red-contrib-opcua-buttons
RUN npm install @plus4nodered/node-red-contrib-opcua-tools
RUN npm install @plus4nodered/node-red-contrib-opcua-servers
RUN npm install @plus4nodered/node-red-contrib-opcua-mutable-server

WORKDIR /usr/src/flowforge-nr-launcher
RUN chown node-red:node-red /data/* /usr/src/flowforge-nr-launcher

USER node-red
RUN npm install @flowforge/nr-launcher@${BUILD_TAG}

ENV NODE_PATH=/usr/src/node-red
ENV P4NR_LICENSE_TOKEN=community

LABEL org.label-schema.name="Flowforge P4NR Node-RED" \
    org.label-schema.url="https://p4nr.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/PLUS-for-Node-RED/flowforge-docker-compose" \
    org.label-schema.docker.dockerfile="node-red-container/Dockerfile" \
    org.schema-label.description="Collaborative, industrial low code integration and automation environment" \
    authors="Iniationware"

EXPOSE 2880

ENTRYPOINT ["./node_modules/.bin/flowforge-node-red", "-p", "2880", "-n", "/usr/src/node-red"]
