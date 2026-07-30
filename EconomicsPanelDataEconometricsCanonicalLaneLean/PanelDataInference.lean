import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure InferencePackage (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) where
  hypothesisTestDefined : Prop
  confidenceIntervalDefined : Prop
  sizeOne : Prop
  powerApproachesUnity : Prop

structure InferenceEvidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) (Inf : InferencePackage n t P I E) where
  hypothesisTestDefinedClosed : Inf.hypothesisTestDefined
  confidenceIntervalDefinedClosed : Inf.confidenceIntervalDefined
  sizeOneClosed : Inf.sizeOne
  powerApproachesUnityClosed : Inf.powerApproachesUnity

def InferenceClosed (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) (Inf : InferencePackage n t P I E) : Prop :=
  Inf.hypothesisTestDefined ∧ Inf.confidenceIntervalDefined ∧ Inf.sizeOne ∧ Inf.powerApproachesUnity

theorem inference_closed_from_evidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) (Inf : InferencePackage n t P I E) (Ev : InferenceEvidence n t P I E Inf) : InferenceClosed n t P I E Inf := by
  exact And.intro Ev.hypothesisTestDefinedClosed (And.intro Ev.confidenceIntervalDefinedClosed (And.intro Ev.sizeOneClosed Ev.powerApproachesUnityClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse