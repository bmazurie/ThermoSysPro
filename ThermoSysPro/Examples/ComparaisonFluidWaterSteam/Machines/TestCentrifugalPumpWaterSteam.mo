within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model TestCentrifugalPumpWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Machines.CentrifugalPump centrifugalPump annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ(P0=300000, Q0=100, h0=100000) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(centrifugalPump.C2, sink.C) annotation (Line(points={{10,0},{30,0}}, color={0,0,255}));
  connect(centrifugalPump.C1, sourcePQ.C) annotation (Line(points={{-10,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(StopTime=1), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestCentrifugalPumpWaterSteam;
