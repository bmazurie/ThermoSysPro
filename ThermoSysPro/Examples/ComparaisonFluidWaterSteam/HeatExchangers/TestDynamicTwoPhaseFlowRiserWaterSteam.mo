within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicTwoPhaseFlowRiserWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicTwoPhaseFlowRiser dynamicTwoPhaseFlowRiser(L=10, D=0.03, inertia=false, Ns=1, steady_state=false, option_temperature=2, h0={800e3}) annotation (Placement(transformation(extent={{-40,-48},{40,10}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(C(Q(start=1)), option_temperature=2, h0=800e3, P0=2000000) annotation (Placement(transformation(extent={{-90,-28},{-70,-8}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP(option_temperature=2, h0=2000e3, P0=19.9e5) annotation (Placement(transformation(extent={{70,-28},{90,-8}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource1(option_temperature=2, T0={1000}, W0={2e4}) annotation (Placement(transformation(extent={{-10,31},{10,51}}, rotation=0)));
  ThermoSysPro.Thermal.BoundaryConditions.HeatSource heatSource2(option_temperature=2, T0={1000}, W0={2e4}) annotation (Placement(transformation(extent={{-10,-70},{10,-50}}, rotation=0)));
equation
  connect(sourceP.C, dynamicTwoPhaseFlowRiser.C1) annotation (Line(points={{-70,-18},{-42,-18},{-42,-19},{-40,-19}}, color={0,0,255}));
  connect(dynamicTwoPhaseFlowRiser.C2, sinkP.C) annotation (Line(points={{40,-19},{70,-18}}, color={0,0,255}));
  connect(heatSource1.C, dynamicTwoPhaseFlowRiser.CTh1) annotation (Line(points={{0,31.2},{0,-7.7}}, color={191,95,0}));
  connect(heatSource2.C, dynamicTwoPhaseFlowRiser.CTh2) annotation (Line(points={{0,-50},{0,-33.5}}, color={191,95,0}));
  annotation (experiment(StopTime=1000), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestDynamicTwoPhaseFlowRiserWaterSteam;
