within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareMixer3
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestMixer3 fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestMixer3WaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.mixer3_1.Ce1.Q,fluid.mixer3_1.Ce2.Q,fluid.mixer3_1.Ce3.Q,fluid.mixer3_1.Cs.Q};
  fluidP={fluid.mixer3_1.Ce1.P,fluid.mixer3_1.Ce2.P,fluid.mixer3_1.Ce3.P,fluid.mixer3_1.Cs.P};
  fluidH={fluid.mixer3_1.Ce1.h,fluid.mixer3_1.Ce2.h,fluid.mixer3_1.Ce3.h,fluid.mixer3_1.Cs.h};
  waterSteamQ={waterSteam.mixer3_1.Ce1.Q,waterSteam.mixer3_1.Ce2.Q,waterSteam.mixer3_1.Ce3.Q,waterSteam.mixer3_1.Cs.Q};
  waterSteamP={waterSteam.mixer3_1.Ce1.P,waterSteam.mixer3_1.Ce2.P,waterSteam.mixer3_1.Ce3.P,waterSteam.mixer3_1.Cs.P};
  waterSteamH={waterSteam.mixer3_1.Ce1.h,waterSteam.mixer3_1.Ce2.h,waterSteam.mixer3_1.Ce3.h,waterSteam.mixer3_1.Cs.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end CompareMixer3;
