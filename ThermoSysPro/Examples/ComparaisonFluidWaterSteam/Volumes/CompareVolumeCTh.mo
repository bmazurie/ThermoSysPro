within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeCTh
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeCTh fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeCThWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeCTh.Ce1.Q,fluid.volumeCTh.Ce2.Q,fluid.volumeCTh.Cs.Q};
  fluidP={fluid.volumeCTh.Ce1.P,fluid.volumeCTh.Ce2.P,fluid.volumeCTh.Cs.P};
  fluidH={fluid.volumeCTh.Ce1.h,fluid.volumeCTh.Ce2.h,fluid.volumeCTh.Cs.h};
  waterSteamQ={waterSteam.volumeCTh.Ce1.Q,waterSteam.volumeCTh.Ce2.Q,waterSteam.volumeCTh.Cs.Q};
  waterSteamP={waterSteam.volumeCTh.Ce1.P,waterSteam.volumeCTh.Ce2.P,waterSteam.volumeCTh.Cs.P};
  waterSteamH={waterSteam.volumeCTh.Ce1.h,waterSteam.volumeCTh.Ce2.h,waterSteam.volumeCTh.Cs.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeCTh;
