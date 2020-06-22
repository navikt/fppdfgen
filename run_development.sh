#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"

docker pull navikt/pdfgen:latest
docker run \
        -v $CURRENT_PATH/templates:/app/templates \
        -v $CURRENT_PATH/fonts:/app/fonts \
        -v $CURRENT_PATH/data:/app/data \
        -v $CURRENT_PATH/resources:/app/resources \
        -p 8180:8080 \
	-e JAVA_OPTS='-Dlogback.configurationFile=logback-remote-debug.xml' \
        -e DISABLE_PDF_GET=false \
        -it \
        --rm \
        navikt/pdfgen:latest
