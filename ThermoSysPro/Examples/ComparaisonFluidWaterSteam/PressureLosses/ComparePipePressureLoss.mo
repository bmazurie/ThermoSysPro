within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model ComparePipePressureLoss
  "Compare Fluid and WaterSteam generic pipe pressure losses"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;

  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestPipePressureLoss fluid
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  TestPipePressureLossWaterSteam waterSteam
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.pipePressureLoss.Q,
    waterSteam.pipePressureLoss.Q, relativeTolerance, flowAbsoluteTolerance),
    "PipePressureLoss: mass-flow mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.pipePressureLoss.C1.P,
    waterSteam.pipePressureLoss.C1.P, relativeTolerance,
    pressureAbsoluteTolerance), "PipePressureLoss: inlet-pressure mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.pipePressureLoss.C2.P,
    waterSteam.pipePressureLoss.C2.P, relativeTolerance,
    pressureAbsoluteTolerance), "PipePressureLoss: outlet-pressure mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.pipePressureLoss.h,
    waterSteam.pipePressureLoss.h, relativeTolerance,
    enthalpyAbsoluteTolerance), "PipePressureLoss: enthalpy mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end ComparePipePressureLoss;
