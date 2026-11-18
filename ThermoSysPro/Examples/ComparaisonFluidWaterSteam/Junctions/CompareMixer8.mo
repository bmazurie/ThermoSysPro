within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareMixer8
  extends PartialComparison(nPorts=7);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestMixer8 fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestMixer8WaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.staticVolume.Ce4.Q,fluid.staticVolume.Cs.Q,fluid.staticVolume2.Ce4.Q,fluid.staticVolume2.Cs.Q,fluid.staticVolume1.Ce1.Q,fluid.staticVolume1.Ce8.Q,fluid.staticVolume1.Cs.Q};
  fluidP={fluid.staticVolume.Ce4.P,fluid.staticVolume.Cs.P,fluid.staticVolume2.Ce4.P,fluid.staticVolume2.Cs.P,fluid.staticVolume1.Ce1.P,fluid.staticVolume1.Ce8.P,fluid.staticVolume1.Cs.P};
  fluidH={fluid.staticVolume.Ce4.h,fluid.staticVolume.Cs.h,fluid.staticVolume2.Ce4.h,fluid.staticVolume2.Cs.h,fluid.staticVolume1.Ce1.h,fluid.staticVolume1.Ce8.h,fluid.staticVolume1.Cs.h};
  waterSteamQ={waterSteam.staticVolume.Ce4.Q,waterSteam.staticVolume.Cs.Q,waterSteam.staticVolume2.Ce4.Q,waterSteam.staticVolume2.Cs.Q,waterSteam.staticVolume1.Ce1.Q,waterSteam.staticVolume1.Ce8.Q,waterSteam.staticVolume1.Cs.Q};
  waterSteamP={waterSteam.staticVolume.Ce4.P,waterSteam.staticVolume.Cs.P,waterSteam.staticVolume2.Ce4.P,waterSteam.staticVolume2.Cs.P,waterSteam.staticVolume1.Ce1.P,waterSteam.staticVolume1.Ce8.P,waterSteam.staticVolume1.Cs.P};
  waterSteamH={waterSteam.staticVolume.Ce4.h,waterSteam.staticVolume.Cs.h,waterSteam.staticVolume2.Ce4.h,waterSteam.staticVolume2.Cs.h,waterSteam.staticVolume1.Ce1.h,waterSteam.staticVolume1.Ce8.h,waterSteam.staticVolume1.Cs.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end CompareMixer8;
