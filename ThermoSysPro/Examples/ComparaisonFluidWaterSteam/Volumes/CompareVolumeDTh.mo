within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareVolumeDTh
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestVolumeDTh fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestVolumeDThWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.volumeDTh.Ce.Q,fluid.volumeDTh.Cs1.Q,fluid.volumeDTh.Cs3.Q};
  fluidP={fluid.volumeDTh.Ce.P,fluid.volumeDTh.Cs1.P,fluid.volumeDTh.Cs3.P};
  fluidH={fluid.volumeDTh.Ce.h,fluid.volumeDTh.Cs1.h,fluid.volumeDTh.Cs3.h};
  waterSteamQ={waterSteam.volumeDTh.Ce.Q,waterSteam.volumeDTh.Cs1.Q,waterSteam.volumeDTh.Cs3.Q};
  waterSteamP={waterSteam.volumeDTh.Ce.P,waterSteam.volumeDTh.Cs1.P,waterSteam.volumeDTh.Cs3.P};
  waterSteamH={waterSteam.volumeDTh.Ce.h,waterSteam.volumeDTh.Cs1.h,waterSteam.volumeDTh.Cs3.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareVolumeDTh;
