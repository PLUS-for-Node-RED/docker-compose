FROM node:16-alpine

ARG REGISTRY
ARG BUILD_TAG=latest

RUN if [[ ! -z "$REGISTRY" ]] ; then npm config set @p4nr:registry "$REGISTRY"; fi

RUN apk add --no-cache --virtual build-base g++ make py3-pip sqlite-dev python2

COPY .npmrc /data/flowforge
WORKDIR /data/flowforge

ENV FLOWFORGE_HOME=/data/flowforge
ENV P4NR_LICENSE_TOKEN=community

LABEL org.label-schema.name="Flowforge P4NR Docker Local Development" \
    org.label-schema.url="https://p4nr.com" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/PLUS-for-Node-RED/docker-compose" \
    org.label-schema.docker.dockerfile="flowforge-docker-local-dev/Dockerfile" \
    org.schema-label.description="Collaborative, industrial low code integration and automation environment" \
    authors="Iniationware"

EXPOSE 3000

CMD npm run serve