# Linux Image Builder

Linux image builder based on [Buildroot](https://buildroot.org).

## Trigger GitHub Workflow via cli

```sh
gh workflow run single.yml -f config=qemu_x86_64
gh workflow run single.yml -f config=raspberrypi4_64
gh workflow run single.yml -f config=qemu_aarch64_virt
gh workflow run single.yml -f config=qemu_arm_versatile

gh workflow run matrix.yml
```

## Build locally

```sh
./build.sh [config]
./build.sh qemu_x86_64
```
