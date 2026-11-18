within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model CompareRefT
  "Compare Fluid and WaterSteam temperature references through Q/P/h"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.BoundaryConditions.TestRefT fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestRefTWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C1.Q, waterSteam.refT.C1.Q, relativeTolerance, flowAbsoluteTolerance), "RefT: inlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C2.Q, waterSteam.refT.C2.Q, relativeTolerance, flowAbsoluteTolerance), "RefT: outlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C1.P, waterSteam.refT.C1.P, relativeTolerance, pressureAbsoluteTolerance), "RefT: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C2.P, waterSteam.refT.C2.P, relativeTolerance, pressureAbsoluteTolerance), "RefT: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C1.h, waterSteam.refT.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefT: inlet h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refT.C2.h, waterSteam.refT.C2.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefT: outlet h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareRefT;
