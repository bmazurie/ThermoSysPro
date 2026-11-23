within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareDeheaterMixer2
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestDeheaterMixer2 fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDeheaterMixer2WaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.deheaterMixer2_1.Ce.Q,fluid.deheaterMixer2_1.Ce_mix.Q,fluid.deheaterMixer2_1.Cs.Q};
  fluidP={fluid.deheaterMixer2_1.Ce.P,fluid.deheaterMixer2_1.Ce_mix.P,fluid.deheaterMixer2_1.Cs.P};
  fluidH={fluid.deheaterMixer2_1.Ce.h,fluid.deheaterMixer2_1.Ce_mix.h,fluid.deheaterMixer2_1.Cs.h};
  waterSteamQ={waterSteam.deheaterMixer2_1.Ce.Q,waterSteam.deheaterMixer2_1.Ce_mix.Q,waterSteam.deheaterMixer2_1.Cs.Q};
  waterSteamP={waterSteam.deheaterMixer2_1.Ce.P,waterSteam.deheaterMixer2_1.Ce_mix.P,waterSteam.deheaterMixer2_1.Cs.P};
  waterSteamH={waterSteam.deheaterMixer2_1.Ce.h,waterSteam.deheaterMixer2_1.Ce_mix.h,waterSteam.deheaterMixer2_1.Cs.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end CompareDeheaterMixer2;
