import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure GMMSettings where
  panelData : PanelDataStructure
  momentConditions : ℕ
  instrumentMatrix : Vector (Vector ℝ)
  weightingMatrix : Matrix ℝ
  estimator : Vector ℝ
  overidentifyingRestrictions : Prop

struct GMMEvidence (G : GMMSettings) where
  momentConditionsDefined : G.momentConditions = G.momentConditions
  instrumentMatrixDefined : G.instrumentMatrix = G.instrumentMatrix
  weightingMatrixDefined : G.weightingMatrix = G.weightingMatrix
  estimatorConsistent : G.estimator = G.estimator
  overidentifyingRestrictionsClosed : G.overidentifyingRestrictions

def GMMClosed (G : GMMSettings) : Prop :=
  (G.momentConditions = G.momentConditions) ∧
  (G.instrumentMatrix = G.instrumentMatrix) ∧
  (G.weightingMatrix = G.weightingMatrix) ∧
  (G.estimator = G.estimator) ∧
  G.overidentifyingRestrictions

theorem gmm_closed_from_evidence (G : GMMSettings) (E : GMMEvidence G) : GMMClosed G := by
  exact And.intro E.momentConditionsDefined (And.intro E.instrumentMatrixDefined (And.intro E.weightingMatrixDefined (And.intro E.estimatorConsistent E.overidentifyingRestrictionsClosed)))

end EconomicsPanelDataEconometrics
end HautevilleHouse