within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeITh
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeITh fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeIThWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeITh.Ce1.Q,fluid.volumeITh.Ce2.Q,fluid.volumeITh.Cs3.Q};
  fluidP={fluid.volumeITh.Ce1.P,fluid.volumeITh.Ce2.P,fluid.volumeITh.Cs3.P};
  fluidH={fluid.volumeITh.Ce1.h,fluid.volumeITh.Ce2.h,fluid.volumeITh.Cs3.h};
  waterSteamQ={waterSteam.volumeITh.Ce1.Q,waterSteam.volumeITh.Ce2.Q,waterSteam.volumeITh.Cs3.Q};
  waterSteamP={waterSteam.volumeITh.Ce1.P,waterSteam.volumeITh.Ce2.P,waterSteam.volumeITh.Cs3.P};
  waterSteamH={waterSteam.volumeITh.Ce1.h,waterSteam.volumeITh.Ce2.h,waterSteam.volumeITh.Cs3.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeITh;
