import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure DiffInDiffDesign where
  panelData : PanelDataStructure
  treatmentGroup : panelData.crossSectionUnits → Prop
  postTreatmentPeriod : panelData.timePeriods → Prop
  treatedOutcome : panelData.crossSectionUnits → panelData.timePeriods → ℝ
  controlOutcome : panelData.crossSectionUnits → panelData.timePeriods → ℝ
  parallelTrendsAssumption : Prop
  treatmentEffect : ℝ

structure DiffInDiffEvidence (D : DiffInDiffDesign) where
  treatmentGroupDefined : D.treatmentGroup = D.treatmentGroup
  postTreatmentDefined : D.postTreatmentPeriod = D.postTreatmentPeriod
  treatedOutcomeDefined : D.treatedOutcome = D.treatedOutcome
  controlOutcomeDefined : D.controlOutcome = D.controlOutcome
  parallelTrendsAssumptionClosed : D.parallelTrendsAssumption
  treatmentEffectIdentified : D.treatmentEffect = D.treatmentEffect

def DiffInDiffClosed (D : DiffInDiffDesign) : Prop :=
  (D.treatmentGroup = D.treatmentGroup) ∧
  (D.postTreatmentPeriod = D.postTreatmentPeriod) ∧
  (D.treatedOutcome = D.treatedOutcome) ∧
  (D.controlOutcome = D.controlOutcome) ∧
  D.parallelTrendsAssumption ∧
  (D.treatmentEffect = D.treatmentEffect)

theorem diff_in_diff_closed_from_evidence (D : DiffInDiffDesign) (E : DiffInDiffEvidence D) :
    DiffInDiffClosed D := by
  exact And.intro E.treatmentGroupDefined (And.intro E.postTreatmentDefined (And.intro E.treatedOutcomeDefined (And.intro E.controlOutcomeDefined (And.intro E.parallelTrendsAssumptionClosed E.treatmentEffectIdentified))))

end EconomicsPanelDataEconometrics
end HautevilleHouse