within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareLumpedStraightPipe
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestLumpedStraightPipe fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestLumpedStraightPipeWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.lumpedStraightPipe.Q, waterSteam.lumpedStraightPipe.Q, relativeTolerance, flowAbsoluteTolerance), "LumpedStraightPipe: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.lumpedStraightPipe.C1.P, waterSteam.lumpedStraightPipe.C1.P, relativeTolerance, pressureAbsoluteTolerance), "LumpedStraightPipe: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.lumpedStraightPipe.C2.P, waterSteam.lumpedStraightPipe.C2.P, relativeTolerance, pressureAbsoluteTolerance), "LumpedStraightPipe: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.lumpedStraightPipe.C1.h, waterSteam.lumpedStraightPipe.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "LumpedStraightPipe: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareLumpedStraightPipe;
