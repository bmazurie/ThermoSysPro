within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeI
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeI fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeIWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeI.Ce1.Q,fluid.volumeI.Ce2.Q,fluid.volumeI.Cs3.Q};
  fluidP={fluid.volumeI.Ce1.P,fluid.volumeI.Ce2.P,fluid.volumeI.Cs3.P};
  fluidH={fluid.volumeI.Ce1.h,fluid.volumeI.Ce2.h,fluid.volumeI.Cs3.h};
  waterSteamQ={waterSteam.volumeI.Ce1.Q,waterSteam.volumeI.Ce2.Q,waterSteam.volumeI.Cs3.Q};
  waterSteamP={waterSteam.volumeI.Ce1.P,waterSteam.volumeI.Ce2.P,waterSteam.volumeI.Cs3.P};
  waterSteamH={waterSteam.volumeI.Ce1.h,waterSteam.volumeI.Ce2.h,waterSteam.volumeI.Cs3.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeI;
