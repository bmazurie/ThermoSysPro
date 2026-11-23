within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareThreeWayValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestThreeWayValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestThreeWayValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C1.Q, waterSteam.threeWayValve.C1.Q, relativeTolerance, flowAbsoluteTolerance), "ThreeWayValve: inlet Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C2.Q, waterSteam.threeWayValve.C2.Q, relativeTolerance, flowAbsoluteTolerance), "ThreeWayValve: outlet 2 Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C3.Q, waterSteam.threeWayValve.C3.Q, relativeTolerance, flowAbsoluteTolerance), "ThreeWayValve: outlet 3 Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C1.P, waterSteam.threeWayValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "ThreeWayValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C2.P, waterSteam.threeWayValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "ThreeWayValve: outlet 2 P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C3.P, waterSteam.threeWayValve.C3.P, relativeTolerance, pressureAbsoluteTolerance), "ThreeWayValve: outlet 3 P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C1.h, waterSteam.threeWayValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "ThreeWayValve: inlet h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C2.h, waterSteam.threeWayValve.C2.h, relativeTolerance, enthalpyAbsoluteTolerance), "ThreeWayValve: outlet 2 h mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.threeWayValve.C3.h, waterSteam.threeWayValve.C3.h, relativeTolerance, enthalpyAbsoluteTolerance), "ThreeWayValve: outlet 3 h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=5, Tolerance=1e-6), Documentation(info="
Known component difference: the regularisation parameter of the valve law
`ThermoSquare(Q, eps)` is `eps = 1e-3` in `Fluid.PressureLosses.ControlValve` and
`eps = 1` in `WaterSteam.PressureLosses.ControlValve`, so below 1 kg/s the
WaterSteam valve law is linear instead of quadratic. `eps` is a protected
parameter in both components and cannot be aligned by a modifier.
"));
end CompareThreeWayValve;
