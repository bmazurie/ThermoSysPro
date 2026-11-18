within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model TestMixer2WaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Junctions.Mixer2 mixer2_1 annotation (Placement(transformation(extent={{-6,-10},{14,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss annotation (Placement(transformation(extent={{34,-10},{54,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss1 annotation (Placement(transformation(extent={{-46,10},{-26,30}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss2 annotation (Placement(transformation(extent={{-46,-30},{-26,-10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Source sourceP annotation (Placement(transformation(extent={{-86,10},{-66,30}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 annotation (Placement(transformation(extent={{-86,-30},{-66,-10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP annotation (Placement(transformation(extent={{74,-10},{94,10}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=0.3) annotation (Placement(transformation(extent={{-46,-10},{-26,10}}, rotation=0)));
equation
  connect(sourceP.C, singularPressureLoss1.C1) annotation (Line(points={{-66,20},{-46,20}}, color={0,0,255}));
  connect(singularPressureLoss1.C2, mixer2_1.Ce1) annotation (Line(points={{-26,20},{0,20},{0,10}}, color={0,0,255}));
  connect(sourceP1.C, singularPressureLoss2.C1) annotation (Line(points={{-66,-20},{-46,-20}}, color={0,0,255}));
  connect(singularPressureLoss2.C2, mixer2_1.Ce2) annotation (Line(points={{-26,-20},{0,-20},{0,-10}}, color={0,0,255}));
  connect(mixer2_1.Cs, singularPressureLoss.C1) annotation (Line(points={{14,0},{34,0}}, color={0,0,255}));
  connect(singularPressureLoss.C2, sinkP.C) annotation (Line(points={{54,0},{74,0}}, color={0,0,255}));
  connect(constante.y, mixer2_1.Ialpha1) annotation (Line(points={{-25,0},{-14,0},{-14,6},{-3,6}}));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end TestMixer2WaterSteam;
