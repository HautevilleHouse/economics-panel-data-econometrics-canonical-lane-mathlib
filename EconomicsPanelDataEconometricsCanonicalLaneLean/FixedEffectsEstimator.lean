import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsPanelDataEconometricsCanonicalLaneLean.PanelDataModel

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure FixedEffectsEstimator (P : PanelDataModel) where
  withinTransformation : Prop
  demeanedData : Prop
  estimatorConsistent : Prop
  estimatorAsymptoticallyNormal : Prop
  withinTransformationTerm : withinTransformation
  demeanedDataTerm : demeanedData
  estimatorConsistentTerm : estimatorConsistent
  estimatorAsymptoticallyNormalTerm : estimatorAsymptoticallyNormal

structure FixedEffectsEvidence {P : PanelDataModel} (F : FixedEffectsEstimator P) where
  withinTransformationClosed : F.withinTransformation
  demeanedDataClosed : F.demeanedData
  estimatorConsistentClosed : F.estimatorConsistent
  estimatorAsymptoticallyNormalClosed : F.estimatorAsymptoticallyNormal

def FixedEffectsClosed {P : PanelDataModel} (F : FixedEffectsEstimator P) : Prop :=
  F.withinTransformation ∧ F.demeanedData ∧ F.estimatorConsistent ∧ F.estimatorAsymptoticallyNormal

theorem fixed_effects_closed_from_evidence {P : PanelDataModel} (F : FixedEffectsEstimator P) (E : FixedEffectsEvidence F) : FixedEffectsClosed F := by
  exact And.intro E.withinTransformationClosed (And.intro E.demeanedDataClosed (And.intro E.estimatorConsistentClosed E.estimatorAsymptoticallyNormalClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse