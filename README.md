# Linux wrapper for `hzdb` CLI tool for Meta Quest

A shell wrapper around the Meta [Horizon Debug Bridge](https://github.com/meta-quest/agentic-tools) CLI
that makes `hzdb` usable on Linux. Device commands are routed through `adb`; the Windows binary is run
under Wine for `docs` and `help` subcommands. Not all subcommands are supported — see
[hzdb-1.2-linux.md](hzdb-1.2-linux.md) for the full command reference (v1.2).

> [!WARNING]
> Most commands have not been tested and may not work as expected.

## Requirements

**1) Android tools** — `adb` must be on your `PATH` (part of the Android SDK platform-tools).

**2) `adbq`** — a one-line wrapper that targets your specific device:

```sh
#!/bin/sh
adb -s YOUR_DEVICE_SERIAL "$@"
```

Replace `YOUR_DEVICE_SERIAL` with the serial shown by `adb devices`. Place it on your `PATH` and make it executable.

**3) Wine** — `wine` must be on your `PATH`.

**4) `hzdb.exe`** — the official Meta Quest CLI binary (Windows build, runs under Wine):

```sh
url=$(npm view @meta-quest/hzdb-win32-x64 dist.tarball)
curl -sL "$url" | tar xz --strip-components=2 package/bin/hzdb.exe
mv hzdb.exe ~/bin/hzdb.exe
```
