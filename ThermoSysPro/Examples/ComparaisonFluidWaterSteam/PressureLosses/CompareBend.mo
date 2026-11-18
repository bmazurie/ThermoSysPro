within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareBend
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestBend fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestBendWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.bend.Q, waterSteam.bend.Q, relativeTolerance, flowAbsoluteTolerance), "Bend: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.bend.C1.P, waterSteam.bend.C1.P, relativeTolerance, pressureAbsoluteTolerance), "Bend: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.bend.C2.P, waterSteam.bend.C2.P, relativeTolerance, pressureAbsoluteTolerance), "Bend: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.bend.C1.h, waterSteam.bend.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "Bend: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareBend;
