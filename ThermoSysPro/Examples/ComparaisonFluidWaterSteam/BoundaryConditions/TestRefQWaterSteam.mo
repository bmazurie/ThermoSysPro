within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model TestRefQWaterSteam
  "WaterSteam equivalent of Fluid TestRefQ"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{66,-10},{86,10}})));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefQ refQ annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=2600e3,
    option_temperature=2) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=110) annotation (Placement(transformation(extent={{-30,38},{-10,58}})));
equation
  connect(sink.C, pipePressureLoss.C2) annotation (Line(points={{66,0},{52,0}}, color={0,0,0}));
  connect(refQ.C2, pipePressureLoss.C1) annotation (Line(points={{10,0},{32,0}}, color={0,0,0}));
  connect(sourceP.C, refQ.C1) annotation (Line(points={{-46,0},{-10,0}}, color={0,0,0}));
  connect(constante.y, refQ.IMassFlow) annotation (Line(points={{-9,48},{0,48},{0,11}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestRefQWaterSteam;
