# Source offer

WatchlistBox ships two things that are not its own and that carry copyleft licences. This
page says what they are, where their complete corresponding source is, and repeats the written
offer that the GNU licences ask for.

## What is covered

1. **QEMU**, GPLv2. The Windows downloads include an unmodified `qemu-system-x86_64.exe` and its
   libraries from the MSYS2 UCRT64 package `mingw-w64-ucrt-x86_64-qemu 11.1.2-1`. The macOS
   downloads include a `qemu-system-aarch64` built from the QEMU 11.1.2 release tarball with
   two small patches (the virtio-gpu device reads the TV system's red-first 2D buffers as such,
   and the Cocoa window draws a surface in its own byte order). Neither program is linked into
   WatchlistBox; each is a separate process.
2. **The Android TV system** (`wlb-tv-16.0-20261028-r1` on Windows, `wlb-tv-16.0-20261104-r2` on
   macOS). It is based on LineageOS 23.2 (Android 16) for virtual machines with the open-source
   Digitalis ARM bridge and WatchlistBox's own product files. The Linux kernel (6.12) and its
   modules and the GPL-2.0 user-space packages are GPLv2; GRUB, bash and nano are GPLv3; the rest
   is Apache-2.0, LGPL and permissive licences, each recorded inside the image
   (`/system/etc/NOTICE.xml.gz` and the matching files of the other partitions). Nothing
   proprietary is in it.

## Where the source is

- `WatchlistBox-0.1.0-gpl-sources.zip` on the
  [v0.1.0 release page](https://github.com/Tokeloshe/WatchlistBoxApp/releases/tag/v0.1.0)
  holds everything the project adds to the TV system (the local manifest that pins Digitalis,
  the patches, the product files and the build scripts), the `repo manifest -r` snapshot that
  names the exact commit of every LineageOS, AOSP and Digitalis project the images were built
  from, kernel included, and the two macOS QEMU patches. With the snapshot and the LineageOS
  tools, anyone can fetch the identical sources and rebuild the image.
- QEMU 11.1.2: https://download.qemu.org/qemu-11.1.2.tar.xz. The MSYS2 package's source and build
  recipe: https://repo.msys2.org/mingw/sources/mingw-w64-qemu-11.1.2-1.src.tar.zst and
  https://github.com/msys2/MINGW-packages. The macOS build's exact configure line and the
  SHA-256 of each patch are in `licenses/QEMU-BUILD.txt` inside the Mac app.
- The libraries QEMU uses on Windows are unmodified MSYS2 UCRT64 packages, listed with their
  licences in [THIRD-PARTY-NOTICES-windows.txt](THIRD-PARTY-NOTICES-windows.txt); their sources
  are at https://repo.msys2.org/mingw/sources/.
- The LineageOS, AOSP and Digitalis trees themselves are public and are the ones the snapshot
  names.

## The written offer

For three years from the date of each release, James Honiball will supply the complete
corresponding source of every GPL and LGPL component of that release, on Windows and on macOS,
with the scripts that control its build, to anyone who asks: as a download, or on a physical
medium for no more than the cost of making and sending it. Write to jhoniball4@gmail.com with
the subject line `WatchlistBox source request` and the version you have. The same offer is
printed in `THIRD-PARTY-NOTICES.txt` inside the installed program.

The licence texts themselves ship with the program (`licenses\` on Windows, inside the app on
macOS) and are reproduced in the third-party notices on this page.
