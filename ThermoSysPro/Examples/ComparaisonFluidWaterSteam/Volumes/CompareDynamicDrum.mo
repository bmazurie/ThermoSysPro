within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareDynamicDrum
  extends PartialComparison(nPorts=1);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestDynamicDrum fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicDrumWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.drum.Cs.Q};
  fluidP={fluid.drum.Cs.P};
  fluidH={fluid.drum.Cs.h};
  waterSteamQ={waterSteam.drum.Cs.Q};
  waterSteamP={waterSteam.drum.Cs.P};
  waterSteamH={waterSteam.drum.Cs.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicDrum;
