#!/bin/sh

CURRENT_PATH="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
IMAGE_VERSION="2.0.21"

docker pull ghcr.io/navikt/pdfgen:$IMAGE_VERSION
docker run \
        -v $CURRENT_PATH/templates:/app/templates \
        -v $CURRENT_PATH/fonts:/app/fonts \
        -v $CURRENT_PATH/data:/app/data \
        -v $CURRENT_PATH/resources:/app/resources \
        -v $CURRENT_PATH/logback-local-test.xml:/app/logback-local-test.xml \
        -p 8180:8080 \
        -e JDK_JAVA_OPTIONS='-Dlogback.configurationFile=logback-local-test.xml' \
        -e DISABLE_PDF_GET=false \
        -it \
        --rm \
        ghcr.io/navikt/pdfgen:$IMAGE_VERSION
