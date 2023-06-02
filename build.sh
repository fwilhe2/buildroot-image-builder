#!/bin/bash

set -e

CONFIG_FILE="config/$1"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Usage: ./build.sh [config-file]"
    exit 1
fi

mkdir -p out
cp "$CONFIG_FILE" out/.config

if [ ! -d buildroot ]; then
    git clone --depth 1 --branch 2023.02.1 https://github.com/buildroot/buildroot
fi
cd buildroot

make O=../out
