import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure RandomEffectsEstimationPackage where
  estimatorConsistent : Prop
  estimatorAsymptoticallyNormal : Prop
  varianceEstimatorConsistent : Prop
  feasiableGLSEfficient : Prop
  estimatorConsistentTerm : estimatorConsistent
  estimatorAsymptoticallyNormalTerm : estimatorAsymptoticallyNormal
  varianceEstimatorConsistentTerm : varianceEstimatorConsistent
  feasiableGLSEfficientTerm : feasiableGLSEfficient

structure RandomEffectsEvidence (R : RandomEffectsEstimationPackage) where
  estimatorConsistentClosed : R.estimatorConsistent
  estimatorAsymptoticallyNormalClosed : R.estimatorAsymptoticallyNormal
  varianceEstimatorConsistentClosed : R.varianceEstimatorConsistent
  feasiableGLSEfficientClosed : R.feasiableGLSEfficient

def RandomEffectsClosed (R : RandomEffectsEstimationPackage) : Prop :=
  R.estimatorConsistent ∧ R.estimatorAsymptoticallyNormal ∧
  R.varianceEstimatorConsistent ∧ R.feasiableGLSEfficient

theorem random_effects_closed_from_evidence (R : RandomEffectsEstimationPackage)
    (E : RandomEffectsEvidence R) : RandomEffectsClosed R := by
  exact And.intro E.estimatorConsistentClosed
    (And.intro E.estimatorAsymptoticallyNormalClosed
      (And.intro E.varianceEstimatorConsistentClosed E.feasiableGLSEfficientClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse