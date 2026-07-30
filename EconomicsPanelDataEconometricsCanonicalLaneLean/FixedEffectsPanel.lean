import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure FixedEffectsPackage where
  individualEffects : Prop
  timeEffects : Prop
  withinEstimator : Prop
  consistency : Prop
  asymptoticNormality : Prop

structure FixedEffectsEvidence (F : FixedEffectsPackage) where
  individualEffectsClosed : F.individualEffects
  timeEffectsClosed : F.timeEffects
  withinEstimatorClosed : F.withinEstimator
  consistencyClosed : F.consistency
  asymptoticNormalityClosed : F.asymptoticNormality

def FixedEffectsClosed (F : FixedEffectsPackage) : Prop :=
  F.individualEffects ∧ F.timeEffects ∧ F.withinEstimator ∧ F.consistency ∧ F.asymptomaticNormality

theorem fixed_effects_closed_from_evidence (F : FixedEffectsPackage) (E : FixedEffectsEvidence F) : FixedEffectsClosed F := by
  exact And.intro E.individualEffectsClosed (And.intro E.timeEffectsClosed (And.intro E.withinEstimatorClosed (And.intro E.consistencyClosed E.asymptoticNormalityClosed)))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse