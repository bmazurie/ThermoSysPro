within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareSplitter2
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestSplitter2 fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSplitter2WaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.splitter2.Ce.Q,fluid.splitter2.Cs1.Q,fluid.splitter2.Cs2.Q};
  fluidP={fluid.splitter2.Ce.P,fluid.splitter2.Cs1.P,fluid.splitter2.Cs2.P};
  fluidH={fluid.splitter2.Ce.h,fluid.splitter2.Cs1.h,fluid.splitter2.Cs2.h};
  waterSteamQ={waterSteam.splitter2.Ce.Q,waterSteam.splitter2.Cs1.Q,waterSteam.splitter2.Cs2.Q};
  waterSteamP={waterSteam.splitter2.Ce.P,waterSteam.splitter2.Cs1.P,waterSteam.splitter2.Cs2.P};
  waterSteamH={waterSteam.splitter2.Ce.h,waterSteam.splitter2.Cs1.h,waterSteam.splitter2.Cs2.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end CompareSplitter2;
