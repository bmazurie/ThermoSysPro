within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestPipePressureLossWaterSteam
  "WaterSteam equivalent of Fluid TestPipePressureLoss"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(pipePressureLoss.C2, sink.C)
    annotation (Line(points={{10,0},{30,0}}, color={0,0,255}));
  connect(pipePressureLoss.C1, sourcePQ.C)
    annotation (Line(points={{-10,0},{-30,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestPipePressureLossWaterSteam;
