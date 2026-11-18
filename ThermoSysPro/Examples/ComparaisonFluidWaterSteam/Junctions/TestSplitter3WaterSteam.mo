within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model TestSplitter3WaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Junctions.Splitter3 splitter3 annotation (Placement(transformation(extent={{-16,-10},{4,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceP1(Q0=100) annotation (Placement(transformation(extent={{-96,-10},{-76,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss3 annotation (Placement(transformation(extent={{-56,-10},{-36,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP2 annotation (Placement(transformation(extent={{84,30},{104,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkP3 annotation (Placement(transformation(extent={{84,-50},{104,-30}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss4 annotation (Placement(transformation(extent={{44,30},{64,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss5 annotation (Placement(transformation(extent={{44,-50},{64,-30}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP4 annotation (Placement(transformation(extent={{84,-10},{104,10}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante1(k=0) annotation (Placement(transformation(extent={{-36,10},{-16,30}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante2(k=0) annotation (Placement(transformation(extent={{-36,-30},{-16,-10}}, rotation=0)));
equation
  connect(sourceP1.C, singularPressureLoss3.C1) annotation (Line(points={{-76,0},{-56,0}}, color={0,0,255}));
  connect(singularPressureLoss3.C2, splitter3.Ce) annotation (Line(points={{-36,0},{-15.8,0}}, color={0,0,255}));
  connect(splitter3.Cs1, singularPressureLoss4.C1) annotation (Line(points={{-2,10},{-2,40},{44,40}}, color={0,0,255}));
  connect(singularPressureLoss4.C2, sinkP2.C) annotation (Line(points={{64,40},{84,40}}, color={0,0,255}));
  connect(splitter3.Cs2, singularPressureLoss5.C1) annotation (Line(points={{-2,-10},{-2,-40},{44,-40}}, color={0,0,255}));
  connect(singularPressureLoss5.C2, sinkP3.C) annotation (Line(points={{64,-40},{84,-40}}, color={0,0,255}));
  connect(splitter3.Cs3, sinkP4.C) annotation (Line(points={{4,0},{84,0}}, color={0,0,255}));
  connect(constante1.y, splitter3.Ialpha1) annotation (Line(points={{-15,20},{-10,20},{-10,6},{-5,6}}));
  connect(constante2.y, splitter3.Ialpha2) annotation (Line(points={{-5,-6},{-10,-6},{-10,-20},{-15,-20}}));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end TestSplitter3WaterSteam;
