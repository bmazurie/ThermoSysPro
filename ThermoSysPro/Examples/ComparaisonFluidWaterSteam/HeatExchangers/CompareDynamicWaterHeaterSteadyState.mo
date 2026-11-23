within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicWaterHeaterSteadyState
  extends PartialComparison(nPorts=5, assertionLevel=AssertionLevel.warning);
  TestDynamicWaterHeaterSteadyStateFluid fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicWaterHeaterSteadyStateWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.waterHeater.C1vap.Q,fluid.waterHeater.C1.Q,fluid.waterHeater.C2ex.Q,fluid.waterHeater.Ce1.Q,fluid.waterHeater.Ce2.Q};
  fluidP={fluid.waterHeater.C1vap.P,fluid.waterHeater.C1.P,fluid.waterHeater.C2ex.P,fluid.waterHeater.Ce1.P,fluid.waterHeater.Ce2.P};
  fluidH={fluid.waterHeater.C1vap.h,fluid.waterHeater.C1.h,fluid.waterHeater.C2ex.h,fluid.waterHeater.Ce1.h,fluid.waterHeater.Ce2.h};
  waterSteamQ={waterSteam.waterHeater.C1vap.Q,waterSteam.waterHeater.C1.Q,waterSteam.waterHeater.C2ex.Q,waterSteam.waterHeater.Ce1.Q,waterSteam.waterHeater.Ce2.Q};
  waterSteamP={waterSteam.waterHeater.C1vap.P,waterSteam.waterHeater.C1.P,waterSteam.waterHeater.C2ex.P,waterSteam.waterHeater.Ce1.P,waterSteam.waterHeater.Ce2.P};
  waterSteamH={waterSteam.waterHeater.C1vap.h,waterSteam.waterHeater.C1.h,waterSteam.waterHeater.C2ex.h,waterSteam.waterHeater.Ce1.h,waterSteam.waterHeater.Ce2.h};
  annotation (experiment(StopTime=100, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Steady-state counterpart of `CompareDynamicWaterHeater`. Both benches start from steady state
(`steady_state=true`). To make this steady state well posed, the steam source imposes the pressure
(`P0c = 22 bar`) and the drain is connected to a pressure sink instead of imposing both flow rates: the steam
flow rate results from the condensation and the liquid level from the drain sink pressure.
"));
end CompareDynamicWaterHeaterSteadyState;
