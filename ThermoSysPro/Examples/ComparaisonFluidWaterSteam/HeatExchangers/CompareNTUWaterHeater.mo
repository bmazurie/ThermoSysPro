within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareNTUWaterHeater
  extends PartialComparison(nPorts=5, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestNTUWaterHeater fluid(
    nTUWaterHeating1(Sp(h(fixed=false)), Se(h(fixed=false), P(fixed=false)))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestNTUWaterHeaterWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.nTUWaterHeating1.Ee.Q,fluid.nTUWaterHeating1.Se.Q,fluid.nTUWaterHeating1.Ev.Q,fluid.nTUWaterHeating1.Ep.Q,fluid.nTUWaterHeating1.Sp.Q};
  fluidP={fluid.nTUWaterHeating1.Ee.P,fluid.nTUWaterHeating1.Se.P,fluid.nTUWaterHeating1.Ev.P,fluid.nTUWaterHeating1.Ep.P,fluid.nTUWaterHeating1.Sp.P};
  fluidH={fluid.nTUWaterHeating1.Ee.h,fluid.nTUWaterHeating1.Se.h,fluid.nTUWaterHeating1.Ev.h,fluid.nTUWaterHeating1.Ep.h,fluid.nTUWaterHeating1.Sp.h};
  waterSteamQ={waterSteam.nTUWaterHeating1.Ee.Q,waterSteam.nTUWaterHeating1.Se.Q,waterSteam.nTUWaterHeating1.Ev.Q,waterSteam.nTUWaterHeating1.Ep.Q,waterSteam.nTUWaterHeating1.Sp.Q};
  waterSteamP={waterSteam.nTUWaterHeating1.Ee.P,waterSteam.nTUWaterHeating1.Se.P,waterSteam.nTUWaterHeating1.Ev.P,waterSteam.nTUWaterHeating1.Ep.P,waterSteam.nTUWaterHeating1.Sp.P};
  waterSteamH={waterSteam.nTUWaterHeating1.Ee.h,waterSteam.nTUWaterHeating1.Se.h,waterSteam.nTUWaterHeating1.Ev.h,waterSteam.nTUWaterHeating1.Ep.h,waterSteam.nTUWaterHeating1.Sp.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareNTUWaterHeater;
