#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

PACKAGES_FILE="$(pwd)/packages.txt"

if [ ! -f "$PACKAGES_FILE" ]; then
    echo "packages.txt not found. Please provide a packages.txt file in the current directory."
    exit 1
fi

USER_ID=$(id -u)
GROUP_ID=$(id -g)

docker run --rm -v "$(pwd)/packages":/packages -v "$PACKAGES_FILE:/packages.txt" alpine:latest /bin/sh -c "
    apk update &&
    cd /packages &&
    apk fetch --no-cache --recursive \$(cat /packages.txt) &&
    chown -R $USER_ID:$GROUP_ID /packages
"

echo "APK packages have been downloaded to the './packages' directory."
