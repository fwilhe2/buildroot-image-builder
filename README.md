# Linux Image Builder

Linux image builder based on [Buildroot](https://buildroot.org).

## Buildroot dependencies

[Docs](https://buildroot.org/downloads/manual/manual.html#requirement)

### Fedora

```sh
sudo dnf install -y which sed make binutils diffutils gcc gcc-c++ bash patch gzip bzip2 tar cpio unzip rsync file bc findutils wget
sudo dnf install -y perl-English perl-Thread-Queue perl-FindBin perl-IPC-Cmd
sudo dnf install -y qt4-devel
```

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
