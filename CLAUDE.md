# hzdb Linux wrapper

## Overview

`hzdb` is a `sh` wrapper that makes the Meta Quest CLI usable on Linux.

- Device commands are implemented via `adbq` (a thin `adb -s DEVICE "$@"` wrapper).
- `docs` and `help` subcommands are passed through to `hzdb.exe` running under Wine.
- `mcp`, `asset`, `init`, and `self-update` are not supported.
- Several `perf` subcommands are not supported (they require the hzdb backend): `load`, `query`, `analyze-trace`, `gpu-counters`, `thread-state`, `compare`.

## Files

- `hzdb` — the wrapper script (tracked in repo)
- `README.md` — user-facing setup and usage guide (tracked in repo)
- `hzdb-<version>.md` — versioned upstream help output (e.g. `hzdb-1.1.md`) (tracked in repo)
- `hzdb-<version>-linux.md` — versioned Linux-specific reference derived from `hzdb-<version>.md` (e.g. `hzdb-1.1-linux.md`) (tracked in repo)
- `hzdb.exe` — the official Windows binary; not in repo, must be downloaded (see README.md)
- `adbq` — device-targeting adb wrapper; not in repo, must be created by the user (see README.md)

## Updating hzdb.exe

Download the latest Windows binary from npm:

```sh
url=$(npm view @meta-quest/hzdb-win32-x64 dist.tarball)
curl -sL "$url" | tar xz --strip-components=2 package/bin/hzdb.exe
```

Then regenerate the upstream help into a new versioned file:

```sh
./hzdb --markdown-help > hzdb-<new-version>.md
```

> **Prerequisite**: `--markdown-help` must be wired up in the wrapper (forwarded to `wine_hzdb`) before running this step. If it isn't, the wrapper's own `print_help()` output is captured instead of the full upstream help — producing a ~30-line stub rather than the real ~1900-line document.

Diff the new `hzdb-<new-version>.md` against the previous `hzdb-<old-version>.md` to identify new or changed subcommands. Then update:

1. `hzdb` — implement as many new subcommands as possible using `adbq`, standard Android tools (`adb`, `am`, `pm`, …), and Linux utilities. Mark anything genuinely impossible as `unsupported`.
   - **Critical constraint**: the only thing that may be passed to `wine hzdb.exe` are help-related invocations (e.g. `--help`, `--markdown-help`, `docs`). No other subcommand may be forwarded to Wine — not even partially. If a subcommand cannot be implemented natively (like `mcp`), it must be marked `unsupported`, not silently delegated to the Windows binary.
   - **Unsupported commands must not appear in `print_help()`** — they are silently omitted from the help screen (following the same pattern as `mcp` and `asset`).
2. `hzdb-<new-version>-linux.md` — create a new versioned file derived from `hzdb-<new-version>.md`:
   - Unsupported subcommands and options: keep a one-line "Not supported on Linux" note in the parent table only; remove their full sections and any nested subsections entirely.
   - Supported subcommands and options: carry over verbatim from `hzdb.md`.
3. The `help` passthrough list in `hzdb` (the `adb|app|audio|...` pattern in the `help)` case)
4. The top-level `print_help()` function in `hzdb`

## Maintenance notes

- When performing an upgrade or any significant change, record non-obvious discoveries and traps in this file so they don't have to be rediscovered.
- When diffing between versions, check both additions and removals: removed options in the upstream (e.g. `-f/--format` from `perf stop`, `-o/--output` from `docs` subcommands in 1.2) should be cleaned out of the wrapper and `*-linux.md` too.

## Architecture notes

- Leading dash/double-dash options before the command are accumulated in `$opts` and forwarded to `adbq` or `wine_hzdb` as the first arguments.
- `-h/--help` and `-V/--version` are intercepted before option accumulation.
- `-d/--device` is captured as a two-token entry (`-d VALUE`) in `$opts`.
- `wine_hzdb()` filters Wine noise and strips leading blank lines from output.
- `config` is stored as `key=value` in `~/.config/hzdb/config`.
- Perfetto traces are stored in `~/.local/share/hzdb/traces/`.
- Mute state (for `audio mute/unmute`) is saved to `~/.local/share/hzdb/muted_vol`.
