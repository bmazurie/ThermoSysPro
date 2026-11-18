within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareDynamicReliefValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestDynamicReliefValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicReliefValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicReliefValve.Q, waterSteam.dynamicReliefValve.Q, relativeTolerance, flowAbsoluteTolerance), "DynamicReliefValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicReliefValve.C1.P, waterSteam.dynamicReliefValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "DynamicReliefValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicReliefValve.C2.P, waterSteam.dynamicReliefValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "DynamicReliefValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.dynamicReliefValve.C1.h, waterSteam.dynamicReliefValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "DynamicReliefValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareDynamicReliefValve;
