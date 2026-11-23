within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicWaterHeater
  extends PartialComparison(nPorts=5, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicWaterHeater fluid(
    waterHeater(
      WaterHeating(steady_state=false),
      pipe_1(P(start=fill(6.95e6, 12)), h(start=linspace(1e5, 5e5, 12))),
      pipe_2(P(start=fill(6.95e6, 12)), h(start=linspace(5e5, 9e5, 12))),
      pipe_3(P(start=fill(6.95e6, 22)), h(start=linspace(1e5, 9e5, 22))))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicWaterHeaterWaterSteam waterSteam(
    waterHeater(
      WaterHeating(steady_state=false),
      pipe_1(P(start=fill(6.95e6, 12)), h(start=linspace(1e5, 5e5, 12))),
      pipe_2(P(start=fill(6.95e6, 12)), h(start=linspace(5e5, 9e5, 12))),
      pipe_3(P(start=fill(6.95e6, 22)), h(start=linspace(1e5, 9e5, 22))))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.waterHeater.C1vap.Q,fluid.waterHeater.C1.Q,fluid.waterHeater.C2ex.Q,fluid.waterHeater.Ce1.Q,fluid.waterHeater.Ce2.Q};
  fluidP={fluid.waterHeater.C1vap.P,fluid.waterHeater.C1.P,fluid.waterHeater.C2ex.P,fluid.waterHeater.Ce1.P,fluid.waterHeater.Ce2.P};
  fluidH={fluid.waterHeater.C1vap.h,fluid.waterHeater.C1.h,fluid.waterHeater.C2ex.h,fluid.waterHeater.Ce1.h,fluid.waterHeater.Ce2.h};
  waterSteamQ={waterSteam.waterHeater.C1vap.Q,waterSteam.waterHeater.C1.Q,waterSteam.waterHeater.C2ex.Q,waterSteam.waterHeater.Ce1.Q,waterSteam.waterHeater.Ce2.Q};
  waterSteamP={waterSteam.waterHeater.C1vap.P,waterSteam.waterHeater.C1.P,waterSteam.waterHeater.C2ex.P,waterSteam.waterHeater.Ce1.P,waterSteam.waterHeater.Ce2.P};
  waterSteamH={waterSteam.waterHeater.C1vap.h,waterSteam.waterHeater.C1.h,waterSteam.waterHeater.C2ex.h,waterSteam.waterHeater.Ce1.h,waterSteam.waterHeater.Ce2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Both cavities start from the same state, `steady_state=false` with the
`P0c = 22 bar` and `Vf0 = 0.43` already given by the SimpleExample: all the flow
rates are imposed, so a steady-state start leaves the cavity mass undetermined
and both components converged to non-physical levels. The pipes keep a
steady-state start; their pressure and enthalpy start values are given on both
sides, the default ones (1 bar for WaterSteam, 200 bar for Fluid) leave the
IF97 domain.
"));
end CompareDynamicWaterHeater;
