within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeBTh
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeBTh fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeBThWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeBTh.Ce1.Q,fluid.volumeBTh.Ce2.Q,fluid.volumeBTh.Cs1.Q};
  fluidP={fluid.volumeBTh.Ce1.P,fluid.volumeBTh.Ce2.P,fluid.volumeBTh.Cs1.P};
  fluidH={fluid.volumeBTh.Ce1.h,fluid.volumeBTh.Ce2.h,fluid.volumeBTh.Cs1.h};
  waterSteamQ={waterSteam.volumeBTh.Ce1.Q,waterSteam.volumeBTh.Ce2.Q,waterSteam.volumeBTh.Cs1.Q};
  waterSteamP={waterSteam.volumeBTh.Ce1.P,waterSteam.volumeBTh.Ce2.P,waterSteam.volumeBTh.Cs1.P};
  waterSteamH={waterSteam.volumeBTh.Ce1.h,waterSteam.volumeBTh.Ce2.h,waterSteam.volumeBTh.Cs1.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeBTh;
