within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareMassFlowMultiplier
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestMassFlowMultiplier fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestMassFlowMultiplierWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.massFlowMultiplier.Ce.Q,fluid.massFlowMultiplier.Cs.Q};
  fluidP={fluid.massFlowMultiplier.Ce.P,fluid.massFlowMultiplier.Cs.P};
  fluidH={fluid.massFlowMultiplier.Ce.h,fluid.massFlowMultiplier.Cs.h};
  waterSteamQ={waterSteam.massFlowMultiplier.Ce.Q,waterSteam.massFlowMultiplier.Cs.Q};
  waterSteamP={waterSteam.massFlowMultiplier.Ce.P,waterSteam.massFlowMultiplier.Cs.P};
  waterSteamH={waterSteam.massFlowMultiplier.Ce.h,waterSteam.massFlowMultiplier.Cs.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1000, Tolerance=1e-6));
end CompareMassFlowMultiplier;
