within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model CompareStaticCentrifugalPump
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Machines.TestStaticCentrifugalPump fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStaticCentrifugalPumpWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.staticCentrifugalPump.C1.Q,fluid.staticCentrifugalPump.C2.Q};
  fluidP={fluid.staticCentrifugalPump.C1.P,fluid.staticCentrifugalPump.C2.P};
  fluidH={fluid.staticCentrifugalPump.C1.h,fluid.staticCentrifugalPump.C2.h};
  waterSteamQ={waterSteam.staticCentrifugalPump.C1.Q,waterSteam.staticCentrifugalPump.C2.Q};
  waterSteamP={waterSteam.staticCentrifugalPump.C1.P,waterSteam.staticCentrifugalPump.C2.P};
  waterSteamH={waterSteam.staticCentrifugalPump.C1.h,waterSteam.staticCentrifugalPump.C2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareStaticCentrifugalPump;
