within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model TestVolumeBThWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,38})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.WaterSteam.Volumes.VolumeBTh volumeBTh annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,0})));
  Thermal.BoundaryConditions.HeatSource heatSource annotation (Placement(transformation(extent={{-10,-22},{10,-42}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure1(K=0) annotation (Placement(transformation(extent={{-28,-5},{-12,5}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure2(K=0) annotation (Placement(transformation(extent={{-24,22},{-8,32}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss closure3(K=0) annotation (Placement(transformation(extent={{-8,-5},{8,5}}, rotation=180, origin={20,0})));
equation
  connect(sourcePQ.C, closure1.C1) annotation (Line(points={{-30,0},{-28,0}}, color={0,0,0}));
  connect(closure1.C2, volumeBTh.Ce1) annotation (Line(points={{-12,0},{-10,0}}, color={0,0,0}));
  connect(sourceQ.C, closure3.C1) annotation (Line(points={{32,0},{28,0}}, color={0,0,0}));
  connect(closure3.C2, volumeBTh.Ce2) annotation (Line(points={{12,0},{10,0}}, color={0,0,0}));
  connect(volumeBTh.Cs1, closure2.C1) annotation (Line(points={{0,10},{0,27},{-24,27}}, color={0,0,0}));
  connect(closure2.C2, sink.C) annotation (Line(points={{-8,27},{0,27},{0,38},{20,38}}, color={0,0,0}));
  connect(heatSource.C[1], volumeBTh.Cth) annotation (Line(points={{0,-24},{0,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestVolumeBThWaterSteam;
