# hzdb (v1.1.0) — Linux

Horizon Debug Bridge - CLI for Meta Quest device development

**Usage:**

```
hzdb [OPTIONS] [COMMAND]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-d, --device <DEVICE>` | Target device ID (also reads HZDB_DEVICE env var) |
| `--format <FORMAT>` | Output format (table, json, plain) (default: table) |
| `--json` | Output in JSON format (shorthand for --format json) |
| `--markdown-help` | Print help in markdown format |
| `-v, --verbose` | Increase logging verbosity |
| `-q, --quiet` | Decrease logging verbosity |

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`adb`](#adb) | Low-level ADB-compatible commands (devices, shell, logcat, etc.) |
| [`app`](#app) | Manage applications on the device (install, uninstall, launch, etc.) |
| `asset` | Not supported on Linux |
| [`audio`](#audio) | Device audio volume and mute control |
| [`capture`](#capture) | Capture screenshots and screen recordings from the device |
| [`config`](#config) | Manage hzdb configuration settings |
| [`device`](#device) | Manage connected Meta Quest devices (list, info, connect, battery, etc.) |
| [`docs`](#docs) | Search and fetch Meta Quest developer documentation |
| [`files`](#files) | Manage files on the device (ls, push, pull, rm, mkdir) |
| [`log`](#log) | View device logs (shortcut for `adb logcat`) |
| `mcp` | Not supported on Linux |
| [`perf`](#perf) | Performance analysis and Perfetto trace tools |
| [`shell`](#shell) | Run a shell command on the device (shortcut for `adb shell`) |

## adb

Low-level ADB-compatible commands (devices, shell, logcat, etc.)

**Usage:**

```
adb <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`devices`](#devices) | List connected devices |
| [`connect`](#connect) | Connect to a device over WiFi |
| [`disconnect`](#disconnect) | Disconnect from a device |
| [`shell`](#shell-1) | Run a shell command on the device |
| [`pull`](#pull) | Pull a file from the device |
| [`push`](#push) | Push a file to the device |
| [`install`](#install) | Install an APK on the device |
| [`uninstall`](#uninstall) | Uninstall a package from the device |
| [`reboot`](#reboot) | Reboot the device |
| [`logcat`](#logcat) | View device logs (logcat) |
| [`forward`](#forward) | Forward port connections (host -> device) |
| [`reverse`](#reverse) | Reverse port connections (device -> host) |
| [`root`](#root) | Restart adbd with root permissions |
| [`getprop`](#getprop) | Get a device property |
| [`setprop`](#setprop) | Set a device property |
| [`version`](#version) | Print version information |

### devices

List connected devices

**Usage:**

```
devices [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-l, --long` | Show extended device info (model, device, transport_id) |

### connect

Connect to a device over WiFi

**Usage:**

```
connect <ADDRESS>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<address>` (required) | Device address (ip:port) |

### disconnect

Disconnect from a device

**Usage:**

```
disconnect [ADDRESS]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<address>` | Device address to disconnect (disconnects all if omitted) |

### shell-1

Run a shell command on the device

**Usage:**

```
shell [COMMANDS]...
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<commands>` | Command and arguments to run (interactive shell if omitted) |

### pull

Pull a file from the device

**Usage:**

```
pull <SOURCE> [DESTINATION]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<source>` (required) | Path on the device |
| `<destination>` | Local destination path (defaults to current directory) |

### push

Push a file to the device

**Usage:**

```
push <LOCAL> <REMOTE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<local>` (required) | Local file path |
| `<remote>` (required) | Path on the device |

### install

Install an APK on the device

**Usage:**

```
install <PATH>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<path>` (required) | Path to the APK file |

### uninstall

Uninstall a package from the device

**Usage:**

```
uninstall <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name to uninstall |

### reboot

Reboot the device

**Usage:**

```
reboot [MODE]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<mode>` | Reboot mode: system (default), bootloader, recovery, sideload, fastboot |

### logcat

View device logs (logcat)

**Usage:**

```
logcat [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-n, --lines <LINES>` | Number of recent lines to show (use 0 for all available) (default: 100) |
| `-t, --tag <TAG>` | Filter by tag (simple filter, use 'filter' for complex expressions) |
| `-l, --level <LEVEL>` | Minimum log level: V (Verbose), D (Debug), I (Info), W (Warning), E (Error), F (Fatal) |
| `-F, --filter <FILTER>` | Filter expressions in tag:priority format (e.g., "Unity:W ActivityManager:I *:S") |
| `--out-format <OUT_FORMAT>` | Output format: brief, long, process, raw, tag, thread, threadtime (default), time |
| `-b, --buffer <BUFFER>` | Log buffer: main, system, crash, radio, events, all, default |
| `--pid <PID>` | Filter by process ID |
| `-e, --regex <REGEX>` | Regex pattern to filter log messages |
| `-C, --clear` | Clear the log buffer before reading |
| `-f, --follow` | Follow log output continuously (stream mode) |

### forward

Forward port connections (host -> device)

**Usage:**

```
forward <LOCAL> <REMOTE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<local>` (required) | Local port spec (e.g., tcp:8080) |
| `<remote>` (required) | Remote port spec (e.g., tcp:8080) |

### reverse

Reverse port connections (device -> host)

**Usage:**

```
reverse <REMOTE> <LOCAL>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<remote>` (required) | Remote port spec (e.g., tcp:8080) |
| `<local>` (required) | Local port spec (e.g., tcp:8080) |

### root

Restart adbd with root permissions

**Usage:**

```
root
```

### getprop

Get a device property

**Usage:**

```
getprop <PROPERTY>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<property>` (required) | Property name (e.g., ro.product.model) |

### setprop

Set a device property

**Usage:**

```
setprop <PROPERTY> <VALUE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<property>` (required) | Property name |
| `<value>` (required) | Property value |

### version

Print version information

**Usage:**

```
version
```

## app

Manage applications on the device (install, uninstall, launch, etc.)

**Usage:**

```
app <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`install`](#app-install) | Install an APK to the device |
| [`uninstall`](#app-uninstall) | Uninstall an app from the device |
| [`list`](#app-list) | List installed apps |
| [`launch`](#app-launch) | Launch an app |
| [`stop`](#app-stop) | Force stop an app |
| [`clear`](#app-clear) | Clear app data |
| [`info`](#app-info) | Show app info |
| [`path`](#app-path) | Get the path to an installed APK |
| [`foreground`](#app-foreground) | Detect the current foreground app |

### app-install

Install an APK to the device

**Usage:**

```
install [OPTIONS] <APK>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<apk>` (required) | Path to the APK file |

**Options:**

| Option | Description |
|--------|-------------|
| `-g, --grant-permissions` | Grant all runtime permissions on install |
| `-r, --replace` | Replace existing application (keep data) |
| `--downgrade` | Allow version downgrade |

### app-uninstall

Uninstall an app from the device

**Usage:**

```
uninstall [OPTIONS] <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) |

**Options:**

| Option | Description |
|--------|-------------|
| `-k, --keep-data` | Keep app data and cache |

### app-list

List installed apps

**Usage:**

```
list [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-3, --third-party` | Show only third-party apps (default) |
| `-s, --system` | Show system apps |
| `-a, --all` | Show all apps (system and third-party) |
| `-f, --filter <FILTER>` | Filter by package name substring |

### app-launch

Launch an app

**Usage:**

```
launch <PACKAGE>[/ACTIVITY]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) — resolves launcher activity automatically |
| `<package>/<activity>` | Fully-qualified component (e.g., com.oculus.myapp/.MainActivity) — launched directly |

### app-stop

Force stop an app

**Usage:**

```
stop <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) |

### app-clear

Clear app data

**Usage:**

```
clear <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) |

### app-info

Show app info

**Usage:**

```
info <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) |

### app-path

Get the path to an installed APK

**Usage:**

```
path <PACKAGE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<package>` (required) | Package name (e.g., com.oculus.myapp) |

### app-foreground

Detect the current foreground app

**Usage:**

```
foreground
```

## audio

Device audio volume and mute control

**Usage:**

```
audio <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`status`](#audio-status) | Get current volume level |
| [`set`](#audio-set) | Set volume level (0-15) |
| [`mute`](#audio-mute) | Mute audio (saves current volume for unmute) |
| [`unmute`](#audio-unmute) | Unmute audio (restores volume from before mute) |

### audio-status

Get current volume level

**Usage:**

```
status
```

### audio-set

Set volume level (0-15)

**Usage:**

```
set <LEVEL>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<level>` (required) | Volume level to set (0-15) |

### audio-mute

Mute audio (saves current volume for unmute)

**Usage:**

```
mute
```

### audio-unmute

Unmute audio (restores volume from before mute)

**Usage:**

```
unmute
```

## capture

Capture screenshots and screen recordings from the device

**Usage:**

```
capture <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`screenshot`](#capture-screenshot) | Take a screenshot from the device |

### capture-screenshot

Take a screenshot from the device

**Usage:**

```
screenshot [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-o, --output <OUTPUT>` | Output file path (defaults to screenshot_<timestamp>.png) |
| `--width <WIDTH>` | Screenshot width in pixels (ignored, uses device resolution) |
| `--height <HEIGHT>` | Screenshot height in pixels (ignored, uses device resolution) |
| `--method <METHOD>` | Capture method (ignored, uses screencap) |

## config

Manage hzdb configuration settings

**Usage:**

```
config <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`get`](#config-get) | Get a configuration value |
| [`set`](#config-set) | Set a configuration value |
| [`reset`](#config-reset) | Reset a configuration value to its default |
| [`list`](#config-list) | List all configuration settings |

Configuration is stored in `~/.config/hzdb/config` (or `$XDG_CONFIG_HOME/hzdb/config`).

### config-get

Get a configuration value

**Usage:**

```
get <KEY>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<key>` (required) | The configuration key to get |

### config-set

Set a configuration value

**Usage:**

```
set <KEY> <VALUE>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<key>` (required) | The configuration key to set |
| `<value>` (required) | The value to set |

### config-reset

Reset a configuration value to its default

**Usage:**

```
reset <KEY>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<key>` (required) | The configuration key to reset |

### config-list

List all configuration settings

**Usage:**

```
list
```

## device

Manage connected Meta Quest devices (list, info, connect, battery, etc.)

**Usage:**

```
device <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`list`](#device-list) | List connected devices |
| [`info`](#device-info) | Show detailed device information |
| [`connect`](#device-connect) | Connect to a device over WiFi |
| [`disconnect`](#device-disconnect) | Disconnect from a device |
| [`reboot`](#device-reboot) | Reboot the device |
| [`wake`](#device-wake) | Wake the device from sleep |
| [`wait`](#device-wait) | Wait for the device to reach an ADB state (default: device) |
| [`battery`](#device-battery) | Get battery information |
| [`controllers`](#device-controllers) | Show connected controller information |
| [`configure-testing`](#device-configure-testing) | Configure device for testing (disable animations, stay awake) or restore defaults |
| [`health-check`](#device-health-check) | Run pre-test device health validation (connectivity, battery, storage, UI) |
| [`proximity`](#device-proximity) | Enable or disable the proximity sensor |

### device-list

List connected devices

**Usage:**

```
list
```

### device-info

Show detailed device information

**Usage:**

```
info <DEVICE_ID>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<device_id>` (required) | Device ID to get info for |

### device-connect

Connect to a device over WiFi

**Usage:**

```
connect <ADDRESS>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<address>` (required) | IP address and optional port (e.g., 192.168.1.100:5555) |

### device-disconnect

Disconnect from a device

**Usage:**

```
disconnect [ADDRESS]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<address>` | Device address to disconnect (disconnects all if not specified) |

### device-reboot

Reboot the device

**Usage:**

```
reboot
```

### device-wake

Wake the device from sleep

**Usage:**

```
wake
```

### device-wait

Wait for the device to reach an ADB state (default: device)

**Usage:**

```
wait [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `--state <STATE>` | State to wait for: device, recovery, sideload, or bootloader (default: device) |
| `--timeout-secs <TIMEOUT_SECS>` | Maximum time to wait, in seconds (default: 60) |

### device-battery

Get battery information

**Usage:**

```
battery
```

### device-controllers

Show connected controller information

**Usage:**

```
controllers
```

### device-configure-testing

Configure device for testing (disable animations, stay awake) or restore defaults

**Usage:**

```
configure-testing <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`setup`](#configure-testing-setup) | Configure device for testing (disable animations, stay awake, etc.) |
| [`restore`](#configure-testing-restore) | Restore device to default settings after testing |

#### configure-testing-setup

Configure device for testing (disable animations, stay awake, etc.)

**Usage:**

```
setup
```

#### configure-testing-restore

Restore device to default settings after testing

**Usage:**

```
restore
```

### device-health-check

Run pre-test device health validation (connectivity, battery, storage)

**Usage:**

```
health-check
```

### device-proximity

Enable or disable the proximity sensor

**Usage:**

```
proximity [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-e, --enable` | Enable the proximity sensor (restores normal behavior) |
| `--disable` | Disable the proximity sensor (keeps headset awake regardless of wear) |
| `-s, --status` | Show the current proximity sensor status |
| `--duration-ms <DURATION_MS>` | Duration in milliseconds to keep sensor disabled (auto-reenables after) |

## docs

Search and fetch Meta Quest developer documentation

**Usage:**

```
docs <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`search`](#docs-search) | Search Meta Quest developer documentation |
| [`fetch`](#docs-fetch) | Fetch a documentation page from developers.meta.com/horizon |
| [`api-search`](#docs-api-search) | Search API references using BM25 ranking |
| [`api-details`](#docs-api-details) | Get full details for an API entry |
| [`api-stats`](#docs-api-stats) | Show statistics about loaded API reference indexes |

### docs-search

Search Meta Quest developer documentation

**Usage:**

```
search [OPTIONS] <QUERY>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<query>` (required) | Natural language query describing what you want to learn or build |

**Options:**

| Option | Description |
|--------|-------------|
| `-c, --category <CATEGORY>` | Document category filter (ALL, UNITY, UNREAL, SPATIAL_SDK, ANDROID, NATIVE, WEB, RESOURCES, DESIGN, POLICY) (default: ALL) |
| `-o, --output <OUTPUT>` | Output format (default: table) |

### docs-fetch

Fetch a documentation page from developers.meta.com/horizon

**Usage:**

```
fetch <URL>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<url>` (required) | Documentation path or URL. Accepts: - Full URL: https://developers.meta.com/horizon/documentation/unity/ts-adb - Short path: documentation/unity/ts-adb.md |

### docs-api-search

Search API references using BM25 ranking

**Usage:**

```
api-search [OPTIONS] <QUERY>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<query>` (required) | Search query |

**Options:**

| Option | Description |
|--------|-------------|
| `-p, --platform <PLATFORM>` | Platform to search (unity, unreal_ue4, unreal_ue5) (default: unity) |
| `-n, --max-results <MAX_RESULTS>` | Maximum number of results (default: 20) |
| `-o, --output <OUTPUT>` | Output format (default: table) |

### docs-api-details

Get full details for an API entry

**Usage:**

```
api-details [OPTIONS] <NAME>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<name>` (required) | Name of the API entry (e.g., "OVRInput", "OVRSpatialAnchor") |

**Options:**

| Option | Description |
|--------|-------------|
| `-p, --platform <PLATFORM>` | Platform to search (unity, unreal_ue4, unreal_ue5) (default: unity) |
| `-o, --output <OUTPUT>` | Output format (default: plain) |

### docs-api-stats

Show statistics about loaded API reference indexes

**Usage:**

```
api-stats [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-o, --output <OUTPUT>` | Output format (default: table) |

## files

Manage files on the device (ls, push, pull, rm, mkdir)

**Usage:**

```
files <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`ls`](#files-ls) | List files and directories on the device |
| [`pull`](#files-pull) | Download a file from the device |
| [`push`](#files-push) | Upload a file to the device |
| [`rm`](#files-rm) | Delete a file or directory on the device |
| [`mkdir`](#files-mkdir) | Create a directory on the device |

### files-ls

List files and directories on the device

**Usage:**

```
ls [OPTIONS] [PATH]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<path>` | Path on the device to list (default: /sdcard/) |

**Options:**

| Option | Description |
|--------|-------------|
| `-a, --all` | Show hidden files (starting with .) |

### files-pull

Download a file from the device

**Usage:**

```
pull <REMOTE_PATH> [LOCAL_PATH]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<remote_path>` (required) | Path to the file on the device |
| `<local_path>` | Local path to save the file (default: current directory) |

### files-push

Upload a file to the device

**Usage:**

```
push <LOCAL_PATH> <REMOTE_PATH>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<local_path>` (required) | Path to the local file to upload |
| `<remote_path>` (required) | Path on the device to save the file |

### files-rm

Delete a file or directory on the device

**Usage:**

```
rm [OPTIONS] <PATH>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<path>` (required) | Path to the file or directory on the device |

**Options:**

| Option | Description |
|--------|-------------|
| `-r, --recursive` | Recursively delete directories |

### files-mkdir

Create a directory on the device

**Usage:**

```
mkdir [OPTIONS] <PATH>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<path>` (required) | Path of the directory to create |

**Options:**

| Option | Description |
|--------|-------------|
| `-p, --parents` | Create parent directories as needed (default: true) |

## log

View device logs (shortcut for `adb logcat`)

**Usage:**

```
log [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-n, --lines <LINES>` | Number of recent lines to show (default: 100) |
| `-t, --tag <TAG>` | Filter by tag |
| `-l, --level <LEVEL>` | Minimum log level (V, D, I, W, E, F) |
| `-c, --clear` | Clear the log buffer before reading |

## perf

Performance analysis and Perfetto trace tools

**Usage:**

```
perf <COMMAND>
```

**Subcommands:**

| Command | Description |
|---------|-------------|
| [`capture`](#perf-capture) | Capture a timed Perfetto trace from a connected device |
| [`context`](#perf-context) | Get performance analysis context/prompt |
| `gpu-counters` | Not supported on Linux |
| `analyze-trace` | Not supported on Linux |
| [`hex-to-datetime`](#perf-hex-to-datetime) | Convert a hexadecimal timestamp to datetime |
| `load` | Not supported on Linux |
| [`open`](#perf-open) | Open a Perfetto trace in the Perfetto UI (ui.perfetto.dev) |
| `query` | Not supported on Linux |
| [`start`](#perf-start) | Start a background Perfetto capture (manual start/stop) |
| [`stop`](#perf-stop) | Stop a background Perfetto capture and pull the trace |
| `thread-state` | Not supported on Linux |
| `compare` | Not supported on Linux |
| [`traces`](#perf-traces) | List available Perfetto traces |

Traces are stored locally in `~/.local/share/hzdb/traces/` (or `$XDG_DATA_HOME/hzdb/traces/`).

### perf-capture

Capture a timed Perfetto trace from a connected device

**Usage:**

```
capture [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-m, --mode <MODE>` | Capture mode preset: standard (default), gpu, cpu, lightweight, full, custom (default: standard) |
| `--duration <DURATION>` | Duration of capture in milliseconds (default: 5000) |
| `--app <APP>` | App package name to trace (auto-detects if not specified) |
| `-o, --output <OUTPUT>` | Output filename (without extension) |
| `--gpu-render-stage` | Enable GPU render stage tracing (only with --mode custom) |
| `--gpu-metrics` | Enable GPU metrics tracing (only with --mode custom) |
| `--cpu-scheduling` | Enable CPU scheduling tracing (only with --mode custom) |
| `--xr-runtime` | Enable XR runtime metrics (only with --mode custom) |
| `--vulkan-layer` | Enable Vulkan OS layer tracing (only with --mode custom) |
| `--extended-scheduling` | Enable extended scheduling events (only with --mode custom) |

### perf-context

Get performance analysis context

**Usage:**

```
context [SESSION_ID]
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<session_id>` | Optional session ID for trace-specific context |

### perf-hex-to-datetime

Convert a hexadecimal timestamp to datetime

**Usage:**

```
hex-to-datetime <HEX_STR>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<hex_str>` (required) | Hexadecimal string representing Unix timestamp (nanoseconds) |

### perf-open

Open a Perfetto trace file with the system default handler

**Usage:**

```
open <SESSION_ID>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<session_id>` (required) | Session ID (trace file name without extension) |

### perf-start

Start a background Perfetto capture (manual start/stop)

**Usage:**

```
start [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-m, --mode <MODE>` | Capture mode preset: standard (default), gpu, cpu, lightweight, full, custom (default: standard) |
| `--app <APP>` | App package name to trace (auto-detects if not specified) |
| `-o, --output <OUTPUT>` | Output filename (without extension) |
| `--gpu-render-stage` | Enable GPU render stage tracing (only with --mode custom) |
| `--gpu-metrics` | Enable GPU metrics tracing (only with --mode custom) |
| `--cpu-scheduling` | Enable CPU scheduling tracing (only with --mode custom) |
| `--xr-runtime` | Enable XR runtime metrics (only with --mode custom) |
| `--vulkan-layer` | Enable Vulkan OS layer tracing (only with --mode custom) |
| `--extended-scheduling` | Enable extended scheduling events (only with --mode custom) |

### perf-stop

Stop a background Perfetto capture and pull the trace

**Usage:**

```
stop <PID> <OUTPUT_NAME>
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<pid>` (required) | PID of the background perfetto process (from `hzdb perf start` output) |
| `<output_name>` (required) | Output name (from `hzdb perf start` output) |

### perf-traces

List available Perfetto traces

**Usage:**

```
traces [OPTIONS]
```

**Options:**

| Option | Description |
|--------|-------------|
| `-l, --limit <LIMIT>` | Maximum number of traces to list (default: 10) |

## shell

Run a shell command on the device (shortcut for `adb shell`)

**Usage:**

```
shell [COMMANDS]...
```

**Arguments:**

| Argument | Description |
|----------|-------------|
| `<commands>` | Command and arguments to run (interactive shell if omitted) |
