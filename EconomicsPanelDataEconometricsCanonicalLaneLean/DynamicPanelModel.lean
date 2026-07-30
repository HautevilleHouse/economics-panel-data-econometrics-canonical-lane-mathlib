import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure DynamicPanelModel where
  panelData : PanelDataStructure
  laggedDependent : panelData.crossSectionUnits → panelData.timePeriods → ℝ
  coefficients : Vector ℝ
  autoregressiveParameter : ℝ
  stationarityCondition : Prop
  initialCondition : Prop

struct DynamicPanelEvidence (M : DynamicPanelModel) where
  laggedDependentDefined : M.laggedDependent = M.laggedDependent
  coefficientsDefined : M.coefficients = M.coefficients
  autoregressiveParameterDefined : M.autoregressiveParameter = M.autoregressiveParameter
  stationarityConditionClosed : M.stationarityCondition
  initialConditionClosed : M.initialCondition

def DynamicPanelClosed (M : DynamicPanelModel) : Prop :=
  (M.laggedDependent = M.laggedDependent) ∧
  (M.coefficients = M.coefficients) ∧
  (M.autoregressiveParameter = M.autoregressiveParameter) ∧
  M.stationarityCondition ∧
  M.initialCondition

theorem dynamic_panel_closed_from_evidence (M : DynamicPanelModel) (E : DynamicPanelEvidence M) :
    DynamicPanelClosed M := by
  exact And.intro E.laggedDependentDefined (And.intro E.coefficientsDefined (And.intro E.autoregressiveParameterDefined (And.intro E.stationarityConditionClosed E.initialConditionClosed)))

end EconomicsPanelDataEconometrics
end HautevilleHouse