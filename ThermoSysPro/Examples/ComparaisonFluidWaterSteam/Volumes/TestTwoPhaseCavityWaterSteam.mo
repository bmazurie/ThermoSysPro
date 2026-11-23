within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model TestTwoPhaseCavityWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;


  ThermoSysPro.WaterSteam.Volumes.TwoPhaseCavity cavity(
    steady_state=false,
    P0=13000000,
    P(start=13000000, fixed=true),
    hl(start=1454400),
    hv(start=2.658e6),
    xv(start=0.01),
    rhol(start=670),
    rhov(start=78),
    Ns=1,
    Vf0=0.5,
    Cal_hconv=false) annotation (Placement(transformation(extent={{-20,-20},{40,40}}, rotation=0)));

  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceWater(
    Q0=1,
    h0=1454400) annotation (Placement(transformation(extent={{-90,20},{-70,40}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceSteam(
    Q0=1,
    h0=2.8e6) annotation (Placement(transformation(extent={{-60,50},{-40,70}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkWater(
    Q0=2) annotation (Placement(transformation(extent={{-90,-60},{-70,-40}}, rotation=0)));

  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(
    option_temperature=2,
    W0={1e5}) annotation (Placement(transformation(extent={{60,-70},{80,-50}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(
    option_temperature=2,
    W0={1e5}) annotation (Placement(transformation(extent={{70,0},{90,20}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource3a(
    T0={293.15,293.15},
    option_temperature=2,
    W0={1e5,1e5})
              annotation (Placement(transformation(extent={{70,50},{90,70}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss waterInletClosure(K=0)
    annotation (Placement(transformation(extent={{-58,25},{-42,35}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss steamInletClosure(K=0)
    annotation (Placement(transformation(extent={{-30,55},{-14,65}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss liquidOutletClosure(K=0)
    annotation (Placement(transformation(extent={{2,-34},{18,-24}}, rotation=90)));
equation
  cavity.Cth3[3:2*cavity.Ns].W = fill(0, 2*cavity.Ns - 2);
  connect(sourceWater.C, waterInletClosure.C1) annotation (Line(points={{-70,30},{-58,30}}, color={0,0,0}));
  connect(waterInletClosure.C2, cavity.Ce) annotation (Line(points={{-42,30},{-40,30},{-40,32},{-1.66667,32}}, color={0,0,0}));
  connect(sourceSteam.C, steamInletClosure.C1) annotation (Line(points={{-40,60},{-30,60}}, color={0,0,0}));
  connect(steamInletClosure.C2, cavity.Cv) annotation (Line(points={{-14,60},{10.3333,60},{10.3333,32}}, color={0,0,0}));
  connect(cavity.Cl, liquidOutletClosure.C1) annotation (Line(points={{10.3333,-12},{10.3333,-24}}, color={0,0,0}));
  connect(liquidOutletClosure.C2, sinkWater.C) annotation (Line(points={{10.3333,-34},{10.3333,-50},{-90,-50}}, color={0,0,0}));
  connect(heatSource1.C, cavity.Cth1) annotation (Line(points={{70,-69.8},{20,-69.8},{20,-5.3},{10.1667,-5.3}},color={255,0,0}));
  connect(heatSource2.C, cavity.Cth2) annotation (Line(points={{80,0.2},{42,0.2},{42,25.1},{10.1667,25.1}},
                                                                                                         color={255,0,0}));
  connect(cavity.Cth3, heatSource3a.C) annotation (Line(points={{10.1667,10.6},{58,10.6},{58,50.2},{80,50.2}}, color={255,0,0}));
  annotation (
    experiment(StopTime=1000),
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,80}})));
end TestTwoPhaseCavityWaterSteam;
