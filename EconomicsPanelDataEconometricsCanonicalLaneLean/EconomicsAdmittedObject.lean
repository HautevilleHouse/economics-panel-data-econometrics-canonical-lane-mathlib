import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure EconomicsObject where
  dataSet : Type
  panelStructure : Prop
  identificationConditions : Prop
  estimatorConsistency : Prop

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.estimatorConsistency

structure EconomicsAdmittedObject where
  econObject : EconomicsObject
  estimationAchieved : Prop
  conclusion : estimationAchieved

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
