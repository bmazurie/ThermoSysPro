within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeD
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeD fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeDWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeD.Ce.Q,fluid.volumeD.Cs1.Q,fluid.volumeD.Cs3.Q};
  fluidP={fluid.volumeD.Ce.P,fluid.volumeD.Cs1.P,fluid.volumeD.Cs3.P};
  fluidH={fluid.volumeD.Ce.h,fluid.volumeD.Cs1.h,fluid.volumeD.Cs3.h};
  waterSteamQ={waterSteam.volumeD.Ce.Q,waterSteam.volumeD.Cs1.Q,waterSteam.volumeD.Cs3.Q};
  waterSteamP={waterSteam.volumeD.Ce.P,waterSteam.volumeD.Cs1.P,waterSteam.volumeD.Cs3.P};
  waterSteamH={waterSteam.volumeD.Ce.h,waterSteam.volumeD.Cs1.h,waterSteam.volumeD.Cs3.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeD;
