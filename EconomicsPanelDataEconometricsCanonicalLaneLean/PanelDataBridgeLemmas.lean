import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsPanelDataEconometricsCanonicalLaneLean.PanelDataModel

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PanelDataClosed (A.object)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse