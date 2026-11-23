within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicCondenserWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicCondenser condenser(
    Ns=3,
    ntubest=1000,
    ntubesV=50,
    C1vap(P(start=66004)),
    C2vap(P(start=66004)),
    C1(P(start=66004)),
    C2ex(P(start=47631), h(start=370191)),
    DynamicCondenser(P(start=66004), Pfond(start=47631), hv(start=353999), hl(start=370191), Tp(start=357.683), Tp1(start={351.781,354.987,356.535}), CvBP(P(start=66004)), CvGCT(P(start=66004)), Cl(P(start=47631))),
    Wall_3(Tp2(start={351.781,354.987,356.535})),
    pipe_3(P(start={107635,105730,103825,101915,100000}), mu2(start=fill(9.14034e-4,4)), rho2(start=fill(997.34,4)), dynamic_mass_balance=false, inertia=false),
    sortieReelle(signal(start=-97.6173))) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ vaporSource(Q0=10, h0=2.7e6, C(P(start=66004))) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ extraVaporSource(Q0=1e-4, h0=2.7e6, C(P(start=66004))) annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ extraWaterSource(Q0=1e-4, h0=1e5, C(P(start=66004))) annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ condensateSink(Q0=10.0002, h0=1e5, C(P(start=47631), h(start=370191))) annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ coolingSource(Q0=100, h0=1e5) annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP coolingSink(P0=100000, h0=1e5, option_temperature=2) annotation (Placement(transformation(extent={{50,-20},{70,0}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss vaporLoss(K=0) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss extraVaporLoss(K=0) annotation (Placement(transformation(extent={{-42,40},{-22,60}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss extraWaterLoss(K=0) annotation (Placement(transformation(extent={{-42,20},{-22,40}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss condensateLoss(K=0) annotation (Placement(transformation(extent={{-10,-40},{10,-20}}, rotation=-90)));
equation
  connect(vaporSource.C, vaporLoss.C1) annotation (Line(points={{10,60},{-14,60},{-14,40},{-10,40}}, color={0,0,255}));
  connect(vaporLoss.C2, condenser.C1vap) annotation (Line(points={{10,40},{14,40},{14,20},{0,20},{0,10}}, color={0,0,255}));
  connect(extraVaporSource.C, extraVaporLoss.C1) annotation (Line(points={{-50,60},{-46,60},{-46,50},{-42,50}}, color={0,0,255}));
  connect(extraVaporLoss.C2, condenser.C2vap) annotation (Line(points={{-22,50},{-3.9,50},{-3.9,9.2}}, color={0,0,255}));
  connect(extraWaterSource.C, extraWaterLoss.C1) annotation (Line(points={{-50,30},{-42,30}}, color={0,0,255}));
  connect(extraWaterLoss.C2, condenser.C1) annotation (Line(points={{-22,30},{-8.1,30},{-8.1,7.5}}, color={0,0,255}));
  connect(condenser.C2ex, condensateLoss.C1) annotation (Line(points={{0,-10},{0,-20}}, color={0,0,255}));
  connect(condensateLoss.C2, condensateSink.C) annotation (Line(points={{0,-40},{0,-60},{-10,-60}}, color={0,0,255}));
  connect(coolingSource.C, condenser.Ce1) annotation (Line(points={{-50,-10},{-10,-10},{-10,-0.1}}, color={0,0,255}));
  connect(condenser.Ce2, coolingSink.C) annotation (Line(points={{9.9,-0.1},{30,-0.1},{30,-10},{50,-10}}, color={0,0,255}));
  annotation (experiment(StopTime=1), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestDynamicCondenserWaterSteam;
