within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestIdealSwitchValveWaterSteam
  "WaterSteam equivalent of Fluid TestIdealSwitchValve"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.IdealSwitchValve idealSwitchValve annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Constante constante
    annotation (Placement(transformation(extent={{-78,32},{-58,52}})));
equation
  connect(idealSwitchValve.C2, sink.C) annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
  connect(idealSwitchValve.C1, sourcePQ.C) annotation (Line(points={{-10,0},{-30,0}}, color={0,0,0}));
  connect(constante.yL, idealSwitchValve.Ouv) annotation (Line(points={{-19,40},{0,40},{0,13}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestIdealSwitchValveWaterSteam;
