import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure RandomEffectsIdentification where
  glsEstimatorFeasible : Prop
  varianceComponentsPositive : Prop
  hausmanTestValid : Prop
  glsEstimatorFeasibleTerm : glsEstimatorFeasible
  varianceComponentsPositiveTerm : varianceComponentsPositive
  hausmanTestValidTerm : hausmanTestValid

def RandomEffectsIdentificationClosed (R : RandomEffectsIdentification) : Prop :=
  R.glsEstimatorFeasible ∧ R.varianceComponentsPositive ∧ R.hausmanTestValid

theorem random_effects_identification_closed_from_evidence (R : RandomEffectsIdentification) : RandomEffectsIdentificationClosed R := by
  exact And.intro R.glsEstimatorFeasibleTerm (And.intro R.varianceComponentsPositiveTerm R.hausmanTestValidTerm)

end EconomicsPanelDataEconometrics
end HautevilleHouse