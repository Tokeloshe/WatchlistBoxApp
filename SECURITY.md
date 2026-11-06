# Security policy

## Supported versions

WatchlistBox is pre-release software. Only the most recent 0.x release
receives security fixes.

| Version              | Supported |
| -------------------- | --------- |
| latest 0.x release   | yes       |
| any earlier 0.x      | no        |
| source builds of `main` | best effort: report the commit hash |

## Reporting a vulnerability

Please do not open a public issue for a security problem. Report it
privately through one of these channels:

1. GitHub Security Advisories: use "Report a vulnerability" on the
   repository's Security tab. This is the preferred channel because it
   keeps the discussion, the fix and the credit in one place.
2. Email: jhoniball4@gmail.com with the subject line
   `WatchlistBox security report`. If you want to encrypt the report, say
   so in a first message and a key will be provided.

Include what you can of: the affected version or commit, the component
(for example `wlb-dnsd`, the plugin loader, the updater, the guest agent),
steps to reproduce, the impact you believe it has, and whether the problem
is already public anywhere.

## What to expect

- Acknowledgement within 72 hours of receipt.
- An initial assessment (confirmed, needs more information, or not a
  vulnerability) within 7 days.
- Coordinated disclosure: the fix is developed privately, a release is
  published, and the advisory is made public at the same time. The target
  is 90 days from report to public disclosure; if a fix will take longer,
  you will be told why and given a revised date. If the problem is being
  exploited in the wild, disclosure is accelerated.
- Credit in the advisory and in `CHANGELOG.md`, unless you ask not to be
  named.

There is no bug bounty programme.

## Scope notes

- WatchlistBox itself makes no telemetry connections and sends no usage
  data anywhere. The host application's outbound connections are limited to
  fetching DNS filter lists and downloading the Watchlist Pro app from its
  publisher; the complete list of endpoints is maintained with the program's
  source. Anything else leaving the host process is a bug and in scope.
- The Android application that runs inside the guest is third-party
  software; vulnerabilities in that application should be reported to its
  vendor, not here. Ways in which WatchlistBox fails to
  contain it as documented (for example a DNS sink that can be bypassed in
  a way the documentation claims is prevented) are in scope.
- QEMU and the guest operating system image are separate upstream projects.
  Vulnerabilities in them belong upstream; how WatchlistBox configures,
  launches or isolates them is in scope.
- The update mechanism verifies releases with an embedded Ed25519 public
  key. Any way to install an update that was not signed with the matching
  private key is in scope and treated as critical.
- Plugins are loaded in-process. A malicious plugin can do anything the
  application can; this is by design and documented. Bypassing the plugin
  manifest hash check, or loading a plugin the user did not install, is in
  scope.
