#!/bin/bash

set -e

CONFIG_FILE="$1"

mkdir -p out
cp config/"$CONFIG_FILE" out/.config

if [ ! -d buildroot ]; then
    git clone --depth 1 --branch 2023.02.1 https://github.com/buildroot/buildroot
fi
cd buildroot

make O=../out
