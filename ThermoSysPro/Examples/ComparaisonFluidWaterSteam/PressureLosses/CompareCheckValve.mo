within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareCheckValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestCheckValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestCheckValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.checkValve.Q, waterSteam.checkValve.Q, relativeTolerance, flowAbsoluteTolerance), "CheckValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.checkValve.C1.P, waterSteam.checkValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "CheckValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.checkValve.C2.P, waterSteam.checkValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "CheckValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.checkValve.C1.h, waterSteam.checkValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "CheckValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareCheckValve;
