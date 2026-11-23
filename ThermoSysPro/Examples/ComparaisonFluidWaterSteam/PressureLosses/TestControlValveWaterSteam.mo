within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestControlValveWaterSteam
  "WaterSteam equivalent of Fluid TestControlValve"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve controlValve(
    caract=[0,0; 0.5,3000; 0.75,7000; 1,8000])
    annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ(Q0=2580) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Tables.Table1DTemps Constante1(
    Table=[0,0.9; 5,0.9; 15,0.5; 25,0.5; 50,0.2; 100,0.2])
    annotation (Placement(transformation(extent={{-30,34},{-10,54}}, rotation=0)));
equation
  connect(controlValve.C2, sink.C) annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
  connect(controlValve.C1, sourcePQ.C) annotation (Line(points={{-10,0},{-30,0}}, color={0,0,0}));
  connect(Constante1.y, controlValve.Ouv) annotation (Line(points={{-9,44},{0,44},{0,17}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestControlValveWaterSteam;
