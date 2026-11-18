within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model TestTwoPhaseCavityOnePipeWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;


  ThermoSysPro.WaterSteam.Volumes.TwoPhaseCavityOnePipe cavity(
    steady_state=false,
    P0=13000000,
    P(start=13000000, fixed=true),
    hl(start=1454400),
    hv(start=2.658e6),
    hvIn(start=2.8e6),
    xv(start=0.01),
    rhol(start=670),
    rhov(start=78),
    Ns=2,
    Vf0=0.5,
    Cal_hcond=false) annotation (Placement(transformation(extent={{-20,-20},{40,40}}, rotation=0)));

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceWater(
    Q0=1,
    h0=1454400) annotation (Placement(transformation(extent={{-100,0},{-80,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceSteamBP(
    Q0=1,
    h0=2.8e6) annotation (Placement(transformation(extent={{-80,50},{-60,70}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceSteamGCT(
    Q0=1,
    h0=2.8e6) annotation (Placement(transformation(extent={{-110,50},{-90,70}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkWater(
    Q0=3) annotation (Placement(transformation(extent={{-90,-60},{-70,-40}}, rotation=0)));

  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource(
    T0={293.15, 293.15},
    option_temperature=2,
    W0={1e5, 1e5}) annotation (Placement(transformation(extent={{70,30},{90,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss waterInletClosure(K=0)
    annotation (Placement(transformation(extent={{-64,5},{-48,15}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss steamBPClosure(K=0)
    annotation (Placement(transformation(extent={{-48,55},{-32,65}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss steamGCTClosure(K=0)
    annotation (Placement(transformation(extent={{-82,41},{-66,51}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss liquidOutletClosure(K=0)
    annotation (Placement(transformation(extent={{2,-32},{18,-22}}, rotation=90)));
equation
  connect(sourceWater.C, waterInletClosure.C1) annotation (Line(points={{-80,10},{-64,10}}, color={0,0,0}));
  connect(waterInletClosure.C2, cavity.Ce) annotation (Line(points={{-48,10},{-26,10},{-26,25.8},{-12.971,25.8}}, color={0,0,0}));
  connect(sourceSteamBP.C, steamBPClosure.C1) annotation (Line(points={{-60,60},{-48,60}}, color={0,0,0}));
  connect(steamBPClosure.C2, cavity.CvBP) annotation (Line(points={{-32,60},{9.82857,60},{9.82857,32}}, color={0,0,0}));
  connect(sourceSteamGCT.C, steamGCTClosure.C1) annotation (Line(points={{-90,60},{-84,60},{-84,46},{-82,46}}, color={0,0,0}));
  connect(steamGCTClosure.C2, cavity.CvGCT) annotation (Line(points={{-66,46},{-2.857,46},{-2.857,32}}, color={0,0,0}));
  connect(cavity.Cl, liquidOutletClosure.C1) annotation (Line(points={{10,-12},{10,-22}}, color={0,0,0}));
  connect(liquidOutletClosure.C2, sinkWater.C) annotation (Line(points={{10,-32},{-94,-32},{-94,-50},{-90,-50}}, color={0,0,0}));
  connect(cavity.Cth3, heatSource.C) annotation (Line(points={{9.82857,21.2},{50,21.2},{50,30.2},{80,30.2}},
                                                                                                          color={255,0,0}));
  annotation (
    experiment(StopTime=1000),
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,80}})));
end TestTwoPhaseCavityOnePipeWaterSteam;
