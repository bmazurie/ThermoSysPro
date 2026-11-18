within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestInvSingularPressureLossWaterSteam
  "WaterSteam equivalent of Fluid TestInvSingularPressureLoss"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.InvSingularPressureLoss invSingularPressureLoss annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(invSingularPressureLoss.C2, sinkP.C) annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
  connect(invSingularPressureLoss.C1, sourcePQ.C) annotation (Line(points={{-10,0},{-30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestInvSingularPressureLossWaterSteam;
