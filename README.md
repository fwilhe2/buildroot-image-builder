Linux image builder based on [Buildroot](https://buildroot.org).

## Trigger GitHub Workflow via cli

```sh
gh workflow run build.yml -f config=qemu_x86_64
```

## Build locally

```sh
./build.sh [config]
./build.sh qemu_x86_64
```
