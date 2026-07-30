import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure PanelCointegration where
  residualStationarity : Prop
  commonFactorsAllowed : Prop
  longRunConsistency : Prop
  residualStationarityTerm : residualStationarity
  commonFactorsAllowedTerm : commonFactorsAllowed
  longRunConsistencyTerm : longRunConsistency

def PanelCointegrationClosed (P : PanelCointegration) : Prop :=
  P.residualStationarity ∧ P.commonFactorsAllowed ∧ P.longRunConsistency

theorem panel_cointegration_closed_from_evidence (P : PanelCointegration) : PanelCointegrationClosed P := by
  exact And.intro P.residualStationarityTerm (And.intro P.commonFactorsAllowedTerm P.longRunConsistencyTerm)

end EconomicsPanelDataEconometrics
end HautevilleHouse