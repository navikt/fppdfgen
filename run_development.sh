#!/bin/sh

CURRENT_PATH="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
IMAGE_VERSION="1.5.0"

docker pull ghcr.io/navikt/pdfgen:$IMAGE_VERSION
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
        ghcr.io/navikt/pdfgen:$IMAGE_VERSION
