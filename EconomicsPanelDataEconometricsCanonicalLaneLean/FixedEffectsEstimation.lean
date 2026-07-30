import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure FixedEffectsEstimationPackage where
  estimatorConsistent : Prop
  estimatorAsymptoticallyNormal : Prop
  varianceEstimatorConsistent : Prop
  withinTransformationValid : Prop
  estimatorConsistentTerm : estimatorConsistent
  estimatorAsymptoticallyNormalTerm : estimatorAsymptoticallyNormal
  varianceEstimatorConsistentTerm : varianceEstimatorConsistent
  withinTransformationValidTerm : withinTransformationValid

structure FixedEffectsEvidence (F : FixedEffectsEstimationPackage) where
  estimatorConsistentClosed : F.estimatorConsistent
  estimatorAsymptoticallyNormalClosed : F.estimatorAsymptoticallyNormal
  varianceEstimatorConsistentClosed : F.varianceEstimatorConsistent
  withinTransformationValidClosed : F.withinTransformationValid

def FixedEffectsClosed (F : FixedEffectsEstimationPackage) : Prop :=
  F.estimatorConsistent ∧ F.estimatorAsymptoticallyNormal ∧
  F.varianceEstimatorConsistent ∧ F.withinTransformationValid

theorem fixed_effects_closed_from_evidence (F : FixedEffectsEstimationPackage)
    (E : FixedEffectsEvidence F) : FixedEffectsClosed F := by
  exact And.intro E.estimatorConsistentClosed
    (And.intro E.estimatorAsymptoticallyNormalClosed
      (And.intro E.varianceEstimatorConsistentClosed E.withinTransformationValidClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse