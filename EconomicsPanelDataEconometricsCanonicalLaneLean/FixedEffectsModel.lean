import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure FixedEffectsModel where
  panelData : PanelDataStructure
  individualEffects : panelData.crossSectionUnits → ℝ
  timeEffects : panelData.timePeriods → ℝ
  coefficients : Vector ℝ
  modelEquation : Prop
  identificationCondition : Prop

structure FixedEffectsEvidence (M : FixedEffectsModel) where
  individualEffectsDefined : M.individualEffects = M.individualEffects
  timeEffectsDefined : M.timeEffects = M.timeEffects
  coefficientsDefined : M.coefficients = M.coefficients
  modelEquationClosed : M.modelEquation
  identificationConditionClosed : M.identificationCondition

def FixedEffectsClosed (M : FixedEffectsModel) : Prop :=
  (M.individualEffects = M.individualEffects) ∧
  (M.timeEffects = M.timeEffects) ∧
  (M.coefficients = M.coefficients) ∧
  M.modelEquation ∧
  M.identificationCondition

theorem fixed_effects_closed_from_evidence (M : FixedEffectsModel) (E : FixedEffectsEvidence M) :
    FixedEffectsClosed M := by
  exact And.intro E.individualEffectsDefined (And.intro E.timeEffectsDefined (And.intro E.coefficientsDefined (And.intro E.modelEquationClosed E.identificationConditionClosed)))

end EconomicsPanelDataEconometrics
end HautevilleHouse