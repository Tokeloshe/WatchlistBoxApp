<p align="center">
  <img src="assets/watchlistbox-wordmark.svg" alt="WatchlistBox" width="560">
</p>

<h1 align="center">WatchlistBox</h1>
<p align="center"><em>A Honiball brothers app</em></p>

<p align="center">
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/latest"><img src="https://img.shields.io/github/v/release/Tokeloshe/WatchlistBoxApp?label=release&color=blue" alt="Latest release"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Setup-x64.exe"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-Setup-x64.exe?label=Windows%20installer&color=success" alt="Windows installer downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Portable-x64.zip"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-Portable-x64.zip?label=Windows%20portable&color=success" alt="Windows portable downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg?label=Mac%20app&color=success" alt="Mac app downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar?label=Mac%20TV%20system&color=success" alt="Mac TV system downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/total?label=all%20downloads&color=orange" alt="All downloads"></a>
  <a href="https://buymeacoffee.com/Tokeloshe"><img src="https://img.shields.io/badge/Buy%20me%20a%20coffee-Tokeloshe-FFDD00?logo=buymeacoffee&logoColor=black" alt="Buy me a coffee"></a>
</p>

For my brother, George Thomas Honiball, whose deep appreciation of film and television inspired this project.

WatchlistBox turns a Windows PC or an Apple Silicon Mac into a dedicated set-top box for
Watchlist Pro: one download, boots straight into the app, plays films full screen with a
remote, keyboard, gamepad or mouse. Free. Source-available with an open-source core.

This page holds the downloads and the documents that go with them (see "Source" below).

## Download

Pick your computer. Both downloads carry the complete TV system; the Watchlist Pro app itself
downloads on the first start, so there is nothing else to fetch.

### Windows

**[Download WatchlistBox-Setup-x64.exe](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Setup-x64.exe)** (1.07 GB, Windows 10 or 11, 64-bit)

1. Open the downloaded file and press Install. It installs for you alone, without
   administrator rights and without a restart, then offers to launch WatchlistBox.
2. On the first start WatchlistBox checks the PC. If the Windows Hypervisor Platform is not
   on yet, it asks Windows once for permission to turn it on, and Windows then needs one
   restart. Start WatchlistBox again afterwards.
3. The first time the firewall rule for the player is missing, WatchlistBox asks Windows for
   permission once more. Press Yes; films cannot play without it.
4. WatchlistBox downloads the current Watchlist Pro app and opens it. Sign in with your own
   Watchlist Pro account (it allows two devices) and watch.

Prefer no installer? **[WatchlistBox-Portable-x64.zip](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Portable-x64.zip)**
(1.10 GB): unzip the `WatchlistBox` folder anywhere writable, a USB drive included, and run
`WatchlistBox.exe`. The portable copy keeps everything in `WatchlistBox\data`.

### Mac

**[Download WatchlistBox-0.1.0-macOS-arm64.dmg](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg)** (55 MB, Apple Silicon, macOS 26)
and **[the TV system](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar)** (929 MB)

1. Open the `.dmg` and drag WatchlistBox into Applications. Open it from there, not from
   Downloads.
2. Double-click the downloaded `.tar`. It unpacks to a folder named
   `wlb-tv-16.0-20261104-r2`.
3. In Finder choose Go > Go to Folder, enter
   `~/Library/Application Support/WatchlistBox/images` (create the `WatchlistBox` and
   `images` folders if they are not there), and move the `wlb-tv-16.0-20261104-r2` folder
   into it.
4. Double-click WatchlistBox in Applications. macOS says "WatchlistBox" Not Opened. Press
   Done, not Move to Trash. Then open System Settings > Privacy & Security, scroll to
   Security, press Open Anyway next to "WatchlistBox" was blocked, enter your password and
   press Open. That is once; from now on it opens like any other app.
5. WatchlistBox downloads the current Watchlist Pro app and opens it. Sign in with your own
   Watchlist Pro account (it allows two devices) and watch.

The same steps from Terminal, for those who prefer it:

```sh
mkdir -p "$HOME/Library/Application Support/WatchlistBox/images"
tar -xf ~/Downloads/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar -C "$HOME/Library/Application Support/WatchlistBox/images"
xattr -dr com.apple.quarantine /Applications/WatchlistBox.app
```

A plain zip of the Mac app, **[WatchlistBox-0.1.0-macOS-arm64.zip](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.zip)**
(49 MB), holds the same app for anyone who would rather not use a disk image.

Every download has its SHA-256 in
[SHA256SUMS.txt](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/SHA256SUMS.txt)
on the release page.

## What it does

- Boots its own Android 16 TV system in a virtual machine and opens Watchlist Pro on it, with no
  Android desktop, launcher or setup wizard in between. When the app closes, the box opens it
  again.
- Shows the picture full screen, the way a box behind the television would, on the monitor or
  TV you choose.
- Takes a keyboard, a mouse (a click is a tap, the right button is Back, the wheel scrolls) and
  a game controller.
- Blocks trackers and advertising for the TV system at the DNS layer, with a bundled list that
  works offline and daily updates from the public lists.
- Keeps everything of yours (the TV profile, settings, logs) in your own user folder:
  `%LOCALAPPDATA%\WatchlistBox` on Windows, `~/Library/Application Support/WatchlistBox` on a
  Mac. Uninstalling asks whether to remove it.
- Sends no usage data anywhere. The connections it makes are to Watchlist Pro's own servers,
  the app download, and the public filter lists.

It is not a general-purpose Android emulator, and it runs one app only.

## Requirements

**Windows**: Windows 10 version 1809 or later, or Windows 11, 64-bit; a CPU with virtualisation
extensions (Intel VT-x or AMD-V, on in the firmware) and the Windows Hypervisor Platform
feature, which the first start turns on for you; a few gigabytes of free disk space for the
TV system and your profile.

**Mac**: an Apple Silicon Mac (M1 or later) running macOS 26 or later. This build was made with
Homebrew's Qt, which ties it to the macOS it was built on; a build for older versions of macOS
is planned.

## Troubleshooting

- **Windows: a card says the Hypervisor Platform or the firewall rule is missing.** Press the
  card's Allow or Enable button; Windows asks for an administrator once. The Hypervisor Platform
  needs a restart after it is turned on.
- **Windows: the card says the PC has no virtualisation.** Turn on Intel VT-x or AMD-V in the
  PC's firmware (BIOS or UEFI) settings, then start WatchlistBox again.
- **Mac: the app bounces in the Dock and nothing opens.** Follow step 4 under "Mac" above
  (Open Anyway). If it still does not open, `~/Library/Logs/WatchlistBox/launch.log` says how
  far it got; send it with your report.
- **Mac: "The TV system is not installed".** The `wlb-tv-16.0-20261104-r2` folder is not under
  `~/Library/Application Support/WatchlistBox/images`. Check step 3 under "Mac".
- **A film shows no picture, or sound only.** Quit WatchlistBox and start it again. If it
  happens every time, report it with the diagnostics zip from the error card.
- **Something else.** Open an [issue](https://github.com/Tokeloshe/WatchlistBoxApp/issues) with
  your Windows or macOS version and the diagnostics zip the error card offers; it holds the
  logs and the hardware summary and no account details.

## Support the project

WatchlistBox is free, built by one developer in the evenings. If it has given your television
a better box, a coffee keeps the lights on.

<p align="center">
  <a href="https://buymeacoffee.com/Tokeloshe">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="60">
  </a>
</p>

Other ways, including XRP and the ones that cost nothing, are in [DONATE.md](DONATE.md).

## Licensing

WatchlistBox is source-available with an open-source core.

- Most of the program is under the [Apache License 2.0](LICENSE).
- Four components that hold the project's novel work (the frame and audio path, the DNS filter,
  the kiosk agent, the TV image tooling) are under the
  [WatchlistBox Commercial Licence](LICENSE-COMMERCIAL.md): read, build and contribute freely,
  run the official downloads for personal use, ask for anything else.
- QEMU (GPLv2) ships beside the program as a separate program, and the Android TV system is redistributed under its own licences, GPL ones among them. The
  complete corresponding source is offered in [SOURCE-OFFER.md](SOURCE-OFFER.md).
- Every bundled component is credited in [NOTICE](NOTICE) and in the third-party notices for
  [Windows](THIRD-PARTY-NOTICES-windows.txt) and [macOS](THIRD-PARTY-NOTICES-macos.txt).

Watchlist Pro is a third-party service and application. WatchlistBox is not affiliated with it;
the app is downloaded from its publisher on your computer and is never redistributed here.

## Source

The program's source tree, build system and documentation live in the developer's own
repository, which is not open yet. Until then, the source of the GPL parts is available now through [SOURCE-OFFER.md](SOURCE-OFFER.md). This
repository holds the downloads, the licences and the documents a person needs to install and
run WatchlistBox. Security reports go through [SECURITY.md](SECURITY.md); conduct in this
space follows [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

Copyright 2026 James Honiball.
