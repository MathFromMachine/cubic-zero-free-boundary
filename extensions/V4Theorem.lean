import V4FullVerification

/-! Exact cubic endpoint signatures for the actual analytic assembly.
The cubic root is unique in [5/6,7/8]; the final statements have no physical
probe, moment, count, or improved-boundary hypotheses. -/

namespace QRHExtension.V4
noncomputable section
open QRHExtension.KappaMethodLimit

/-- Supremum bound for the actual Hecke zero family. -/
theorem beta_le : OAI.SevenEighths.HeckeZeroSupremum.beta ≤ methodLimit := by
  simpa only [RHV4.boundary_value] using RHV4.beta_star_le

/-- Hecke nonvanishing, with the possible pole excluded. -/
theorem hecke_nonzero (chi : OAI.SevenEighths.HeckeFamily.Character) (s : ℂ)
    (hs : methodLimit < s.re) (hpole : s ≠ 1 ∨ chi.residue ≠ 1) :
    OAI.SevenEighths.HeckeFamily.LFunction chi s ≠ 0 := by
  apply RHV4.hecke_nonzero chi s _ hpole
  simpa only [RHV4.boundary_value] using hs

/-- Dirichlet nonvanishing for every nonzero modulus. -/
theorem dirichlet_nonzero (q : ℕ) (hq : q ≠ 0)
    (chi : DirichletCharacter ℂ q) (s : ℂ)
    (hs : methodLimit < s.re) (hpole : ¬ (chi = 1 ∧ s = 1)) :
    letI : NeZero q := ⟨hq⟩
    DirichletCharacter.LFunction chi s ≠ 0 := by
  apply RHV4.dirichlet_nonzero q hq chi s _ hpole
  simpa only [RHV4.boundary_value] using hs

/-- Ordinary analytic zeta statement, explicitly using Mathlib's root function. -/
theorem ordinary_zeta_nonvanishing {s : ℂ}
    (hs : methodLimit < s.re) (hpole : s ≠ 1) :
    _root_.riemannZeta s ≠ 0 := by
  apply RHV4.zeta_nonzero s _ hpole
  simpa only [RHV4.boundary_value] using hs

/-- Definition-independent endpoint signature using only its exact polynomial. -/
theorem zeta_nonvanishing_at_cubic_root {B : ℝ} {s : ℂ}
    (hBlo : (5/6:ℝ)≤B) (hBhi : B≤(7/8:ℝ))
    (hpoly : 7884*B^3-18819*B^2+14643*B-3686=0)
    (hs : B<s.re) (hpole : s≠1) : _root_.riemannZeta s≠0 := by
  have heq : B=methodLimit := methodLimit_unique B ⟨hBlo,hBhi⟩ hpoly
  apply ordinary_zeta_nonvanishing _ hpole
  simpa only [←heq] using hs

/-- Equivalent endpoint signature for actual Dirichlet L-functions. -/
theorem dirichlet_nonvanishing_at_cubic_root {B : ℝ}
    (hBlo : (5/6:ℝ)≤B) (hBhi : B≤(7/8:ℝ))
    (hpoly : 7884*B^3-18819*B^2+14643*B-3686=0)
    (q : ℕ) (hq : q≠0) (chi : DirichletCharacter ℂ q) (s : ℂ)
    (hs : B<s.re) (hpole : ¬(chi=1 ∧ s=1)) :
    letI : NeZero q := ⟨hq⟩
    DirichletCharacter.LFunction chi s≠0 := by
  have heq : B=methodLimit := methodLimit_unique B ⟨hBlo,hBhi⟩ hpoly
  apply dirichlet_nonzero q hq chi s _ hpole
  simpa only [←heq] using hs

/-- A rational corollary with a fully explicit decimal boundary. -/
theorem ordinary_zeta_nonvanishing_rational {s : ℂ}
    (hs : (874957019421/1000000000000:ℝ)<s.re) (hpole : s≠1) :
    _root_.riemannZeta s≠0 :=
  ordinary_zeta_nonvanishing (methodLimit_bracket.2.trans hs) hpole

#print beta_le
#print hecke_nonzero
#print dirichlet_nonzero
#print ordinary_zeta_nonvanishing
#print axioms beta_le
#print axioms hecke_nonzero
#print axioms dirichlet_nonzero
#print axioms ordinary_zeta_nonvanishing
#print axioms zeta_nonvanishing_at_cubic_root
#print axioms dirichlet_nonvanishing_at_cubic_root

end
end QRHExtension.V4
