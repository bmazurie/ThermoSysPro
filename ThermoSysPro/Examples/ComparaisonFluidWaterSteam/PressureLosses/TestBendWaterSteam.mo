within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestBendWaterSteam
  "WaterSteam equivalent of Fluid TestBend"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.Bend bend annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-40})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(bend.C2, sink.C) annotation (Line(points={{0,-10},{0,-22},{1.77636e-15,-22},{1.77636e-15,-30}}, color={0,0,0}));
  connect(bend.C1, sourcePQ.C) annotation (Line(points={{-10,0},{-30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestBendWaterSteam;
