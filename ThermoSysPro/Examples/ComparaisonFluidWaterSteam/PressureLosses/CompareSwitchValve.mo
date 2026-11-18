within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareSwitchValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestSwitchValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSwitchValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.switchValve.Q, waterSteam.switchValve.Q, relativeTolerance, flowAbsoluteTolerance), "SwitchValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.switchValve.C1.P, waterSteam.switchValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "SwitchValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.switchValve.C2.P, waterSteam.switchValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "SwitchValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.switchValve.C1.h, waterSteam.switchValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "SwitchValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareSwitchValve;
