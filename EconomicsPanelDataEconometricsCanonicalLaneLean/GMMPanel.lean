import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure GMMPanelPackage where
  momentConditions : Prop
  optimalWeighting : Prop
  gmmEstimator : Prop
  consistency : Prop
  asymptoticNormality : Prop

structure GMMPanelEvidence (G : GMMPanelPackage) where
  momentConditionsClosed : G.momentConditions
  optimalWeightingClosed : G.optimalWeighting
  gmmEstimatorClosed : G.gmmEstimator
  consistencyClosed : G.consistency
  asymptoticNormalityClosed : G.asymptoticNormality

def GMMPanelClosed (G : GMMPanelPackage) : Prop :=
  G.momentConditions ∧ G.optimalWeighting ∧ G.gmmEstimator ∧ G.consistency ∧ G.asymptomaticNormality

theorem gmm_panel_closed_from_evidence (G : GMMPanelPackage) (E : GMMPanelEvidence G) : GMMPanelClosed G := by
  exact And.intro E.momentConditionsClosed (And.intro E.optimalWeightingClosed (And.intro E.gmmEstimatorClosed (And.intro E.consistencyClosed E.asymptoticNormalityClosed)))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse