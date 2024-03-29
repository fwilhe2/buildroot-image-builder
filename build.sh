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

if [ ! -d "buildroot-$BR_VERSION" ]; then
    wget "https://buildroot.org/downloads/buildroot-$BR_VERSION.tar.gz"
    tar xf buildroot-$BR_VERSION.tar.gz
fi
cd "buildroot-$BR_VERSION"

make O=../out
