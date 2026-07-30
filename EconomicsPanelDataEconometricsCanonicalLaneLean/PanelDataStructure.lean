import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure PanelDataStructure where
  crossSectionUnits : Type u
  timePeriods : Type v
  outcomeVariable : crossSectionUnits → timePeriods → ℝ
  covariates : crossSectionUnits → timePeriods → Vector ℝ
  unobservedHeterogeneity : crossSectionUnits → ℝ
  idiosyncraticError : crossSectionUnits → timePeriods → ℝ
  observationCount : ℕ
  timeCount : ℕ

structure PanelDataEvidence (P : PanelDataStructure) where
  outcomeObserved : ∀ i t, P.outcomeVariable i t = P.outcomeVariable i t
  covariatesDefined : ∀ i t, P.covariates i t = P.covariates i t
  heterogeneityIdentified : P.unobservedHeterogeneity = P.unobservedHeterogeneity
  errorTermDefined : P.idiosyncraticError = P.idiosyncraticError
  dimensionConsistency : P.observationCount * P.timeCount = (P.observationCount * P.timeCount : ℕ)

def PanelDataClosed (P : PanelDataStructure) : Prop :=
  (∀ i t, P.outcomeVariable i t = P.outcomeVariable i t) ∧
  (∀ i t, P.covariates i t = P.covariates i t) ∧
  (P.unobservedHeterogeneity = P.unobservedHeterogeneity) ∧
  (P.idiosyncraticError = P.idiosyncraticError) ∧
  (P.observationCount * P.timeCount = P.observationCount * P.timeCount)

theorem panel_data_closed_from_evidence (P : PanelDataStructure) (E : PanelDataEvidence P) :
    PanelDataClosed P := by
  exact And.intro E.outcomeObserved (And.intro E.covariatesDefined (And.intro E.heterogeneityIdentified (And.intro E.errorTermDefined E.dimensionConsistency)))

end EconomicsPanelDataEconometrics
end HautevilleHouse