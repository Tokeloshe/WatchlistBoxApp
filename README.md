<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/watchlistbox-wordmark.svg">
    <source media="(prefers-color-scheme: light)" srcset="assets/watchlistbox-wordmark-light.svg">
    <img src="assets/watchlistbox-wordmark-light.svg" alt="WatchlistBox" width="520">
  </picture>
</p>

<p align="center"><em>A Honiball brothers app</em></p>

<p align="center">
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/latest"><img src="https://img.shields.io/github/v/release/Tokeloshe/WatchlistBoxApp?label=release&color=1F6FEB" alt="Latest release"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Setup-x64.exe"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-Setup-x64.exe?label=Windows&color=F5970E" alt="Windows downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg?label=Mac&color=F5970E" alt="Mac downloads"></a>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases"><img src="https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/total?label=all%20downloads&color=F5970E" alt="All downloads"></a>
</p>

<p align="center">
  WatchlistBox turns a Windows PC or an Apple Silicon Mac into a set-top box for Watchlist Pro.<br>
  One download, and the computer boots straight into the app and plays your films full screen,<br>
  driven by a keyboard, a game controller or a mouse. Free.
</p>

## Download

Pick your computer. The TV system comes with it, and the Watchlist Pro app itself downloads on
the first start, so there is nothing else to fetch.

### Windows (64-bit)

<p>
  <a href="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-Setup-x64.exe"><img src="https://img.shields.io/badge/Download%20for%20Windows-WatchlistBox--Setup--x64.exe-F5970E?style=for-the-badge" alt="Download WatchlistBox-Setup-x64.exe"></a>
</p>

| | |
| --- | --- |
| **Size** | 1.07 GB, the TV system included |
| **Needs** | Windows 10 version 1809 or later, or Windows 11; a CPU with virtualisation (Intel VT-x or AMD-V, turned on in the PC's firmware); a few gigabytes of free disk space |

1. Open the downloaded file and press **Install**. It installs for your user account, needs
   no administrator password and no restart, and then offers to start WatchlistBox.
2. Start WatchlistBox. When Windows asks whether WatchlistBox may add a firewall rule, press
   **Yes**. Films cannot play without it, and the question comes once.
3. WatchlistBox downloads the current Watchlist Pro app and opens it. Sign in with your own
   Watchlist Pro account and watch.

> [!TIP]
> If WatchlistBox says hardware acceleration is off, the TV still runs, but slowly. To make it
> fast: search the Start menu for **Turn Windows features on or off**, tick **Windows
> Hypervisor Platform**, press OK, restart the PC, and start WatchlistBox again.

### macOS (Apple Silicon)

| | |
| --- | --- |
| **Size** | 55 MB app, plus the 929 MB TV system; the installer fetches both |
| **Needs** | An Apple Silicon Mac (M1 or later) with macOS 26 or later |

Open **Terminal** (press <kbd>⌘</kbd><kbd>Space</kbd>, type `Terminal`, press Return), paste
this one line and press Return:

```sh
curl -fsSL https://raw.githubusercontent.com/Tokeloshe/WatchlistBoxApp/main/install.sh | bash
```

It downloads the app and the TV system, checks both, puts the app in Applications, and starts
it. WatchlistBox then downloads the current Watchlist Pro app and opens it. Sign in with your
own Watchlist Pro account and watch. From then on, open WatchlistBox from Applications like
any app. Running the line again later updates it and keeps your settings.

<details>
<summary>Rather double-click than paste?</summary>

Download [Install-WatchlistBox.command.zip](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/Install-WatchlistBox.command.zip),
double-click the zip, then double-click **Install WatchlistBox.command**. The first time, macOS
says it cannot be opened: press **Done**, open **System Settings › Privacy & Security**, scroll
to Security, press **Open Anyway**, enter your password and press **Open**. It is the same
installer as the line above, and it takes care of that step for the app itself.
</details>

<details>
<summary>Rather do it by hand?</summary>

Download [WatchlistBox-0.1.0-macOS-arm64.dmg](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg)
and [the TV system](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar).

1. Open the `.dmg`, open a second Finder window at Applications, and drag WatchlistBox into
   it. Always open it from Applications, not from the disk image or Downloads.
2. Double-click the downloaded `.tar`. It unpacks to a folder named
   `wlb-tv-16.0-20261104-r2`.
3. In Finder choose **Go › Go to Folder** and enter `~/Library/Application Support`. If there
   is no `WatchlistBox` folder there, make one (**File › New Folder**), and inside it a folder
   named `images`. Move the `wlb-tv-16.0-20261104-r2` folder into `images`.
4. Double-click WatchlistBox in Applications. The first time, macOS says "WatchlistBox" Not
   Opened: press **Done**, not Move to Trash. Open **System Settings › Privacy & Security**,
   scroll to Security, press **Open Anyway** next to the WatchlistBox line, enter your password
   and press **Open**. This happens once.
5. WatchlistBox downloads the current Watchlist Pro app and opens it. Sign in with your own
   Watchlist Pro account and watch.

The same from Terminal:

```sh
mkdir -p "$HOME/Library/Application Support/WatchlistBox/images"
tar -xf ~/Downloads/WatchlistBox-0.1.0-macOS-arm64-image-wlb-tv-16.0-20261104-r2.tar -C "$HOME/Library/Application Support/WatchlistBox/images"
xattr -dr com.apple.quarantine /Applications/WatchlistBox.app
```
</details>

### Downloads so far

| | Downloads |
| --- | --- |
| Windows installer | ![](https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-Setup-x64.exe?label=&color=F5970E) |
| Mac app | ![](https://img.shields.io/github/downloads/Tokeloshe/WatchlistBoxApp/v0.1.0/WatchlistBox-0.1.0-macOS-arm64.dmg?label=&color=F5970E) |

<details>
<summary>Checking a download</summary>

Every file's SHA-256 is in
[SHA256SUMS.txt](https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v0.1.0/SHA256SUMS.txt)
on the release page.
</details>

## What it does

- **Boots straight into Watchlist Pro.** Its own Android 16 TV system starts in a virtual
  machine and opens the app, with no Android desktop, launcher or setup wizard in between.
  When the app closes, WatchlistBox opens it again.
- **Full screen.** On Windows the picture fills the monitor or TV you choose, the way a box
  behind the television would; on a Mac it opens in its own window.
- **Keyboard, mouse, game controller.** A click is a tap, the right button is Back, the
  wheel moves up and down the page.
- **Blocks trackers and advertising** for the TV system at the DNS layer, with a bundled list
  that works offline and daily updates from the public lists.
- **Your data stays yours.** The TV profile, settings and logs live in your own user folder:
  `%LOCALAPPDATA%\WatchlistBox` on Windows, `~/Library/Application Support/WatchlistBox` on a
  Mac. The Windows uninstaller asks whether to remove it; on a Mac, delete that folder
  yourself.
- **Sends nothing home.** The connections it makes are to Watchlist Pro's own servers, the
  app download, and the public filter lists.

It is not a general-purpose Android emulator, and it runs one app only.

## Troubleshooting

- **Windows: a card says films may not start (the firewall).** Press **Allow in firewall** and
  approve the Windows prompt.
- **Windows: a card says hardware acceleration is off.** Turn on the Windows Hypervisor
  Platform in Windows Features, restart the PC, and start WatchlistBox again (the tip under
  "Windows" above).
- **Windows: a card says the PC has no virtualisation.** Turn on Intel VT-x or AMD-V in the
  PC's firmware (BIOS or UEFI) settings, then start WatchlistBox again.
- **Mac: the app bounces in the Dock and nothing opens.** Run the install line under "macOS"
  again; it clears the block macOS puts on downloaded apps. If it still does not open,
  `~/Library/Logs/WatchlistBox/launch.log` says how far it got; send it with your report.
- **Mac: "The TV system is not installed".** Run the install line under "macOS" again; it puts
  the TV system where the app looks for it. Then quit WatchlistBox and open it again.
- **The TV box keeps stopping or will not start.** Press **Try again** on the card. If it
  happens every time, save the diagnostics zip from the card and report it.
- **Something else.** Open an [issue](https://github.com/Tokeloshe/WatchlistBoxApp/issues)
  with your Windows or macOS version and the diagnostics zip the card offers. It holds the
  logs, your settings and the hardware summary, with your folder names blanked.

## Support the project

WatchlistBox is free and made by one person. If it has earned a place under your television,
a coffee is a fine way to say so.

<p align="center">
  <a href="https://buymeacoffee.com/Tokeloshe">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="60">
  </a>
</p>

Other ways, including XRP and the ones that cost nothing, are in [DONATE.md](DONATE.md).

## Licensing and source

WatchlistBox's own code is mostly under the [Apache License 2.0](LICENSE); four components
(the frame and audio path, the DNS filter, the kiosk agent, the TV image tooling) are under
the [WatchlistBox Commercial Licence](LICENSE-COMMERCIAL.md), which allows personal use of
the official downloads. The source repository is not public yet. QEMU ships beside the
program as a separate GPL program, and the TV system carries its own licences, GPL ones among
them; their complete source is offered in [SOURCE-OFFER.md](SOURCE-OFFER.md). Every bundled
component is credited in [NOTICE](NOTICE) and in the third-party notices for
[Windows](THIRD-PARTY-NOTICES-windows.txt) and [macOS](THIRD-PARTY-NOTICES-macos.txt).

Watchlist Pro is a third-party service and application. WatchlistBox is not affiliated with it;
the app is downloaded from its publisher on your computer and is never redistributed here.

Security reports: [SECURITY.md](SECURITY.md). Conduct: [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

---

<p align="center"><sub>Copyright 2026 James Honiball · <em>A Honiball brothers app, for George: <a href="DEDICATION.md">DEDICATION.md</a></em></sub></p>
