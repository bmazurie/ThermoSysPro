within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model CompareDiaphragm
  extends ThermoSysPro.UsersGuide.Icons.Example;
  extends PartialComparison;
  ThermoSysPro.Fluid.Examples.SimpleExamples.PressureLosses.TestDiaphragm fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDiaphragmWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  assert(ComparaisonFluidWaterSteam.isClose(fluid.diaphragm.Q, waterSteam.diaphragm.Q, relativeTolerance, flowAbsoluteTolerance), "Diaphragm: Q mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.diaphragm.C1.P, waterSteam.diaphragm.C1.P, relativeTolerance, pressureAbsoluteTolerance), "Diaphragm: inlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.diaphragm.C2.P, waterSteam.diaphragm.C2.P, relativeTolerance, pressureAbsoluteTolerance), "Diaphragm: outlet P mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.diaphragm.C1.h, waterSteam.diaphragm.C1.h, relativeTolerance, enthalpyAbsoluteTolerance), "Diaphragm: h mismatch");
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareDiaphragm;
