within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model TestSteamEngineWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.Machines.SteamEngine steamEngine1 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(P0=100000) annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(h0=3.e6, option_temperature=2, P0=1600000) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(sourceP.C, steamEngine1.C1) annotation (Line(points={{-30,0},{-7,0}}, color={0,0,255}));
  connect(steamEngine1.C2, puitsP.C) annotation (Line(points={{7,0},{30,0}}, color={0,0,255}));
  annotation (experiment(StopTime=1000), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestSteamEngineWaterSteam;
