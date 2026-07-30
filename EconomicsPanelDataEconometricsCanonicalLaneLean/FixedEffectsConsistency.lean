import EconomicsPanelDataEconometricsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure FixedEffectsPackage where
  unitFixedEffects : Prop
  timeFixedEffects : Prop
  consistencyUnderStrictExogeneity : Prop
  consistencyHolds : consistencyUnderStrictExogeneity

structure FixedEffectsEvidence (P : FixedEffectsPackage) where
  unitFixedEffectsHolds : P.unitFixedEffects
  timeFixedEffectsHolds : P.timeFixedEffects
  consistencyUnderStrictExogeneityHolds : P.consistencyUnderStrictExogeneity

def FixedEffectsConsistencyClosed (P : FixedEffectsPackage) : Prop :=
  P.consistencyUnderStrictExogeneity

theorem fixed_effects_consistency_closed_from_evidence (P : FixedEffectsPackage) (E : FixedEffectsEvidence P) : FixedEffectsConsistencyClosed P :=
  E.consistencyUnderStrictExogeneityHolds

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
