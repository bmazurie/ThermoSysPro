within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareIdealSwitchValve
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestIdealSwitchValve fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestIdealSwitchValveWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealSwitchValve.Q, waterSteam.idealSwitchValve.Q, relativeTolerance, flowAbsoluteTolerance), "IdealSwitchValve: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealSwitchValve.C1.P, waterSteam.idealSwitchValve.C1.P, relativeTolerance, pressureAbsoluteTolerance), "IdealSwitchValve: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealSwitchValve.C2.P, waterSteam.idealSwitchValve.C2.P, relativeTolerance, pressureAbsoluteTolerance), "IdealSwitchValve: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.idealSwitchValve.C1.h, waterSteam.idealSwitchValve.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "IdealSwitchValve: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareIdealSwitchValve;
