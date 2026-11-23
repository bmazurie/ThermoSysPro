within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeB
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeB fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeBWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeB.Ce1.Q,fluid.volumeB.Ce2.Q,fluid.volumeB.Cs1.Q};
  fluidP={fluid.volumeB.Ce1.P,fluid.volumeB.Ce2.P,fluid.volumeB.Cs1.P};
  fluidH={fluid.volumeB.Ce1.h,fluid.volumeB.Ce2.h,fluid.volumeB.Cs1.h};
  waterSteamQ={waterSteam.volumeB.Ce1.Q,waterSteam.volumeB.Ce2.Q,waterSteam.volumeB.Cs1.Q};
  waterSteamP={waterSteam.volumeB.Ce1.P,waterSteam.volumeB.Ce2.P,waterSteam.volumeB.Cs1.P};
  waterSteamH={waterSteam.volumeB.Ce1.h,waterSteam.volumeB.Ce2.h,waterSteam.volumeB.Cs1.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeB;
