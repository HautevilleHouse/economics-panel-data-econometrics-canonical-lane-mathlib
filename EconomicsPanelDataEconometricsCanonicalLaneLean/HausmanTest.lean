import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsPanelDataEconometricsCanonicalLaneLean.FixedEffectsEstimator
import HautevilleHouse.EconomicsPanelDataEconometricsCanonicalLaneLean.RandomEffectsEstimator

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure HausmanTest (P : PanelDataModel) (F : FixedEffectsEstimator P) (R : RandomEffectsEstimator P) where
  testStatistic : Prop
  nullHypothesis : Prop
  asymptoticDistribution : Prop
  decisionRule : Prop
  testStatisticTerm : testStatistic
  nullHypothesisTerm : nullHypothesis
  asymptoticDistributionTerm : asymptoticDistribution
  decisionRuleTerm : decisionRule

structure HausmanTestEvidence {P : PanelDataModel} {F : FixedEffectsEstimator P} {R : RandomEffectsEstimator P} (H : HausmanTest P F R) where
  testStatisticClosed : H.testStatistic
  nullHypothesisClosed : H.nullHypothesis
  asymptoticDistributionClosed : H.asymptoticDistribution
  decisionRuleClosed : H.decisionRule

def HausmanTestClosed {P : PanelDataModel} {F : FixedEffectsEstimator P} {R : RandomEffectsEstimator P} (H : HausmanTest P F R) : Prop :=
  H.testStatistic ∧ H.nullHypothesis ∧ H.asymptoticDistribution ∧ H.decisionRule

theorem hausman_test_closed_from_evidence {P : PanelDataModel} {F : FixedEffectsEstimator P} {R : RandomEffectsEstimator P} (H : HausmanTest P F R) (E : HausmanTestEvidence H) : HausmanTestClosed H := by
  exact And.intro E.testStatisticClosed (And.intro E.nullHypothesisClosed (And.intro E.asymptoticDistributionClosed E.decisionRuleClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse