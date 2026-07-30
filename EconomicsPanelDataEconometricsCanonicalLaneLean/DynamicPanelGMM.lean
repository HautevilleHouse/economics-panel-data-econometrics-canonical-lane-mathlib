import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure DynamicPanelGMM where
  momentConditionsValid : Prop
  instrumentRelevance : Prop
  overidentificationTestPasses : Prop
  momentConditionsValidTerm : momentConditionsValid
  instrumentRelevanceTerm : instrumentRelevance
  overidentificationTestPassesTerm : overidentificationTestPasses

def DynamicPanelGMMClosed (D : DynamicPanelGMM) : Prop :=
  D.momentConditionsValid ∧ D.instrumentRelevance ∧ D.overidentificationTestPasses

theorem dynamic_panel_gmm_closed_from_evidence (D : DynamicPanelGMM) : DynamicPanelGMMClosed D := by
  exact And.intro D.momentConditionsValidTerm (And.intro D.instrumentRelevanceTerm D.overidentificationTestPassesTerm)

end EconomicsPanelDataEconometrics
end HautevilleHouse