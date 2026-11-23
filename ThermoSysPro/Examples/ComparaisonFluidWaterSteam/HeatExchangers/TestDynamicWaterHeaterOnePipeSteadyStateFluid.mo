within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicWaterHeaterOnePipeSteadyStateFluid
  "Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicWaterHeaterOnePipe with a steam source and a drain sink in pressure, started from steady state"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  replaceable package Medium = ThermoSysPro.Properties.Media.WaterSteam;
  replaceable package Medium_Cooling = ThermoSysPro.Properties.Media.WaterSteam;

  ThermoSysPro.Fluid.HeatExchangers.DynamicWaterHeaterOnePipe waterHeater(
    redeclare package Medium = Medium,
    redeclare package Medium_Cooling = Medium_Cooling,
    dynamic_energy_balance=true,
    dynamic_mass_balance=true,
    steady_state=true,
    P0c=2200000,
    Vf0=0.43,
    inertia=false,
    WaterHeating(P(start=2200000)),
    pipe_3(P(start=fill(6.95e6, 22)), h(start=linspace(1e5, 9e5, 22))),
    volumeC(P(start=6900000)),
    volumeD(P(start=6900000))) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.Fluid.BoundaryConditions.SourceP steamSource(redeclare package Medium = Medium, P0=2200000, h0=2.7e6, option_temperature=false) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  ThermoSysPro.Fluid.BoundaryConditions.SourceQ extraSource(redeclare package Medium = Medium, Q0=1e-4, h0=1e5, option_temperature=false) annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  ThermoSysPro.Fluid.BoundaryConditions.SinkP condensateSink(redeclare package Medium = Medium, P0=2216000, h0=1e5, option_temperature=false) annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  ThermoSysPro.Fluid.PressureLosses.SingularPressureLoss steamLoss(redeclare package Medium = Medium, K=1) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  ThermoSysPro.Fluid.PressureLosses.SingularPressureLoss condensateLoss(redeclare package Medium = Medium, K=10) annotation (Placement(transformation(extent={{-10,-40},{10,-20}}, rotation=-90)));
  ThermoSysPro.Fluid.BoundaryConditions.SourceQ coolingSource(redeclare package Medium = Medium_Cooling, Q0=100, h0=1e5, option_temperature=false) annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));
  ThermoSysPro.Fluid.BoundaryConditions.SinkP coolingSink(redeclare package Medium = Medium_Cooling, P0=6900000, h0=1e5, option_temperature=false) annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
equation
  connect(steamSource.C, steamLoss.C1) annotation (Line(points={{10,60},{-14,60},{-14,40},{-10,40}}, color={0,0,255}));
  connect(steamLoss.C2, waterHeater.C1vap) annotation (Line(points={{10,40},{14,40},{14,20},{0,20},{0,10}}, color={0,0,255}));
  connect(extraSource.C, waterHeater.C1) annotation (Line(points={{-50,60},{-6.4,60},{-6.4,9.2}}, color={0,0,255}));
  connect(waterHeater.C2ex, condensateLoss.C1) annotation (Line(points={{0,-10},{0,-20}}, color={0,0,255}));
  connect(condensateLoss.C2, condensateSink.C) annotation (Line(points={{0,-40},{0,-60},{-10,-60}}, color={0,0,255}));
  connect(coolingSource.C, waterHeater.Ce1) annotation (Line(points={{-50,-40},{-30,-40},{-30,-4.5},{-10,-4.5}}, color={0,0,255}));
  connect(waterHeater.Ce2, coolingSink.C) annotation (Line(points={{-10,4.4},{-30,4.4},{-30,20},{-70,20}}, color={0,0,255}));
  annotation (experiment(StopTime=100, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="
Steady-state variant of `Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicWaterHeaterOnePipe`.
In the SimpleExample all the flow rates are imposed, which leaves the cavity mass undetermined in steady state.
Here the steam source imposes the pressure `P0c = 22 bar` and the drain is connected to a pressure sink, both through
singular pressure losses (`K = 1` on the steam side, `K = 10` on the drain side; a direct connection imposes an
algebraic constraint on the cavity states that Dymola cannot reduce): the steam flow rate results from the condensation and the liquid level from the drain sink pressure (`Pfond = P + rho*g*zl`).
"));
end TestDynamicWaterHeaterOnePipeSteadyStateFluid;
