#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

PACKAGES_DIR="$(pwd)/packages"

if [ ! -d "$PACKAGES_DIR" ]; then
    echo "'./packages' directory not found. Please provide a packages directory in the current directory."
    exit 1
fi

USER_ID=$(id -u)
GROUP_ID=$(id -g)

docker run --rm -v "$PACKAGES_DIR":/packages -w /packages alpine:latest /bin/sh -c "
    apk update &&
    apk index -o /packages/APKINDEX.tar.gz /packages/*.apk &&
    chown -R $USER_ID:$GROUP_ID /packages
"

echo "APKINDEX.tar.gz file has been generated in the './packages' directory."
