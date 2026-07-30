import EconomicsPanelDataEconometricsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure PanelUnitRootPackage where
  unitRootNull : Prop
  hadriTest : Prop
  levinLinChuTest : Prop
  imPesaranShinTest : Prop
  testValidity : hadriTest ∨ levinLinChuTest ∨ imPesaranShinTest

structure PanelUnitRootEvidence (P : PanelUnitRootPackage) where
  unitRootNullHolds : P.unitRootNull
  testValidityHolds : P.testValidity

def PanelUnitRootClosed (P : PanelUnitRootPackage) : Prop :=
  P.testValidity

theorem panel_unit_root_closed_from_evidence (P : PanelUnitRootPackage) (E : PanelUnitRootEvidence P) : PanelUnitRootClosed P :=
  E.testValidityHolds

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse
