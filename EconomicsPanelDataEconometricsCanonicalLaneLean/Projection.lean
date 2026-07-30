import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def panelDataProjection : Projection PanelDataEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem panel_data_projection_idempotent (x : PanelDataEndgameState) :
    panelDataProjection.toFun (panelDataProjection.toFun x) = panelDataProjection.toFun x := by
  exact panelDataProjection.idempotent x

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse