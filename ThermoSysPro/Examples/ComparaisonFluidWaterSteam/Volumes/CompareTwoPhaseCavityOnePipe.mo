within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareTwoPhaseCavityOnePipe
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestTwoPhaseCavityOnePipe fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestTwoPhaseCavityOnePipeWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.cavity.Ce.Q,fluid.cavity.CvBP.Q,fluid.cavity.CvGCT.Q,fluid.cavity.Cl.Q};
  fluidP={fluid.cavity.Ce.P,fluid.cavity.CvBP.P,fluid.cavity.CvGCT.P,fluid.cavity.Cl.P};
  fluidH={fluid.cavity.Ce.h,fluid.cavity.CvBP.h,fluid.cavity.CvGCT.h,fluid.cavity.Cl.h};
  waterSteamQ={waterSteam.cavity.Ce.Q,waterSteam.cavity.CvBP.Q,waterSteam.cavity.CvGCT.Q,waterSteam.cavity.Cl.Q};
  waterSteamP={waterSteam.cavity.Ce.P,waterSteam.cavity.CvBP.P,waterSteam.cavity.CvGCT.P,waterSteam.cavity.Cl.P};
  waterSteamH={waterSteam.cavity.Ce.h,waterSteam.cavity.CvBP.h,waterSteam.cavity.CvGCT.h,waterSteam.cavity.Cl.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareTwoPhaseCavityOnePipe;
