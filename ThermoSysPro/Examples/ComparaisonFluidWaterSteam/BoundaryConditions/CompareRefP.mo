within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model CompareRefP
  "Compare Fluid and WaterSteam pressure references"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.BoundaryConditions.TestRefP fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestRefPWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C1.Q, waterSteam.refP.C1.Q, relativeTolerance, flowAbsoluteTolerance), "RefP: inlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C2.Q, waterSteam.refP.C2.Q, relativeTolerance, flowAbsoluteTolerance), "RefP: outlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C1.P, waterSteam.refP.C1.P, relativeTolerance, pressureAbsoluteTolerance), "RefP: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C2.P, waterSteam.refP.C2.P, relativeTolerance, pressureAbsoluteTolerance), "RefP: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C1.h, waterSteam.refP.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefP: inlet h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refP.C2.h, waterSteam.refP.C2.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefP: outlet h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareRefP;
