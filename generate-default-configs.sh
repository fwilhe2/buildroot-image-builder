#!/bin/bash

set -e

BR_VERSION=$(cat config.json | jq -r .buildroot_version)

echo $BR_VERSION

CONFIG_VARIANTS=("qemu_aarch64_virt" "qemu_arm_versatile" "qemu_x86_64" "raspberrypi4_64")

if [ ! -d "buildroot-$BR_VERSION" ]; then
    wget "https://buildroot.org/downloads/buildroot-$BR_VERSION.tar.gz"
    tar xf buildroot-$BR_VERSION.tar.gz
fi
cd "buildroot-$BR_VERSION"

mkdir -p ../config/$BR_VERSION
for config_variant in ${CONFIG_VARIANTS[@]}; do
  make ${config_variant}_defconfig
  mv .config ../config/$BR_VERSION/$config_variant
done
