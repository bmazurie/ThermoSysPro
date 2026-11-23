within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareSingularPressureLoss
  "Compare Fluid and WaterSteam singular pressure losses"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;

  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestSingularPressureLoss fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSingularPressureLossWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.singularPressureLoss.Q,
    waterSteam.singularPressureLoss.Q, relativeTolerance, flowAbsoluteTolerance),
    "SingularPressureLoss: mass-flow mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.singularPressureLoss.C1.P,
    waterSteam.singularPressureLoss.C1.P, relativeTolerance,
    pressureAbsoluteTolerance), "SingularPressureLoss: inlet-pressure mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.singularPressureLoss.C2.P,
    waterSteam.singularPressureLoss.C2.P, relativeTolerance,
    pressureAbsoluteTolerance), "SingularPressureLoss: outlet-pressure mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.singularPressureLoss.h,
    waterSteam.singularPressureLoss.h, relativeTolerance,
    enthalpyAbsoluteTolerance), "SingularPressureLoss: enthalpy mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareSingularPressureLoss;
