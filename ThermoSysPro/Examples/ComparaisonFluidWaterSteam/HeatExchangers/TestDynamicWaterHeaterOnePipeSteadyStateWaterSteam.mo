within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicWaterHeaterOnePipeSteadyStateWaterSteam
  "WaterSteam counterpart of TestDynamicWaterHeaterOnePipeSteadyStateFluid"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterHeatingOnePipe waterHeater(
    P0c=2200000,
    Vf0=0.43,
    WaterHeating(steady_state=true, P(start=2200000)),
    pipe_3(inertia=false, P(start=fill(6.95e6, 22)), h(start=linspace(1e5, 9e5, 22)))) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP steamSource(P0=2200000, h0=2.7e6, option_temperature=2) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ extraSource(Q0=1e-4, h0=1e5) annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP condensateSink(P0=2216000, h0=1e5, option_temperature=2) annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ coolingSource(Q0=100, h0=1e5) annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP coolingSink(P0=6900000, h0=1e5, option_temperature=2) annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss steamLoss(K=1) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss extraLoss(K=0) annotation (Placement(transformation(extent={{-42,40},{-22,60}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss condensateLoss(K=10) annotation (Placement(transformation(extent={{-10,-40},{10,-20}}, rotation=-90)));
equation
  connect(steamSource.C, steamLoss.C1) annotation (Line(points={{10,60},{-14,60},{-14,40},{-10,40}}, color={0,0,255}));
  connect(steamLoss.C2, waterHeater.C1vap) annotation (Line(points={{10,40},{14,40},{14,20},{0,20},{0,10}}, color={0,0,255}));
  connect(extraSource.C, extraLoss.C1) annotation (Line(points={{-50,60},{-46,60},{-46,50},{-42,50}}, color={0,0,255}));
  connect(extraLoss.C2, waterHeater.C1) annotation (Line(points={{-22,50},{-6.4,50},{-6.4,9.2}}, color={0,0,255}));
  connect(waterHeater.C2ex, condensateLoss.C1) annotation (Line(points={{0,-10},{0,-20}}, color={0,0,255}));
  connect(condensateLoss.C2, condensateSink.C) annotation (Line(points={{0,-40},{0,-60},{-10,-60}}, color={0,0,255}));
  connect(coolingSource.C, waterHeater.Ce1) annotation (Line(points={{-50,-40},{-30,-40},{-30,-4.5},{-10,-4.5}}, color={0,0,255}));
  connect(waterHeater.Ce2, coolingSink.C) annotation (Line(points={{-10,4.4},{-30,4.4},{-30,20},{-70,20}}, color={0,0,255}));
  annotation (experiment(StopTime=100, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestDynamicWaterHeaterOnePipeSteadyStateWaterSteam;
