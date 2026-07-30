import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelAdmittedObject where
  data : Type
  identificationCondition : Prop
  exogeneityAssumption : Prop
  conclusion : identificationCondition ∧ exogeneityAssumption

def PanelWitnessClosed (O : PanelAdmittedObject) : Prop :=
  O.identificationCondition ∧ O.exogeneityAssumption

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse