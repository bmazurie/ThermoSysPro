within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareTwoPhaseCavity
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestTwoPhaseCavity fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestTwoPhaseCavityWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.cavity.Ce.Q,fluid.cavity.Cv.Q,fluid.cavity.Cl.Q};
  fluidP={fluid.cavity.Ce.P,fluid.cavity.Cv.P,fluid.cavity.Cl.P};
  fluidH={fluid.cavity.Ce.h,fluid.cavity.Cv.h,fluid.cavity.Cl.h};
  waterSteamQ={waterSteam.cavity.Ce.Q,waterSteam.cavity.Cv.Q,waterSteam.cavity.Cl.Q};
  waterSteamP={waterSteam.cavity.Ce.P,waterSteam.cavity.Cv.P,waterSteam.cavity.Cl.P};
  waterSteamH={waterSteam.cavity.Ce.h,waterSteam.cavity.Cv.h,waterSteam.cavity.Cl.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareTwoPhaseCavity;
