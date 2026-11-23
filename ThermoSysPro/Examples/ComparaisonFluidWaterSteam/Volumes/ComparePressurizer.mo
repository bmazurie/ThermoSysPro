within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model ComparePressurizer
  extends PartialComparison(nPorts=3, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestPressurizer fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestPressurizerWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.pressurizer.Cas.Q,fluid.pressurizer.Cs.Q,fluid.pressurizer.Cex.Q};
  fluidP={fluid.pressurizer.Cas.P,fluid.pressurizer.Cs.P,fluid.pressurizer.Cex.P};
  fluidH={fluid.pressurizer.Cas.h,fluid.pressurizer.Cs.h,fluid.pressurizer.Cex.h};
  waterSteamQ={waterSteam.pressurizer.Cas.Q,waterSteam.pressurizer.Cs.Q,waterSteam.pressurizer.Cex.Q};
  waterSteamP={waterSteam.pressurizer.Cas.P,waterSteam.pressurizer.Cs.P,waterSteam.pressurizer.Cex.P};
  waterSteamH={waterSteam.pressurizer.Cas.h,waterSteam.pressurizer.Cs.h,waterSteam.pressurizer.Cex.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Known component difference: the regularisation parameter of the valve law
`ThermoSquare(Q, eps)` is `eps = 1e-3` in `Fluid.PressureLosses.ControlValve` and
`eps = 1` in `WaterSteam.PressureLosses.ControlValve`, so below 1 kg/s the
WaterSteam valve law is linear instead of quadratic. `eps` is a protected
parameter in both components and cannot be aligned by a modifier.
"));
end ComparePressurizer;
