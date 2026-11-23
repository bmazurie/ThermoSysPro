within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model TestDeheaterMixer2WaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Junctions.DeheaterMixer2 deheaterMixer2_1(Tmax=308) annotation (Placement(transformation(extent={{-10,-16},{10,4}},rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss annotation (Placement(transformation(extent={{-50,-10},{-30,10}},rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss1 annotation (Placement(transformation(extent={{30,-10},{50,10}},rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss2 annotation (Placement(transformation(extent={{-50,-50},{-30,-30}},
                                                                                                                                                                                   rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkP annotation (Placement(transformation(extent={{70,-10},{90,10}},rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(T0=310) annotation (Placement(transformation(extent={{-90,-10},{-70,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Source source(h0=30000) annotation (Placement(transformation(extent={{-90,-50},{-70,-30}},rotation=0)));
equation
  connect(sourceP.C, singularPressureLoss.C1) annotation (Line(points={{-70,0},{-50,0}},   color={0,0,255}));
  connect(singularPressureLoss.C2, deheaterMixer2_1.Ce) annotation (Line(points={{-30,0},{-10,0}},                     color={0,0,255}));
  connect(deheaterMixer2_1.Cs, singularPressureLoss1.C1) annotation (Line(points={{10,0},{30,0}},                  color={0,0,255}));
  connect(singularPressureLoss1.C2, sinkP.C) annotation (Line(points={{50,0},{70,0}},   color={0,0,255}));
  connect(source.C, singularPressureLoss2.C1) annotation (Line(points={{-70,-40},{-50,-40}}, color={0,0,255}));
  connect(singularPressureLoss2.C2, deheaterMixer2_1.Ce_mix) annotation (Line(points={{-30,-40},{0.1,-40},{0.1,-16}},  color={0,0,255}));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6));
end TestDeheaterMixer2WaterSteam;
