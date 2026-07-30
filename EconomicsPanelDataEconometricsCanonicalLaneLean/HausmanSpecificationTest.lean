import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure HausmanSpecificationTestPackage where
  nullHypothesis : Prop
  testStatisticAsymptotic : Prop
  consistencyUnderNull : Prop
  powerAgainstAlternative : Prop
  nullHypothesisTerm : nullHypothesis
  testStatisticAsymptoticTerm : testStatisticAsymptotic
  consistencyUnderNullTerm : consistencyUnderNull
  powerAgainstAlternativeTerm : powerAgainstAlternative

structure HausmanTestEvidence (H : HausmanSpecificationTestPackage) where
  nullHypothesisClosed : H.nullHypothesis
  testStatisticAsymptoticClosed : H.testStatisticAsymptotic
  consistencyUnderNullClosed : H.consistencyUnderNull
  powerAgainstAlternativeClosed : H.powerAgainstAlternative

def HausmanTestClosed (H : HausmanSpecificationTestPackage) : Prop :=
  H.nullHypothesis ∧ H.testStatisticAsymptotic ∧
  H.consistencyUnderNull ∧ H.powerAgainstAlternative

theorem hausman_test_closed_from_evidence (H : HausmanSpecificationTestPackage)
    (E : HausmanTestEvidence H) : HausmanTestClosed H := by
  exact And.intro E.nullHypothesisClosed
    (And.intro E.testStatisticAsymptoticClosed
      (And.intro E.consistencyUnderNullClosed E.powerAgainstAlternativeClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse