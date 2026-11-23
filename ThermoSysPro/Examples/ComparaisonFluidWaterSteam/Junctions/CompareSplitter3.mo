within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareSplitter3
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestSplitter3 fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSplitter3WaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.splitter3.Ce.Q,fluid.splitter3.Cs1.Q,fluid.splitter3.Cs2.Q,fluid.splitter3.Cs3.Q};
  fluidP={fluid.splitter3.Ce.P,fluid.splitter3.Cs1.P,fluid.splitter3.Cs2.P,fluid.splitter3.Cs3.P};
  fluidH={fluid.splitter3.Ce.h,fluid.splitter3.Cs1.h,fluid.splitter3.Cs2.h,fluid.splitter3.Cs3.h};
  waterSteamQ={waterSteam.splitter3.Ce.Q,waterSteam.splitter3.Cs1.Q,waterSteam.splitter3.Cs2.Q,waterSteam.splitter3.Cs3.Q};
  waterSteamP={waterSteam.splitter3.Ce.P,waterSteam.splitter3.Cs1.P,waterSteam.splitter3.Cs2.P,waterSteam.splitter3.Cs3.P};
  waterSteamH={waterSteam.splitter3.Ce.h,waterSteam.splitter3.Cs1.h,waterSteam.splitter3.Cs2.h,waterSteam.splitter3.Cs3.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end CompareSplitter3;
