import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure GMMEstimation (P : Panel) where
  instruments : List (P.individualIndex -> P.timeIndex -> ℝ)
  firstDifference : Bool
  momentConditions : Prop
  estimatorConsistent : Prop

export GMMEstimation (momentConditions estimatorConsistent)

structure ArellanoBondModel (P : Panel) extends GMMEstimation P where
  laggedDependent : Bool
  strictlyExogenous : Prop
  autoCorrelation : Prop

def ArellanoBondClosed (P : Panel) (AB : ArellanoBondModel P) : Prop :=
  AB.momentConditions ∧ AB.estimatorConsistent ∧ AB.strictlyExogenous ∧ AB.autoCorrelation

theorem arellano_bond_endgame (P : Panel) (AB : ArellanoBondModel P) : ArellanoBondClosed P AB := by
  exact And.intro AB.momentConditions (And.intro AB.estimatorConsistent (And.intro AB.strictlyExogenous AB.autoCorrelation))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse