import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelDataSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PanelDataAdmittedObject where
  space : PanelDataSpace
  balancedPanel : Prop
  strictExogeneity : Prop
  modelType : Type
  modelTopology : TopologicalSpace modelType
  consistentEstimator : Prop
  conclusion : consistentEstimator

structure PanelDataEndgameState where
  object : PanelDataAdmittedObject

def PanelDataWitnessClosed (O : PanelDataAdmittedObject) : Prop :=
  O.consistentEstimator

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse