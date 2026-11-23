within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestCheckValveWaterSteam
  "WaterSteam equivalent of Fluid TestCheckValve"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.CheckValve checkValve annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,0})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(checkValve.C2, sink.C) annotation (Line(points={{11,0},{30,0}}, color={0,0,0}));
  connect(checkValve.C1, sourcePQ.C) annotation (Line(points={{-11,0},{-30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestCheckValveWaterSteam;
