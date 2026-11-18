within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model CompareCentrifugalPump
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Machines.TestCentrifugalPump fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestCentrifugalPumpWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.centrifugalPump.C1.Q,fluid.centrifugalPump.C2.Q};
  fluidP={fluid.centrifugalPump.C1.P,fluid.centrifugalPump.C2.P};
  fluidH={fluid.centrifugalPump.C1.h,fluid.centrifugalPump.C2.h};
  waterSteamQ={waterSteam.centrifugalPump.C1.Q,waterSteam.centrifugalPump.C2.Q};
  waterSteamP={waterSteam.centrifugalPump.C1.P,waterSteam.centrifugalPump.C2.P};
  waterSteamH={waterSteam.centrifugalPump.C1.h,waterSteam.centrifugalPump.C2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareCentrifugalPump;
