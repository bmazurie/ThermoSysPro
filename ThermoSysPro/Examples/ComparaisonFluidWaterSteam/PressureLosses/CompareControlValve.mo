within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareControlValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestControlValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestControlValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.controlValve.Q, waterSteam.controlValve.Q, relativeTolerance, flowAbsoluteTolerance), "ControlValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.controlValve.C1.P, waterSteam.controlValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "ControlValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.controlValve.C2.P, waterSteam.controlValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "ControlValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.controlValve.C1.h, waterSteam.controlValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "ControlValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareControlValve;
