import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure InstrumentalVariablesPackage where
  instrumentsRelevant : Prop
  instrumentsExogenous : Prop
  twoStageEstimator : Prop
  identification : Prop
  overidentificationTest : Prop

structure InstrumentalVariablesEvidence (I : InstrumentalVariablesPackage) where
  instrumentsRelevantClosed : I.instrumentsRelevant
  instrumentsExogenousClosed : I.instrumentsExogenous
  twoStageEstimatorClosed : I.twoStageEstimator
  identificationClosed : I.identification
  overidentificationTestClosed : I.overidentificationTest

def InstrumentalVariablesClosed (I : InstrumentalVariablesPackage) : Prop :=
  I.instrumentsRelevant ∧ I.instrumentsExogenous ∧ I.twoStageEstimator ∧ I.identification ∧ I.overidentificationTest

theorem instrumental_variables_closed_from_evidence (I : InstrumentalVariablesPackage) (E : InstrumentalVariablesEvidence I) : InstrumentalVariablesClosed I := by
  exact And.intro E.instrumentsRelevantClosed (And.intro E.instrumentsExogenousClosed (And.intro E.twoStageEstimatorClosed (And.intro E.identificationClosed E.overidentificationTestClosed)))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse