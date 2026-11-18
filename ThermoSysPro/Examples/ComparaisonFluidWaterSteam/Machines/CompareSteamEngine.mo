within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model CompareSteamEngine
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Machines.TestSteamEngine fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSteamEngineWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamEngine1.C1.Q,fluid.steamEngine1.C2.Q};
  fluidP={fluid.steamEngine1.C1.P,fluid.steamEngine1.C2.P};
  fluidH={fluid.steamEngine1.C1.h,fluid.steamEngine1.C2.h};
  waterSteamQ={waterSteam.steamEngine1.C1.Q,waterSteam.steamEngine1.C2.Q};
  waterSteamP={waterSteam.steamEngine1.C1.P,waterSteam.steamEngine1.C2.P};
  waterSteamH={waterSteam.steamEngine1.C1.h,waterSteam.steamEngine1.C2.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareSteamEngine;
