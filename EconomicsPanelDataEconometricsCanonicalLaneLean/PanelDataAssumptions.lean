import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometrics

structure PanelDataAssumptions where
  strictExogeneity : Prop
  noPerfectCollinearity : Prop
  sphericalErrors : Prop
  strictExogeneityTerm : strictExogeneity
  noPerfectCollinearityTerm : noPerfectCollinearity
  sphericalErrorsTerm : sphericalErrors

def PanelDataAssumptionsClosed (A : PanelDataAssumptions) : Prop :=
  A.strictExogeneity ∧ A.noPerfectCollinearity ∧ A.sphericalErrors

theorem panel_data_assumptions_closed_from_evidence (A : PanelDataAssumptions) : PanelDataAssumptionsClosed A := by
  exact And.intro A.strictExogeneityTerm (And.intro A.noPerfectCollinearityTerm A.sphericalErrorsTerm)

end EconomicsPanelDataEconometrics
end HautevilleHouse