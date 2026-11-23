within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareSteamExtractionSplitter
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestSteamExtractionSplitter fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSteamExtractionSplitterWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamExtractionSplitter.Ce.Q,fluid.steamExtractionSplitter.Cs.Q,fluid.steamExtractionSplitter.Cex.Q};
  fluidP={fluid.steamExtractionSplitter.Ce.P,fluid.steamExtractionSplitter.Cs.P,fluid.steamExtractionSplitter.Cex.P};
  fluidH={fluid.steamExtractionSplitter.Ce.h,fluid.steamExtractionSplitter.Cs.h,fluid.steamExtractionSplitter.Cex.h};
  waterSteamQ={waterSteam.steamExtractionSplitter.Ce.Q,waterSteam.steamExtractionSplitter.Cs.Q,waterSteam.steamExtractionSplitter.Cex.Q};
  waterSteamP={waterSteam.steamExtractionSplitter.Ce.P,waterSteam.steamExtractionSplitter.Cs.P,waterSteam.steamExtractionSplitter.Cex.P};
  waterSteamH={waterSteam.steamExtractionSplitter.Ce.h,waterSteam.steamExtractionSplitter.Cs.h,waterSteam.steamExtractionSplitter.Cex.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1000, Tolerance=1e-6));
end CompareSteamExtractionSplitter;
