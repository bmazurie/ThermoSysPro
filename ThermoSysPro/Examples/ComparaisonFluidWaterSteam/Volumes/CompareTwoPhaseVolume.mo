within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareTwoPhaseVolume
  extends PartialComparison(nPorts=1, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestTwoPhaseVolume fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestTwoPhaseVolumeWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volume.Cl.Q};
  fluidP={fluid.volume.Cl.P};
  fluidH={fluid.volume.Cl.h};
  waterSteamQ={waterSteam.volume.Cl.Q};
  waterSteamP={waterSteam.volume.Cl.P};
  waterSteamH={waterSteam.volume.Cl.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareTwoPhaseVolume;
