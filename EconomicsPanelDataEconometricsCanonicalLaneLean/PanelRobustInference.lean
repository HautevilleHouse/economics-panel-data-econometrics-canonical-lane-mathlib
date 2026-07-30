import EconomicsPanelDataEconometricsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelRobustInferencePackage where
  clusteredStandardErrors : Prop
  heteroskedasticityConsistent : Prop
  autocorrelationConsistent : Prop
  inferenceValid : clusteredStandardErrors ∧ heteroskedasticityConsistent ∧ autocorrelationConsistent

structure PanelRobustInferenceEvidence (P : PanelRobustInferencePackage) where
  clusteredStandardErrorsHolds : P.clusteredStandardErrors
  heteroskedasticityConsistentHolds : P.heteroskedasticityConsistent
  autocorrelationConsistentHolds : P.autocorrelationConsistent

def PanelRobustInferenceClosed (P : PanelRobustInferencePackage) : Prop :=
  P.clusteredStandardErrors ∧ P.heteroskedasticityConsistent ∧ P.autocorrelationConsistent

theorem panel_robust_inference_closed_from_evidence (P : PanelRobustInferencePackage) (E : PanelRobustInferenceEvidence P) : PanelRobustInferenceClosed P :=
  And.intro E.clusteredStandardErrorsHolds (And.intro E.heteroskedasticityConsistentHolds E.autocorrelationConsistentHolds)

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
