import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPanelDataEconometricsCanonicalLaneLean

structure Panel where
  individuals : Nat
  timePeriods : Nat
  individualIndex : Type u
  timeIndex : Type v
  data : individualIndex -> timeIndex -> ℝ

export Panel (individuals timePeriods data)

structure FixedEffect (P : Panel) where
  individualIntercepts : P.individualIndex -> ℝ
  timeIntercepts : P.timeIndex -> ℝ

structure RandomEffect (P : Panel) where
  individualEffects : P.individualIndex -> ℝ
  timeEffects : P.timeIndex -> ℝ
  varianceComponents : ℝ × ℝ

structure InstrumentalVariable (P : Panel) where
  instrument : P.individualIndex -> P.timeIndex -> ℝ
  firstStage : Prop
  exogeneity : Prop

end EconomicsPanelDataEconometricsCanonicalLaneLean
end HautevilleHouse