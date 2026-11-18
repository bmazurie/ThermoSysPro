within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model TestVolumeCWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.WaterSteam.Volumes.VolumeC volumeC annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure1(K=0) annotation (Placement(transformation(extent={{-28,-5},{-12,5}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure2(K=0) annotation (Placement(transformation(extent={{-24,22},{-8,32}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure3(K=0) annotation (Placement(transformation(extent={{12,-5},{28,5}})));
equation
  connect(sourcePQ.C, closure1.C1) annotation (Line(points={{-30,0},{-28,0}}, color={0,0,0}));
  connect(closure1.C2, volumeC.Ce1) annotation (Line(points={{-12,0},{-10,0}}, color={0,0,0}));
  connect(sourceQ.C, closure2.C1) annotation (Line(points={{-30,30},{-24,30},{-24,27}}, color={0,0,0}));
  connect(closure2.C2, volumeC.Ce2) annotation (Line(points={{-8,27},{0,27},{0,10}}, color={0,0,0}));
  connect(volumeC.Cs, closure3.C1) annotation (Line(points={{10,0},{12,0}}, color={0,0,0}));
  connect(closure3.C2, sink.C) annotation (Line(points={{28,0},{30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestVolumeCWaterSteam;
