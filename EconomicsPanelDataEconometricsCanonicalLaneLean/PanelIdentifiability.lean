import EconomicsPanelDataEconometricsCanonicalLaneLean.EconomicsAdmittedObject

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure IdentifiabilityPackage where
  linearMomentConditions : Prop
  rankConditionHolds : Prop
  instrumentRelevance : Prop
  identificationStrength : Prop

structure IdentifiabilityEvidence (I : IdentifiabilityPackage) where
  linearMomentConditionsClosed : I.linearMomentConditions
  rankConditionHoldsClosed : I.rankConditionHolds
  instrumentRelevanceClosed : I.instrumentRelevance
  identificationStrengthClosed : I.identificationStrength

def IdentifiabilityClosed (I : IdentifiabilityPackage) : Prop :=
  I.linearMomentConditions ∧ I.rankConditionHolds ∧ I.instrumentRelevance ∧ I.identificationStrength

theorem identifiability_closed_from_evidence (I : IdentifiabilityPackage) (E : IdentifiabilityEvidence I) :
    IdentifiabilityClosed I := by
  exact And.intro E.linearMomentConditionsClosed
    (And.intro E.rankConditionHoldsClosed
      (And.intro E.instrumentRelevanceClosed E.identificationStrengthClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
