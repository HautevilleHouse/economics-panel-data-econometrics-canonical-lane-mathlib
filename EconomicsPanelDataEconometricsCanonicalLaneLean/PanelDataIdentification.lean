import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelDataStructure (n : Type) (t : Type) where
  individuals : n
  periods : t
  covariateMatrix : Type u
  outcomeVector : Type v

structure IdentificationPackage (n t : Type) (P : PanelDataStructure n t) where
  momentCondition : Prop
  rankCondition : Prop
  orthogonalityCondition : Prop
  firstStageRelevant : Prop

structure IdentificationEvidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) where
  momentConditionClosed : I.momentCondition
  rankConditionClosed : I.rankCondition
  orthogonalityConditionClosed : I.orthogonalityCondition
  firstStageRelevantClosed : I.firstStageRelevant

def IdentificationClosed (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) : Prop :=
  I.momentCondition ∧ I.rankCondition ∧ I.orthogonalityCondition ∧ I.firstStageRelevant

theorem identification_closed_from_evidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : IdentificationEvidence n t P I) : IdentificationClosed n t P I := by
  exact And.intro E.momentConditionClosed (And.intro E.rankConditionClosed (And.intro E.orthogonalityConditionClosed E.firstStageRelevantClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse