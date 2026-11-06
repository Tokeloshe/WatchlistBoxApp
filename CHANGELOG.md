# Changelog

What changed in each download. Dates are release dates.

## 0.1.0 (2026-11-05)

The first release, for 64-bit Windows 10 and 11 and for Apple Silicon Macs.

- One download per computer. The Windows installer and the portable zip carry the TV system
  inside; the Mac app comes with the TV system as a second download.
- Boots an Android 16 TV system of WatchlistBox's own (based on LineageOS 23.2, nothing
  proprietary in it) and opens Watchlist Pro straight away: no launcher, setup wizard or boot
  animation. The box opens the app again whenever it closes.
- Downloads the current Watchlist Pro app from its publisher on the first start; nothing else
  to find or copy. If that download fails, the error card lets you choose the app file.
- Plays films with sound, full screen, in the window of a normal application with the
  WatchlistBox name and icon.
- The mouse works on every screen: a click is a tap, the right button is Back, the wheel
  scrolls. Keyboards and game controllers work too.
- Blocks trackers and advertising for the TV system with a filter list that works offline on
  the first start and updates daily.
- Windows: installs for the current user only, without administrator rights or a restart; turns
  on the Windows Hypervisor Platform and adds the firewall rule for playback when you allow it;
  uninstalls cleanly and asks whether to keep your data.
- Mac: runs under Apple's Hypervisor, draws the picture in the TV system's own colours, quits
  cleanly when the window is closed or the app is ended from Terminal. Needs macOS 26 in this
  build.
- `--selftest` checks an installed copy from the inside and reports each check on one line.
