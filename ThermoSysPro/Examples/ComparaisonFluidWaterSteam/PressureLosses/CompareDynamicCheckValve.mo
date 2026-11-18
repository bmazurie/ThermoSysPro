within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareDynamicCheckValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestDynamicCheckValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicCheckValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicCheckValve.Q, waterSteam.dynamicCheckValve.Q, relativeTolerance, flowAbsoluteTolerance), "DynamicCheckValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicCheckValve.C1.P, waterSteam.dynamicCheckValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "DynamicCheckValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicCheckValve.C2.P, waterSteam.dynamicCheckValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "DynamicCheckValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicCheckValve.C1.h, waterSteam.dynamicCheckValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "DynamicCheckValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareDynamicCheckValve;
