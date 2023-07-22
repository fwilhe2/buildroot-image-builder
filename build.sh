#!/bin/bash

set -e

BR_VERSION=$(cat config.json | jq -r .buildroot_version)

echo $BR_VERSION

CONFIG_FILE="config/$BR_VERSION/$1"

echo $CONFIG_FILE

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Usage: ./build.sh [config-file]"
    exit 1
fi

mkdir -p out
cp "$CONFIG_FILE" out/.config

if [ ! -d buildroot ]; then
    git clone --depth 1 --branch "$BR_VERSION" https://github.com/buildroot/buildroot
fi
cd buildroot

make O=../out
