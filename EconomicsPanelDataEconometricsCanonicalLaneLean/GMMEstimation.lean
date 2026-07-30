import EconomicsPanelDataEconometricsCanonicalLaneLean.PanelIdentifiability

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure GMMPackage (I : IdentifiabilityPackage) where
  objectiveFunction : Prop
  weightingMatrix : Prop
  firstStageConsistent : Prop
  asymptoticNormality : Prop

structure GMMEvidence {I : IdentifiabilityPackage} (G : GMMPackage I) where
  objectiveFunctionClosed : G.objectiveFunction
  weightingMatrixClosed : G.weightingMatrix
  firstStageConsistentClosed : G.firstStageConsistent
  asymptoticNormalityClosed : G.asymptoticNormality

def GMMClosed {I : IdentifiabilityPackage} (G : GMMPackage I) : Prop :=
  G.objectiveFunction ∧ G.weightingMatrix ∧ G.firstStageConsistent ∧ G.asymptoticNormality

theorem gmm_closed_from_evidence {I : IdentifiabilityPackage} (G : GMMPackage I) (E : GMMEvidence G) :
    GMMClosed G := by
  exact And.intro E.objectiveFunctionClosed
    (And.intro E.weightingMatrixClosed
      (And.intro E.firstStageConsistentClosed E.asymptoticNormalityClosed))

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
