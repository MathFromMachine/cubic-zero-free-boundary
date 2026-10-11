# A cubic zero-free boundary

Let B be the unique root in [5/6, 7/8] of

```text
7884 B^3 - 18819 B^2 + 14643 B - 3686 = 0.
```

Then `0.874957019420 < B < 0.874957019421`, and the Riemann zeta function has no zero at any complex `s` with `Re(s) > B` and `s != 1`. The corresponding Dirichlet L-function statement and its principal-character exception are given in the companion.

- [Read the proof companion](https://mathfrommachine.github.io/cubic-zero-free-boundary/)
- [Full explanation, provenance, and reproduction commands](README.txt)
- [Download the source companion](cubic-proof-companion.zip)
- [Verification summary](verification-summary.json)
- [Companion packaging checks](companion-checks.json)

Download and extract `cubic-proof-companion.zip` before running the reproduction commands. The website repository contains selected display files; `SHA256SUMS` describes the **extracted archive**, not this website checkout. The archive checksum is in [archive-sha256.txt](archive-sha256.txt).

The original proof assembly passed statement/definition comparison and fresh Lean-kernel replay. The new portable build/replay wrapper has **not** been run end-to-end. The verification summary describes existing private records and is not an independent attestation. One kernel implementation was used; external peer review is not claimed.

The argument builds on [OpenAI's original proof](https://github.com/openai/math) and [Baiying Liu's refinement](https://arxiv.org/abs/2610.12234). Attribution and source notices are retained. No blanket license is asserted for the combined work; see the source provenance and rights section of `README.txt`.
