#!/bin/bash
# WatchlistBox for Mac: the installer.
# Copyright (c) 2026 James Honiball
#
# Downloads WatchlistBox 0.1.0 and its TV system from the release page, checks both against
# their SHA-256, puts the app in Applications and the TV system where the app looks for it,
# clears the download quarantine so the app opens without the "Open Anyway" step, and starts
# it. Uses only what every Mac has: curl, shasum, hdiutil, ditto, tar, xattr, open.
#
# Run it with one line in Terminal:
#   curl -fsSL https://raw.githubusercontent.com/Tokeloshe/WatchlistBoxApp/main/install.sh | bash
# or double-click "Install WatchlistBox.command" from the release page.
#
# Running it again updates the app and keeps your TV profile and settings. Nothing is written
# outside Applications, ~/Library/Application Support/WatchlistBox and a temporary folder.

set -euo pipefail

VERSION=0.1.0
IMAGE_ID=wlb-tv-16.0-20261104-r2
BASE="https://github.com/Tokeloshe/WatchlistBoxApp/releases/download/v$VERSION"
DMG="WatchlistBox-$VERSION-macOS-arm64.dmg"
TAR="WatchlistBox-$VERSION-macOS-arm64-image-$IMAGE_ID.tar"
DMG_SHA=24445a2b3d175db6ea8c4dd03bb74b36c42c3c9305bbec7e392fe7d51148f7e8
TAR_SHA=d6e29fb008da5a2ec1705a89f607a412512efa94df59f08b16e17af228727ebb
MIN_MACOS=26

APP_NAME=WatchlistBox.app
SUPPORT="$HOME/Library/Application Support/WatchlistBox"
IMAGES="$SUPPORT/images"

say()  { printf '%s\n' "$*"; }
step() { printf '\n==> %s\n' "$*"; }
stop() {
    printf '\nSTOPPED: %s\n' "$1" >&2
    [ $# -ge 2 ] && printf '%s\n' "$2" >&2
    exit 1
}

# ---------------------------------------------------------------------------- this Mac

[ "$(uname -s)" = Darwin ] || stop "this installer is for macOS."
[ "$(uname -m)" = arm64 ] || stop "WatchlistBox needs an Apple Silicon Mac (M1 or later); this Mac has an Intel processor."
macos=$(sw_vers -productVersion)
case "$macos" in
    [0-9].*|1[0-9].*|2[0-5].*) stop "WatchlistBox $VERSION needs macOS $MIN_MACOS or later; this Mac runs macOS $macos." ;;
esac
for tool in curl shasum hdiutil ditto tar xattr open df; do
    command -v "$tool" >/dev/null 2>&1 || stop "$tool is missing, which every Mac normally has."
done

# Applications: the system folder when this account may write there, else the user's own.
if [ -w /Applications ]; then
    APPS=/Applications
else
    APPS="$HOME/Applications"
    mkdir -p "$APPS"
fi
APP="$APPS/$APP_NAME"

# Space: the two downloads, the app, the TV system and room for the first boot.
free_mb=$(df -m "$HOME" | awk 'NR == 2 { print $4 }')
[ "${free_mb:-0}" -ge 4000 ] || stop "WatchlistBox needs about 4 GB free; this Mac has ${free_mb:-0} MB free in your home folder."

say "WatchlistBox $VERSION for Mac"
say "  app:        $APP"
say "  TV system:  $IMAGES/$IMAGE_ID"
say "  this Mac:   macOS $macos, Apple Silicon"

# ---------------------------------------------------------------------------- downloads

WORK=$(mktemp -d -t watchlistbox-install)
trap 'rm -rf "$WORK"' EXIT

# fetch NAME SHA: uses a matching file already in ~/Downloads, else downloads it (resumable),
# then checks the SHA-256. A file that fails the check is removed and fetched once more.
fetch() {
    local name=$1 want=$2 src got attempt
    for attempt in 1 2; do
        src="$WORK/$name"
        if [ -f "$HOME/Downloads/$name" ] && [ ! -f "$src" ]; then
            say "  found $name in Downloads, checking it"
            cp "$HOME/Downloads/$name" "$src"
        fi
        if [ ! -f "$src" ]; then
            say "  downloading $name"
            curl -fL --retry 3 --retry-delay 2 -C - --progress-bar -o "$src" "$BASE/$name" \
                || stop "the download of $name failed." "Check the internet connection, then run the installer again; it carries on where it stopped."
        fi
        got=$(shasum -a 256 "$src" | awk '{ print $1 }')
        if [ "$got" = "$want" ]; then
            say "  $name: checked"
            return 0
        fi
        say "  $name does not match its checksum (got $got); fetching it again"
        rm -f "$src"
        [ -f "$HOME/Downloads/$name" ] && mv "$HOME/Downloads/$name" "$HOME/Downloads/$name.bad"
    done
    stop "$name failed its checksum twice." "The download is damaged or has been tampered with. Nothing was installed."
}

step "Downloading (about 1 GB in all)"
fetch "$DMG" "$DMG_SHA"
fetch "$TAR" "$TAR_SHA"

# ---------------------------------------------------------------------------- the app

step "Installing the app into $APPS"
if pgrep -x WatchlistBox >/dev/null 2>&1; then
    say "  WatchlistBox is running; asking it to quit"
    osascript -e 'tell application "WatchlistBox" to quit' >/dev/null 2>&1 || true
    sleep 3
fi
MOUNT="$WORK/dmg"
mkdir -p "$MOUNT"
hdiutil attach -nobrowse -readonly -noverify -mountpoint "$MOUNT" "$WORK/$DMG" >/dev/null \
    || stop "the disk image could not be opened."
[ -d "$MOUNT/$APP_NAME" ] || { hdiutil detach "$MOUNT" -quiet || true; stop "the disk image does not hold $APP_NAME."; }
rm -rf "$APP"
ditto "$MOUNT/$APP_NAME" "$APP" || { hdiutil detach "$MOUNT" -quiet || true; stop "copying the app into $APPS failed."; }
hdiutil detach "$MOUNT" -quiet || hdiutil detach "$MOUNT" -force -quiet || true
xattr -dr com.apple.quarantine "$APP" 2>/dev/null || true
[ -x "$APP/Contents/MacOS/WatchlistBox" ] || stop "$APP is incomplete after the copy."
say "  $APP"

# ---------------------------------------------------------------------------- the TV system

step "Installing the TV system"
mkdir -p "$IMAGES"
if [ -f "$IMAGES/$IMAGE_ID/image.json" ] && [ -f "$IMAGES/$IMAGE_ID/system.qcow2" ]; then
    say "  $IMAGE_ID is already installed; keeping it"
else
    rm -rf "$IMAGES/$IMAGE_ID"
    tar -xf "$WORK/$TAR" -C "$IMAGES" || stop "unpacking the TV system into $IMAGES failed."
    [ -f "$IMAGES/$IMAGE_ID/image.json" ] || stop "the TV system did not unpack as $IMAGES/$IMAGE_ID."
    say "  $IMAGES/$IMAGE_ID"
fi
xattr -dr com.apple.quarantine "$IMAGES/$IMAGE_ID" 2>/dev/null || true
chmod 700 "$SUPPORT"

# ---------------------------------------------------------------------------- done

step "Done"
say "  WatchlistBox is installed. It is starting now; the first start downloads the Watchlist Pro"
say "  app and takes about a minute. Next time, open WatchlistBox from Applications like any app."
say "  To remove it: drag $APP to the Trash and delete the folder"
say "  $SUPPORT"
open -a "$APP" || say "  (it did not start by itself; open WatchlistBox from $APPS)"
