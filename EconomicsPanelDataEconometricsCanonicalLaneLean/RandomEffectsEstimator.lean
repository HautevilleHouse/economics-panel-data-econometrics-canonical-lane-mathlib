import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsPanelDataEconometricsCanonicalLaneLean.PanelDataModel

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure RandomEffectsEstimator (P : PanelDataModel) where
  feasibleGLS : Prop
  varianceComponentsEstimated : Prop
  estimatorConsistent : Prop
  estimatorAsymptoticallyNormal : Prop
  feasibleGLSTerm : feasibleGLS
  varianceComponentsEstimatedTerm : varianceComponentsEstimated
  estimatorConsistentTerm : estimatorConsistent
  estimatorAsymptoticallyNormalTerm : estimatorAsymptoticallyNormal

structure RandomEffectsEvidence {P : PanelDataModel} (R : RandomEffectsEstimator P) where
  feasibleGLSClosed : R.feasibleGLS
  varianceComponentsEstimatedClosed : R.varianceComponentsEstimated
  estimatorConsistentClosed : R.estimatorConsistent
  estimatorAsymptoticallyNormalClosed : R.estimatorAsymptoticallyNormal

def RandomEffectsClosed {P : PanelDataModel} (R : RandomEffectsEstimator P) : Prop :=
  R.feasibleGLS ∧ R.varianceComponentsEstimated ∧ R.estimatorConsistent ∧ R.estimatorAsymptoticallyNormal

theorem random_effects_closed_from_evidence {P : PanelDataModel} (R : RandomEffectsEstimator P) (E : RandomEffectsEvidence R) : RandomEffectsClosed R := by
  exact And.intro E.feasibleGLSClosed (And.intro E.varianceComponentsEstimatedClosed (And.intro E.estimatorConsistentClosed E.estimatorAsymptoticallyNormalClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse