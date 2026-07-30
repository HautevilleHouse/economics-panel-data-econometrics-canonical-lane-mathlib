import EconomicsPanelDataEconometricsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure InstrumentalVariablesPackage where
  endogenousRegressor : Prop
  instrumentRelevance : Prop
  instrumentExogeneity : Prop
  identificationCondition : instrumentRelevance ∧ instrumentExogeneity

structure InstrumentalVariablesEvidence (P : InstrumentalVariablesPackage) where
  endogenousRegressorHolds : P.endogenousRegressor
  instrumentRelevanceHolds : P.instrumentRelevance
  instrumentExogeneityHolds : P.instrumentExogeneity

def InstrumentalVariablesIdentificationClosed (P : InstrumentalVariablesPackage) : Prop :=
  P.instrumentRelevance ∧ P.instrumentExogeneity

theorem instrument_identification_closed_from_evidence (P : InstrumentalVariablesPackage) (E : InstrumentalVariablesEvidence P) : InstrumentalVariablesIdentificationClosed P :=
  And.intro E.instrumentRelevanceHolds E.instrumentExogeneityHolds

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
