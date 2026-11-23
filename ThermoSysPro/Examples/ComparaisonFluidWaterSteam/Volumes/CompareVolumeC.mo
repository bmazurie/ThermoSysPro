within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeC
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeC fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeCWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeC.Ce1.Q,fluid.volumeC.Ce2.Q,fluid.volumeC.Cs.Q};
  fluidP={fluid.volumeC.Ce1.P,fluid.volumeC.Ce2.P,fluid.volumeC.Cs.P};
  fluidH={fluid.volumeC.Ce1.h,fluid.volumeC.Ce2.h,fluid.volumeC.Cs.h};
  waterSteamQ={waterSteam.volumeC.Ce1.Q,waterSteam.volumeC.Ce2.Q,waterSteam.volumeC.Cs.Q};
  waterSteamP={waterSteam.volumeC.Ce1.P,waterSteam.volumeC.Ce2.P,waterSteam.volumeC.Cs.P};
  waterSteamH={waterSteam.volumeC.Ce1.h,waterSteam.volumeC.Ce2.h,waterSteam.volumeC.Cs.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeC;
