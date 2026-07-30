import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelDataEconometricFoundation where
  individuals : Nat
  timePeriods : Nat
  responseVariable : String
  covariates : List String
  individualEffects : Prop
  timeEffects : Prop
  strictExogeneity : Prop
  noPerfectCollinearity : Prop
  sphericalErrors : Prop
  strictExogeneityTerm : strictExogeneity
  noPerfectCollinearityTerm : noPerfectCollinearity
  sphericalErrorsTerm : sphericalErrors

structure FoundationEvidence (F : PanelDataEconometricFoundation) where
  strictExogeneityClosed : F.strictExogeneity
  noPerfectCollinearityClosed : F.noPerfectCollinearity
  sphericalErrorsClosed : F.sphericalErrors

def FoundationClosed (F : PanelDataEconometricFoundation) : Prop :=
  F.strictExogeneity ∧ F.noPerfectCollinearity ∧ F.sphericalErrors

theorem foundation_closed_from_evidence (F : PanelDataEconometricFoundation)
    (E : FoundationEvidence F) : FoundationClosed F := by
  exact And.intro E.strictExogeneityClosed
    (And.intro E.noPerfectCollinearityClosed E.sphericalErrorsClosed)

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse