within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareInvSingularPressureLoss
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestInvSingularPressureLoss fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestInvSingularPressureLossWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.invSingularPressureLoss.Q, waterSteam.invSingularPressureLoss.Q, relativeTolerance, flowAbsoluteTolerance), "InvSingularPressureLoss: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.invSingularPressureLoss.C1.P, waterSteam.invSingularPressureLoss.C1.P, relativeTolerance, pressureAbsoluteTolerance), "InvSingularPressureLoss: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.invSingularPressureLoss.C2.P, waterSteam.invSingularPressureLoss.C2.P, relativeTolerance, pressureAbsoluteTolerance), "InvSingularPressureLoss: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.invSingularPressureLoss.C1.h, waterSteam.invSingularPressureLoss.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "InvSingularPressureLoss: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareInvSingularPressureLoss;
