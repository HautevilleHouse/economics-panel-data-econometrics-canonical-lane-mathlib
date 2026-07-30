import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EconomicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse