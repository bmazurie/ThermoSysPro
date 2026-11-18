within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model TestStodolaTurbineWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine stodolaTurbine(Cst=4100, Ps(start=5000), rhos(start=1.22)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ(P0=300000, Q0=200, h0=3e6) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{26,-10},{46,10}})));
equation
  connect(sourcePQ.C, stodolaTurbine.Ce) annotation (Line(points={{-30,0},{-10.1,0}}, color={0,0,255}));
  connect(stodolaTurbine.Cs, sink.C) annotation (Line(points={{10.1,0},{26,0}}, color={0,0,255}));
  annotation (experiment(StopTime=1), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestStodolaTurbineWaterSteam;
