import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure InstrumentalVariablesPanelPackage where
  instrumentRelevance : Prop
  instrumentExogeneity : Prop
  estimatorConsistent : Prop
  overidentificationTestValid : Prop
  instrumentRelevanceTerm : instrumentRelevance
  instrumentExogeneityTerm : instrumentExogeneity
  estimatorConsistentTerm : estimatorConsistent
  overidentificationTestValidTerm : overidentificationTestValid

struct IVPanelEvidence (IV : InstrumentalVariablesPanelPackage) where
  instrumentRelevanceClosed : IV.instrumentRelevance
  instrumentExogeneityClosed : IV.instrumentExogeneity
  estimatorConsistentClosed : IV.estimatorConsistent
  overidentificationTestValidClosed : IV.overidentificationTestValid

def IVPanelClosed (IV : InstrumentalVariablesPanelPackage) : Prop :=
  IV.instrumentRelevance ∧ IV.instrumentExogeneity ∧
  IV.estimatorConsistent ∧ IV.overidentificationTestValid

theorem iv_panel_closed_from_evidence (IV : InstrumentalVariablesPanelPackage)
    (E : IVPanelEvidence IV) : IVPanelClosed IV := by
  exact And.intro E.instrumentRelevanceClosed
    (And.intro E.instrumentExogeneityClosed
      (And.intro E.estimatorConsistentClosed E.overidentificationTestValidClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse