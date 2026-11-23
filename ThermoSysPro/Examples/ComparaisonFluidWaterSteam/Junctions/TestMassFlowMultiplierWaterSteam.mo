within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model TestMassFlowMultiplierWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-90,-10},{-70,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{70,-10},{90,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss annotation (Placement(transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss singularPressureLoss1 annotation (Placement(transformation(extent={{30,-10},{50,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.Junctions.MassFlowMultiplier massFlowMultiplier annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=0)));
equation
  connect(sourcePQ.C, singularPressureLoss.C1) annotation (Line(points={{-70,0},{-50,0}}, color={0,0,255}));
  connect(singularPressureLoss.C2, massFlowMultiplier.Ce) annotation (Line(points={{-30,0},{-10,0}}, color={0,0,255}));
  connect(massFlowMultiplier.Cs, singularPressureLoss1.C1) annotation (Line(points={{10,0},{30,0}}, color={0,0,255}));
  connect(singularPressureLoss1.C2, sink.C) annotation (Line(points={{50,0},{70,0}}, color={0,0,255}));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1000, Tolerance=1e-6));
end TestMassFlowMultiplierWaterSteam;
