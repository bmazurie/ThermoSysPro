within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeATh
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeATh fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeAThWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeATh.Ce1.Q,fluid.volumeATh.Ce2.Q,fluid.volumeATh.Cs1.Q};
  fluidP={fluid.volumeATh.Ce1.P,fluid.volumeATh.Ce2.P,fluid.volumeATh.Cs1.P};
  fluidH={fluid.volumeATh.Ce1.h,fluid.volumeATh.Ce2.h,fluid.volumeATh.Cs1.h};
  waterSteamQ={waterSteam.volumeATh.Ce1.Q,waterSteam.volumeATh.Ce2.Q,waterSteam.volumeATh.Cs1.Q};
  waterSteamP={waterSteam.volumeATh.Ce1.P,waterSteam.volumeATh.Ce2.P,waterSteam.volumeATh.Cs1.P};
  waterSteamH={waterSteam.volumeATh.Ce1.h,waterSteam.volumeATh.Ce2.h,waterSteam.volumeATh.Cs1.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeATh;
