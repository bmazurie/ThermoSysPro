within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeA
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeA fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeAWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeA.Ce1.Q,fluid.volumeA.Ce2.Q,fluid.volumeA.Cs1.Q};
  fluidP={fluid.volumeA.Ce1.P,fluid.volumeA.Ce2.P,fluid.volumeA.Cs1.P};
  fluidH={fluid.volumeA.Ce1.h,fluid.volumeA.Ce2.h,fluid.volumeA.Cs1.h};
  waterSteamQ={waterSteam.volumeA.Ce1.Q,waterSteam.volumeA.Ce2.Q,waterSteam.volumeA.Cs1.Q};
  waterSteamP={waterSteam.volumeA.Ce1.P,waterSteam.volumeA.Ce2.P,waterSteam.volumeA.Cs1.P};
  waterSteamH={waterSteam.volumeA.Ce1.h,waterSteam.volumeA.Ce2.h,waterSteam.volumeA.Cs1.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeA;
