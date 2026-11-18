within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model TestDryerWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ(h0=2e6) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  ThermoSysPro.WaterSteam.Junctions.SteamDryer steamDryer annotation (Placement(transformation(extent={{-10,-14},{10,6}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink_cond annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss inletClosure(K=0)
    "Zero-loss adapter that closes the legacy WaterSteam enthalpy transport"
    annotation (Placement(transformation(extent={{-28,-6},{-12,6}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss vaporClosure(K=0)
    annotation (Placement(transformation(extent={{12,-6},{28,6}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss liquidClosure(K=0)
    annotation (Placement(transformation(extent={{10,-36},{26,-24}})));
equation
  connect(sourcePQ.C, inletClosure.C1)
    annotation (Line(points={{-30,0},{-28,0}}, color={0,0,255}));
  connect(inletClosure.C2, steamDryer.Cev)
    annotation (Line(points={{-12,0},{-9.9,0}}, color={0,0,255}));
  connect(steamDryer.Csv, vaporClosure.C1)
    annotation (Line(points={{9.9,0},{12,0}}, color={0,0,255}));
  connect(vaporClosure.C2, sink.C)
    annotation (Line(points={{28,0},{30,0}}, color={0,0,255}));
  connect(steamDryer.Csl, liquidClosure.C1)
    annotation (Line(points={{0.1,-14},{0.1,-30},{10,-30}}, color={0,0,255}));
  connect(liquidClosure.C2, sink_cond.C)
    annotation (Line(points={{26,-30},{30,-30}}, color={0,0,255}));
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestDryerWaterSteam;
