within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareIdealCheckValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestIdealCheckValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestIdealCheckValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealCheckValve.Q, waterSteam.idealCheckValve.Q, relativeTolerance, flowAbsoluteTolerance), "IdealCheckValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealCheckValve.C1.P, waterSteam.idealCheckValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "IdealCheckValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealCheckValve.C2.P, waterSteam.idealCheckValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "IdealCheckValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealCheckValve.C1.h, waterSteam.idealCheckValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "IdealCheckValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareIdealCheckValve;
