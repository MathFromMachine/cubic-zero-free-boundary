A cubic zero-free boundary for zeta and Dirichlet L-functions
==========================================================

Let B be the unique root in [5/6, 7/8] of

    7884 B^3 - 18819 B^2 + 14643 B - 3686 = 0.

Then 0.874957019420 < B < 0.874957019421. For every complex s with
Re(s) > B and s != 1, the ordinary Riemann zeta function satisfies
zeta(s) != 0. For every positive integer q and every Dirichlet character
chi modulo q, L(s,chi) != 0 whenever Re(s) > B and it is not the case
that chi is principal and s = 1. No improved count, moment, or probe
estimate is assumed in these final statements.

The exact Lean declarations are in extensions/V4Theorem.lean and
extensions/V4CandidateTheorem.lean. The independent comparison statements
are in audit/V4Challenge.lean. Its intentional sorry bodies are statement
templates, never imported into the proof. The actual proof's allowed
axioms are propext, Classical.choice, and Quot.sound.

WHAT HAS BEEN CHECKED

The original analytic assembly compiled under Lean 4.34.1. Comparator
matched independent Mathlib statements and their recursively referenced
definitions, inspected the actual axiom dependencies, and freshly replayed
the proof in Lean's kernel. A before/after freeze check matched all 13,935
modules in the recorded source/object closure. The audit finished on
2026-10-11 UTC. It used one Lean kernel implementation; no independent
second kernel was used. Official cached Mathlib objects were used; this
is not a source rebuild of the entire standard mathematical library.

verification-summary.json is a neutral summary of those existing private
records, not an independent attestation. The original records contain
identifying filesystem paths and are not included. Their SHA-256 hashes
are preserved in the summary. A checksum identifies bytes; it does not
itself establish the truth of a verification claim.

The public companion's reconstruction and dependency-order checks are
separate from the proof verification. See companion-checks.json for the
checks actually run on this package. A fresh end-to-end run of the new
portable build/replay wrapper has NOT been performed. Its source outputs
are required to match the already verified source hashes exactly.
Some unchanged research-copy comments still describe verification as
pending. They record an earlier stage; the final verification summary and
the exact source hashes specify the completed check.

HOW THE ARGUMENT WORKS

The proof builds an arithmetic probe with two descriptions. Direct
estimates bound its growth. A transformed description contains a
reciprocal L-function. A zero beyond the claimed boundary would produce
a pole, but the direct growth estimates give enough analyticity to rule
out that pole.

Write beta for the relevant family's rightmost-zero supremum. Under the
contradiction hypothesis beta > B, let Delta = beta-B > 0 and choose
kappa = 2 beta-1. The older geometric restriction kappa >= 3/4 is relaxed
in the actual induction; the analytic constraint kappa >= 2 beta-1 is
retained. The already verified 0.87499 boundary bounds the new parameter
from above. It does not assume the desired cubic-boundary result.

At the endpoint, the scalar excess is nonpositive for every amplitude
class. Equality occurs at one critical class, with amplitude ratio 1/2
and delta = (9B-7)/(18(1-B)). A fixed negative endpoint margin is not
required: the contradiction itself supplies Delta. Moving kappa from
2B-1 to 2 beta-1 increases the row-count exponent by at most Delta/4.
Its physical cost is h Delta/4 with h < 1. The other analytic losses and
the desired strict saving fit inside Delta/2. Positive room remains.

The exact balance of the low, reflected, and high scalar estimates gives
the displayed cubic. A matching obstruction proves optimality for those
three specified scalar estimates. It does not prove that actual
arithmetic families saturate every estimate, nor that new estimates
cannot improve the boundary.

ATTRIBUTION AND SCOPE

OpenAI supplied the original 7/8 proof and analytic framework:
https://github.com/openai/math
Pinned commit: fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb.

Baiying Liu supplied the optimized fixed-kappa geometry and the earlier
bound (1507-2 sqrt(921))/1653 = 0.874957069799..., and explicitly proposed
investigating kappa < 3/4. This extension carries out that analytic step
and determines/attains its exact cubic endpoint. The numerical improvement
over that bound is approximately 5.0379069794e-8.
https://arxiv.org/abs/2610.12234
https://github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis
Pinned commit: 7d10420de90efa2f082a06a342fc7accbd57ab37.

This extension was developed with AI assistance. The limited prior-work
search does not establish unique priority; no external peer-review or
publication-acceptance claim is made. The broader moment theorem and
separate detector calculations are outside this companion's release.

SOURCE PROVENANCE AND RIGHTS

The package supplies 114 extension files and 134 reconstruction recipes.
Readers fetch Liu's exact public commit; each recipe copies specified
Unicode-character spans from that source and inserts the extension's
changes. The input and output SHA-256 hashes must both match. This keeps
full Liu source files out of the archive and preserves their attribution
in the reconstructed files. It does not assign a new license to that
upstream work or settle redistribution rights in derivative patches.

No LICENSE/NOTICE/COPYING file was found in the pinned Liu checkout.
Its licensing status still needs clarification before representing the
combined work as freely licensed. The OpenAI Lean source is Apache-2.0;
its license is included in config/LICENSE. Existing notices and authorship
must be preserved. No blanket license for the combined work is asserted.

REPRODUCING THE CHECK

Prerequisites: Python 3, Git, Bash, Lean/Lake 4.34.1 available through PATH
or elan, Go >= 1.24 for Landrun, and Linux supporting Landlock. For the
Comparator sandbox invocation below, a working user systemd manager is
also required. The mathematical source build is distinct from this Linux
audit harness. Building the foundation may take substantial time and
several GB of memory; the earlier final replay took about 13 minutes with
an 8 GiB cap. That timing does not include a clean dependency/source build.

From the extracted companion directory:

    sha256sum -c SHA256SUMS
    python3 reproduce.py fetch
    python3 reproduce.py prepare
    python3 reproduce.py dependencies

The fetch step checks out exactly the two recorded upstream commits.
Preparation selects the 2,924 OAI modules and reconstructs 248 extension
modules in build-work/project. Every source is hash-checked. Dependencies
are fetched at all revisions in config/lake-manifest.json; the two exact
upstream Lean-4.34.1 compatibility patches are then applied.

Run the build in a resource-limited scope, retaining a local log:

    systemd-run --user --wait --pipe --collect \
      -p MemoryMax=8G -p MemorySwapMax=0 -p CPUQuota=400% \
      --working-directory="$PWD" \
      python3 "$PWD/reproduce.py" build

This uses the official Mathlib cache and builds the OAI and extension
sources. Compilation prints the final theorem axiom dependencies. Then:

    python3 reproduce.py tools
    systemd-run --user --wait --pipe --collect \
      -p 'RestrictAddressFamilies=~AF_UNIX' \
      -p MemoryMax=8G -p MemorySwapMax=0 -p CPUQuota=400% \
      --working-directory="$PWD" \
      python3 "$PWD/reproduce.py" replay
    python3 reproduce.py check

Comparator is pinned to d03acab154d269c06e60e4de7e4cc85deebff94b;
lean4export to 076e8e57707e813375e8f9da8bf989799ace9680;
Landrun to 811cfff51ceaf3d9843708aa6d22e9b84ccac8b4. The verifier and
exporter revisions are their 4.34.0 sources compiled under Lean 4.34.1,
with only toolchain/dependency pins changed, as in the original check.
The original tool setup passed all 16 enabled upstream verifier tests.
The new wrapper does not automatically repeat that test suite.

Successful replay prints CANDIDATE_COMPARATOR_SUCCESS. A compiler build
alone is not that replay verdict. The intentional unproved challenge
templates are independently compiled; the solution is checked against
them, with only the three stated axioms permitted. Nanoda is disabled.

The working directory is generated output, excluded from the public
archive. New build logs may contain the reader's own paths: inspect them
before posting them. Do not treat this companion's neutral summary as
an independently reproduced result.
