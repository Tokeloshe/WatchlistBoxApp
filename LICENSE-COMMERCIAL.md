# WatchlistBox Commercial Licence

Version 1.0, October 2026
SPDX identifier: `LicenseRef-WatchlistBox-Commercial-1.0`
Licensor: James Honiball <jhoniball4@gmail.com>

This licence has not yet been reviewed by a lawyer. It was written by the
Licensor to state as clearly as possible what is and is not allowed. If you
need certainty for a particular use, ask for written permission (section 8).

## Plain-language summary

This summary is a courtesy and is not part of the licence; the numbered
sections below are what counts.

- You can download, install and run the official WatchlistBox releases on
  your own computers for personal use, free of charge.
- You can read the source code of the covered components, build it on your
  own machine to study, test or debug it, and send improvements back as
  contributions.
- When you contribute, you keep your copyright but give James Honiball a
  broad licence to your contribution, including the right to relicense it,
  so the project can keep shipping under both of its licences.
- Everything else needs prior written permission from James Honiball. That
  includes modifying the covered components for your own purposes,
  redistributing them in source or binary form, sublicensing them, building
  products or services on them, and any commercial use.
- The rest of WatchlistBox is licensed under the Apache License, Version 2.0,
  and this licence does not change that.
- The software comes with no warranty, and the Licensor's liability is
  limited as far as the law allows.

## 1. Definitions

"Licence" means this document, the WatchlistBox Commercial Licence,
Version 1.0.

"Licensor" means James Honiball, the copyright holder of the Covered
Components.

"Covered Components" means the parts of WatchlistBox identified in section 2.

"Software" means the Covered Components, in source or binary form.

"Official Release" means a binary distribution of WatchlistBox that the
Licensor publishes on the project's release channel, whether as an installer,
a portable archive or a guest image bundle.

"Personal Use" means use by a natural person, on devices that person owns or
controls, for that person's private, non-commercial purposes. It excludes use
by or on behalf of any business, organisation or public body, and any use
that directly or indirectly generates revenue.

"Contribution" means any original work of authorship, including any
modification of or addition to the Covered Components, that You intentionally
submit to the Licensor for inclusion in WatchlistBox, whether by pull
request, patch, issue attachment, email or any other channel. Anything You
conspicuously mark "Not a Contribution" is not a Contribution.

"You" means the individual or legal entity exercising rights under this
Licence.

## 2. Covered Components

This Licence applies to the following parts of the WatchlistBox repository
and to the corresponding parts of every Official Release:

(a) `core/vmbus`: the Windows client for QEMU's D-Bus display and audio
    interfaces, including the shared-memory and shared-texture presenter
    bridge;

(b) `core/dns` and `dnsd`: the DNS filter engine with per-list exception
    masks, the compiled `wlbl` database format and its compiler, and the
    guest-side DNS enforcement design;

(c) `guest/agent`: the Android device-owner agent, together with the host
    backstop protocol it speaks to the WatchlistBox process (the kiosk
    watchdog);

(d) the HardwareAdvisor component of `core/hwinfo`.

The authoritative list is maintained in `docs/licensing.md`. Every source
file of a Covered Component carries the line
`SPDX-License-Identifier: LicenseRef-WatchlistBox-Commercial-1.0`. A file
that carries an Apache-2.0 identifier is not a Covered Component even if it
is located in one of the directories named above.

## 3. Licence for Official Releases

Subject to Your compliance with this Licence, the Licensor grants You a
worldwide, non-exclusive, non-transferable, non-sublicensable, royalty-free
licence to download, install, execute and use the Covered Components as
contained in an unmodified Official Release, for Personal Use only. You may
make as many copies of an Official Release as are reasonably necessary for
backup and for installation on devices You own or control.

## 4. Licence for source code

Subject to Your compliance with this Licence, the Licensor grants You a
worldwide, non-exclusive, non-transferable, non-sublicensable, royalty-free
licence to:

(a) access, read and study the source code of the Covered Components;

(b) compile, run and test that source code on devices You own or control,
    for the purposes of evaluating it, verifying its behaviour, reporting
    defects and developing Contributions; and

(c) modify that source code solely to the extent necessary to prepare a
    Contribution, and submit that Contribution to the Licensor.

This section does not permit You to give builds of the Covered Components,
in modified or unmodified form, to anyone else.

## 5. Contributions

5.1 Copyright licence. You grant to the Licensor, and to recipients of
software distributed by the Licensor, a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright licence to reproduce, prepare
derivative works of, publicly display, publicly perform, sublicense and
distribute Your Contributions and such derivative works, under this Licence,
under the Apache License, Version 2.0, or under any other terms the Licensor
chooses, including proprietary terms.

5.2 Patent licence. You grant to the Licensor, and to recipients of software
distributed by the Licensor, a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable (except as stated in this section)
patent licence to make, have made, use, offer to sell, sell, import and
otherwise transfer the Covered Components, where such licence applies only
to those patent claims licensable by You that are necessarily infringed by
Your Contribution alone or by the combination of Your Contribution with the
Covered Components to which it was submitted. If You institute patent
litigation against any entity alleging that the Covered Components or a
Contribution incorporated within them constitutes direct or contributory
patent infringement, every patent licence granted to You under this Licence
terminates as of the date that litigation is filed.

5.3 You keep Your copyright. Except for the licences granted in this
section, You reserve all right, title and interest in Your Contributions.

5.4 Your representations. You represent that You are legally entitled to
grant the above licences; that each Contribution is Your original creation,
or that You have clearly identified any third-party material it contains
together with that material's licence; and that, if Your employer has rights
to intellectual property You create, You have received permission to make
Contributions on behalf of that employer or Your employer has waived such
rights for Your Contributions.

5.5 No obligation. The Licensor is not obliged to accept, use or keep any
Contribution.

5.6 Acceptance. Submitting a Contribution constitutes Your acceptance of
this section 5. No separate signature is required; the pull request
checklist in the repository asks You to confirm it.

## 6. Restrictions

Except as expressly permitted in sections 3, 4 and 5, You may not, and may
not permit or assist anyone else to:

(a) modify, adapt, translate or create derivative works of the Covered
    Components;

(b) distribute, publish, upload, share, sell, rent, lease, lend or otherwise
    make the Covered Components, or any build containing them, available to
    any third party, in source or binary form;

(c) sublicense or assign any of the rights granted by this Licence;

(d) use the Covered Components for any purpose other than Personal Use,
    including any commercial use, any use in or for a business, any use to
    provide a service to others, and any use as part of a product that is
    sold, licensed or otherwise offered to others;

(e) remove, obscure or alter any copyright, licence or attribution notice;

(f) use the name "WatchlistBox", the WatchlistBox mark or wordmark, or the
    Licensor's name to endorse or promote products derived from the Software
    without the Licensor's prior written permission; or

(g) circumvent any technical measure that enforces the terms of this
    Licence.

Nothing in this Licence limits any right You have under applicable law that
cannot be excluded by contract.

## 7. Apache-2.0 components are unaffected

WatchlistBox as a whole is distributed under two licences. Every part of the
repository and of the Official Releases that is not a Covered Component is
licensed under the Apache License, Version 2.0 (see `LICENSE`), and this
Licence grants nothing and takes nothing away with respect to those parts.
In particular, the plugin SDK header is Apache-2.0, and writing, building
and distributing Your own plugins against it does not require permission
under this Licence.

Where an Apache-2.0 file includes, links to or communicates with a Covered
Component, the Apache-2.0 file remains under the Apache License and the
Covered Component remains under this Licence. Third-party software and data
distributed with WatchlistBox remain under their own licences, which are
listed in `NOTICE` and `docs/licensing.md`.

## 8. Requesting permission

Permission for any use that section 6 forbids may be requested from the
Licensor by email at jhoniball4@gmail.com. Describe who You are, what You
want to do and whether the use is commercial. Permission is at the
Licensor's discretion, may be subject to conditions or fees, and is valid
only when given in writing (email counts) by the Licensor.

## 9. Term and termination

This Licence is effective until terminated. It terminates automatically,
without notice, if You breach any of its terms. If the breach is capable of
remedy and You remedy it within thirty (30) days of becoming aware of it,
Your rights are reinstated unless the Licensor has already notified You of
termination. On termination You must stop using the Covered Components and
destroy every copy of the Software in Your possession. Sections 5, 10, 11,
12 and 13 survive termination.

## 10. Disclaimer of warranty

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. THE LICENSOR
DOES NOT WARRANT THAT THE SOFTWARE WILL BE ERROR-FREE, THAT IT WILL OPERATE
WITHOUT INTERRUPTION, OR THAT ANY THIRD-PARTY APPLICATION WILL RUN INSIDE
IT. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING
THE SOFTWARE AND FOR COMPLYING WITH THE TERMS OF ANY THIRD-PARTY SOFTWARE,
SERVICE OR CONTENT YOU USE WITH IT.

## 11. Limitation of liability

TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL THE
LICENSOR BE LIABLE TO YOU FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, PUNITIVE OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF DATA, PROFITS OR
GOODWILL; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE), ARISING IN ANY WAY OUT OF THE USE OF OR INABILITY
TO USE THE SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. WHERE
LIABILITY CANNOT BE EXCLUDED, IT IS LIMITED TO THE AMOUNT YOU PAID THE
LICENSOR FOR THE SOFTWARE, WHICH FOR OFFICIAL RELEASES UNDER SECTION 3 IS
NOTHING.

## 12. Versions of this Licence

The Licensor may publish revised versions of this Licence. Each version
carries a distinguishing version number. The SPDX identifier in each source
file states which version applies to it. A later version does not apply to
copies of the Software You received under an earlier version unless the
Licensor says so in writing.

## 13. General

(a) This Licence is the entire agreement between You and the Licensor
    concerning the Covered Components and supersedes any prior
    understanding.

(b) If any provision of this Licence is held unenforceable, it shall be
    enforced to the maximum extent permissible and the remaining provisions
    remain in full force.

(c) The Licensor's failure to enforce any provision is not a waiver of the
    right to enforce it later.

(d) You may not assign this Licence. The Licensor may assign it, together
    with the copyright in the Covered Components, to a successor who agrees
    to be bound by it.

(e) This Licence is governed by the law of the jurisdiction in which the
    Licensor habitually resides at the time a dispute arises, without regard
    to its conflict-of-laws rules.

(f) Section headings are for convenience only and do not affect
    interpretation.

Copyright (c) 2026 James Honiball. All rights reserved except as granted
above.
