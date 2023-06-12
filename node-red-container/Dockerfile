FROM nodered/node-red:latest

ARG P4NR_LICENSE_TOKEN
ARG REGISTRY
ARG REGISTRY_TOKEN
ARG BUILD_TAG=latest

RUN if [[ ! -z "$REGISTRY_TOKEN" ]]; then echo "//$REGISTRY/:_authToken=$REGISTRY_TOKEN" >> ~/.npmrc ; fi
RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @flowforge:registry "https://$REGISTRY"; fi

USER root

RUN mkdir /config

RUN mkdir /nodes

VOLUME ["/config", "/nodes"]

COPY .npmrc /data
COPY package.json /data

COPY .npmrc /config
COPY settings.js /config

COPY .npmrc /nodes

RUN chown -R node-red:node-red /data

RUN chown -R node-red:node-red /config

RUN chown -R node-red:node-red /nodes

WORKDIR /data

RUN export P4NR_LICENSE_TOKEN=$P4NR_LICENSE_TOKEN
RUN source .npmrc

RUN npm install

RUN npm install --location=global npm

RUN npm cache verify

RUN npm install node-red-dashboard
RUN npm install node-red-contrib-helper
RUN npm install @node-red-contrib-themes/theme-collection

RUN npm install @plus4nodered/node-red-contrib-opcua-client@~1.0.0
RUN npm install @plus4nodered/node-red-contrib-opcua-services@~1.0.0
RUN npm install @plus4nodered/node-red-contrib-opcua-tools@~1.0.0
RUN npm install @plus4nodered/node-red-contrib-opcua-servers@~1.0.0
RUN npm install @plus4nodered/node-red-contrib-opcua-mutable-server@~1.0.0

# legacy packages for old flows
RUN npm install node-red-contrib-modbus
RUN npm install node-red-contrib-opcua
RUN npm install node-red-contrib-iiot-opcua

RUN npm cache verify

RUN chown -R node-red:node-red /data

USER node-red

ENV NODE_PATH=/usr/src/node-red
ENV P4NR_LICENSE_TOKEN=$P4NR_LICENSE_TOKEN

LABEL org.label-schema.name="P4NR Node-RED" \
    org.label-schema.url="https://p4nr.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/PLUS-for-Node-RED/flowforge-docker-compose" \
    org.label-schema.docker.dockerfile="node-red-container/Dockerfile" \
    org.schema-label.description="Collaborative, industrial low code integration and automation environment" \
    authors="Iniationware"

EXPOSE 1881

ENTRYPOINT ["node-red", "--settings", "/config/settings.js", "--userDir", "/data"]
