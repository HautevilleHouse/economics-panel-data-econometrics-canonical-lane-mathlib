import EconomicsPanelDataEconometricsCanonicalLaneLean.GMMEstimation

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure FixedEffectsPackage {I : IdentifiabilityPackage} (G : GMMPackage I) where
  withinTransformation : Prop
  clusterRobustSE : Prop
  heterogeneityAccounted : Prop
  efficientEstimator : Prop

structure FixedEffectsEvidence {I : IdentifiabilityPackage} {G : GMMPackage I} (F : FixedEffectsPackage G) where
  withinTransformationClosed : F.withinTransformation
  clusterRobustSEClosed : F.clusterRobustSE
  heterogeneityAccountedClosed : F.heterogeneityAccounted
  efficientEstimatorClosed : F.efficientEstimator

def FixedEffectsClosed {I : IdentifiabilityPackage} {G : GMMPackage I} (F : FixedEffectsPackage G) : Prop :=
  F.withinTransformation ∧ F.clusterRobustSE ∧ F.heterogeneityAccounted ∧ F.efficientEstimator

theorem fixed_effects_closed_from_evidence {I : IdentifiabilityPackage} {G : GMMPackage I}
    (F : FixedEffectsPackage G) (E : FixedEffectsEvidence F) : FixedEffectsClosed F := by
  exact And.intro E.withinTransformationClosed
    (And.intro E.clusterRobustSEClosed
      (And.intro E.heterogeneityAccountedClosed E.efficientEstimatorClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
