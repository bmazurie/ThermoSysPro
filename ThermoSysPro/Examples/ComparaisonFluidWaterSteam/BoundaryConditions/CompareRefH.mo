within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model CompareRefH
  "Compare Fluid and WaterSteam enthalpy references"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.BoundaryConditions.TestRefH fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestRefHWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C1.Q, waterSteam.refH.C1.Q, relativeTolerance, flowAbsoluteTolerance), "RefH: inlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C2.Q, waterSteam.refH.C2.Q, relativeTolerance, flowAbsoluteTolerance), "RefH: outlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C1.P, waterSteam.refH.C1.P, relativeTolerance, pressureAbsoluteTolerance), "RefH: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C2.P, waterSteam.refH.C2.P, relativeTolerance, pressureAbsoluteTolerance), "RefH: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C1.h, waterSteam.refH.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefH: inlet h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.refH.C2.h, waterSteam.refH.C2.h, relativeTolerance, enthalpyAbsoluteTolerance), "RefH: outlet h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareRefH;
