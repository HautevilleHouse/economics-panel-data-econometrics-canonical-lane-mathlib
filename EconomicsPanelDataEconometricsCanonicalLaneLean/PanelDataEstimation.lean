import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure EstimationPackage (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) where
  estimatorDefined : Prop
  consistencyProved : Prop
  asymptoticNormality : Prop
  varianceConsistent : Prop

structure EstimationEvidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) where
  estimatorDefinedClosed : E.estimatorDefined
  consistencyProvedClosed : E.consistencyProved
  asymptoticNormalityClosed : E.asymptoticNormality
  varianceConsistentClosed : E.varianceConsistent

def EstimationClosed (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) : Prop :=
  E.estimatorDefined ∧ E.consistencyProved ∧ E.asymptoticNormality ∧ E.varianceConsistent

theorem estimation_closed_from_evidence (n t : Type) (P : PanelDataStructure n t) (I : IdentificationPackage n t P) (E : EstimationPackage n t P I) (Ev : EstimationEvidence n t P I E) : EstimationClosed n t P I E := by
  exact And.intro Ev.estimatorDefinedClosed (And.intro Ev.consistencyProvedClosed (And.intro Ev.asymptoticNormalityClosed Ev.varianceConsistentClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse