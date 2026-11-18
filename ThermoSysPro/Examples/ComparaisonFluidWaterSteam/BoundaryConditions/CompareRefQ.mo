within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model CompareRefQ
  "Compare Fluid and WaterSteam mass-flow references"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.BoundaryConditions.TestRefQ fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestRefQWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C1.Q, waterSteam.refQ.C1.Q, relativeTolerance, flowAbsoluteTolerance), "RefQ: inlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C2.Q, waterSteam.refQ.C2.Q, relativeTolerance, flowAbsoluteTolerance), "RefQ: outlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C1.P, waterSteam.refQ.C1.P, relativeTolerance, pressureAbsoluteTolerance), "RefQ: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C2.P, waterSteam.refQ.C2.P, relativeTolerance, pressureAbsoluteTolerance), "RefQ: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C1.h, waterSteam.refQ.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefQ: inlet h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refQ.C2.h, waterSteam.refQ.C2.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefQ: outlet h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareRefQ;
