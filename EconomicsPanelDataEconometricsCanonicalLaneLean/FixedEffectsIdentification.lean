import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure FixedEffectsIdentification where
  withinEstimatorConsistent : Prop
  timeDemeaningValid : Prop
  clusterRobustSE : Prop
  withinEstimatorConsistentTerm : withinEstimatorConsistent
  timeDemeaningValidTerm : timeDemeaningValid
  clusterRobustSETerm : clusterRobustSE

def FixedEffectsIdentificationClosed (F : FixedEffectsIdentification) : Prop :=
  F.withinEstimatorConsistent ∧ F.timeDemeaningValid ∧ F.clusterRobustSE

theorem fixed_effects_identification_closed_from_evidence (F : FixedEffectsIdentification) : FixedEffectsIdentificationClosed F := by
  exact And.intro F.withinEstimatorConsistentTerm (And.intro F.timeDemeaningValidTerm F.clusterRobustSETerm)

end EconomicsPanelDataEconometrics
end HautevilleHouse