import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelDataModel where
  individualDimension : Nat
  timeDimension : Nat
  covariates : Nat
  response : Type u
  covariateData : Type v
  unobservedEffects : Type w
  errorTerms : Type x
  strictExogeneity : Prop
  noPerfectCollinearity : Prop
  rankCondition : Prop
  strictExogeneityTerm : strictExogeneity
  noPerfectCollinearityTerm : noPerfectCollinearity
  rankConditionTerm : rankCondition

structure PanelDataEvidence (P : PanelDataModel) where
  strictExogeneityClosed : P.strictExogeneity
  noPerfectCollinearityClosed : P.noPerfectCollinearity
  rankConditionClosed : P.rankCondition

def PanelDataClosed (P : PanelDataModel) : Prop :=
  P.strictExogeneity ∧ P.noPerfectCollinearity ∧ P.rankCondition

theorem panel_data_closed_from_evidence (P : PanelDataModel) (E : PanelDataEvidence P) : PanelDataClosed P := by
  exact And.intro E.strictExogeneityClosed (And.intro E.noPerfectCollinearityClosed E.rankConditionClosed)

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse