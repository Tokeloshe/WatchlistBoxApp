#!/usr/bin/env python3
# Counts the downloads of every release file and writes the badges the README shows.
# Copyright (c) 2026 James Honiball
#
# Run by .github/workflows/counters.yml once an hour. It reads the releases of this repository
# through the GitHub API, sums the download counts (Windows = the installer, Mac = the app's
# disk image, all = every file), and writes to the folder given as the first argument:
#   release.svg, windows.svg, mac.svg, all.svg   the badges of the README's header
#   windows-count.svg, mac-count.svg             the bare numbers of "Downloads so far"
#   counts.json                                  the numbers, for anything else that wants them
# Each badge is fetched from shields.io's static service so it matches the other badges on the
# page; when shields.io does not answer, the badge is drawn here in the same style, so an hour
# without shields.io never leaves the page without counters.

import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

REPO = os.environ.get("GITHUB_REPOSITORY", "Tokeloshe/WatchlistBoxApp")
TOKEN = os.environ.get("GITHUB_TOKEN", "")
AMBER = "F5970E"
BLUE = "1F6FEB"


def fetch(url, accept, tries=3):
    headers = {"Accept": accept, "User-Agent": "WatchlistBoxApp-counters"}
    if TOKEN and url.startswith("https://api.github.com/"):
        headers["Authorization"] = "Bearer " + TOKEN
    last = None
    for attempt in range(tries):
        try:
            with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=30) as r:
                return r.headers.get("Content-Type", ""), r.read()
        except (urllib.error.URLError, TimeoutError, OSError) as e:
            last = e
            time.sleep(2 * (attempt + 1))
    raise RuntimeError(f"{url}: {last}")


def releases():
    out = []
    page = 1
    while True:
        _, body = fetch(f"https://api.github.com/repos/{REPO}/releases?per_page=100&page={page}",
                        "application/vnd.github+json")
        chunk = json.loads(body)
        out.extend(r for r in chunk if not r.get("draft"))
        if len(chunk) < 100:
            return out
        page += 1


def short(n):
    if n < 1000:
        return str(n)
    for unit, size in (("M", 1_000_000), ("k", 1_000)):
        if n >= size:
            value = n / size
            text = f"{value:.1f}".rstrip("0").rstrip(".") if value < 100 else f"{value:.0f}"
            return text + unit
    return str(n)


# ---------------------------------------------------------------------------- badges

def text_width(text):
    """Roughly Verdana 11px, as shields draws it; textLength in the SVG makes the exact value
    matter little."""
    width = 0.0
    for ch in text:
        if ch.isdigit():
            width += 7.0
        elif ch == " ":
            width += 3.6
        elif ch in ".,:;'":
            width += 3.8
        elif ch.isupper():
            width += 7.8
        else:
            width += 6.4
    return width


def draw(label, value, color):
    """A badge in shields.io's flat style: grey label, coloured value, 20 px high."""
    lw = round(text_width(label) + 10) if label else 0
    vw = round(text_width(value) + 10)
    w = lw + vw
    title = f"{label}: {value}" if label else value
    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="20" role="img" aria-label="{title}">',
        f"<title>{title}</title>",
        '<linearGradient id="s" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/>'
        '<stop offset="1" stop-opacity=".1"/></linearGradient>',
        f'<clipPath id="r"><rect width="{w}" height="20" rx="3" fill="#fff"/></clipPath>',
        '<g clip-path="url(#r)">',
    ]
    if lw:
        parts.append(f'<rect width="{lw}" height="20" fill="#555"/>')
    parts.append(f'<rect x="{lw}" width="{vw}" height="20" fill="#{color}"/>')
    parts.append(f'<rect width="{w}" height="20" fill="url(#s)"/></g>')
    parts.append('<g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" '
                 'text-rendering="geometricPrecision" font-size="110">')

    def text(x, t, tw):
        return (f'<text aria-hidden="true" x="{x}" y="150" fill="#010101" fill-opacity=".3" '
                f'transform="scale(.1)" textLength="{tw}">{t}</text>'
                f'<text x="{x}" y="140" transform="scale(.1)" fill="#fff" textLength="{tw}">{t}</text>')

    if lw:
        parts.append(text(round(lw * 5), label, round((lw - 10) * 10)))
    parts.append(text(round((lw + vw / 2) * 10), value, round((vw - 10) * 10)))
    parts.append("</g></svg>\n")
    return "".join(parts).encode("utf-8")


def shields(label, value, color):
    def esc(t):
        return urllib.parse.quote(t.replace("-", "--").replace("_", "__"), safe="")
    url = f"https://img.shields.io/badge/{esc(label)}-{esc(value)}-{color}"
    try:
        kind, body = fetch(url, "image/svg+xml", tries=2)
    except RuntimeError as e:
        print(f"shields.io did not answer for '{label}': {e}; drawing it here", file=sys.stderr)
        return None
    if "svg" not in kind or b"<svg" not in body:
        print(f"shields.io gave no SVG for '{label}'; drawing it here", file=sys.stderr)
        return None
    return body


def badge(label, value, color):
    return shields(label, value, color) or draw(label, value, color)


# ---------------------------------------------------------------------------- main

def main():
    out = sys.argv[1] if len(sys.argv) > 1 else "out"
    os.makedirs(out, exist_ok=True)
    rels = releases()
    windows = mac = total = 0
    for r in rels:
        for a in r.get("assets", []):
            n = a.get("download_count", 0)
            name = a.get("name", "")
            total += n
            if name.lower().endswith(".exe"):
                windows += n
            elif name.endswith("-macOS-arm64.dmg"):
                mac += n
    latest = next((r["tag_name"] for r in rels if not r.get("prerelease")), "none")

    files = {
        "release.svg": badge("release", latest, BLUE),
        "windows.svg": badge("Windows", short(windows), AMBER),
        "mac.svg": badge("Mac", short(mac), AMBER),
        "all.svg": badge("all downloads", short(total), AMBER),
        "windows-count.svg": badge("", short(windows), AMBER),
        "mac-count.svg": badge("", short(mac), AMBER),
        "counts.json": json.dumps({"release": latest, "windows": windows, "mac": mac, "all": total,
                                   "counted_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())},
                                  indent=2).encode("utf-8") + b"\n",
    }
    for name, body in files.items():
        with open(os.path.join(out, name), "wb") as f:
            f.write(body)
    print(f"release {latest}: windows {windows}, mac {mac}, all {total}; {len(files)} files in {out}")


if __name__ == "__main__":
    main()
