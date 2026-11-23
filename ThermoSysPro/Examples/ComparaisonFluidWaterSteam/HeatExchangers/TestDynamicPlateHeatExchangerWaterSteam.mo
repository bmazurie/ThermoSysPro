within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicPlateHeatExchangerWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterWaterExchanger dynamicPlateHeatExchanger(
    N=5,
    Sp=2,
    steady_state=true,
    heat_exchange_correlation=0,
    pressure_loss_correlation=0,
    p_Kc=1e-4,
    p_Kf=1e-4,
    Ec(P(start=300000), Q(start=1036), h(start=280050)),
    Sc(P(start=100000), h(start=275103)),
    Ef(P(start=300000), h(start=280104)),
    Sf(P(start=100000), h(start=280076))) annotation (Placement(transformation(extent={{-10,30},{10,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourcePc(P0=300000, option_temperature=2, h0=280050) annotation (Placement(transformation(extent={{-70,30},{-50,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourcePf(P0=300000, option_temperature=2, h0=280104) annotation (Placement(transformation(extent={{-50,10},{-30,30}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkPc(Q0=1036, h0=275103) annotation (Placement(transformation(extent={{50,30},{70,50}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkPf(P0=100000, option_temperature=2, h0=280076) annotation (Placement(transformation(extent={{30,10},{50,30}}, rotation=0)));
equation
  connect(sourcePc.C, dynamicPlateHeatExchanger.Ec) annotation (Line(points={{-50,40},{-10,40}}, color={0,0,255}));
  connect(sourcePf.C, dynamicPlateHeatExchanger.Ef) annotation (Line(points={{-30,20},{-5,20},{-5,34}}, color={0,0,255}));
  connect(dynamicPlateHeatExchanger.Sc, sinkPc.C) annotation (Line(points={{10,40},{50,40}}, color={0,0,255}));
  connect(dynamicPlateHeatExchanger.Sf, sinkPf.C) annotation (Line(points={{5,34},{4,34},{4,20},{30,20}}, color={0,0,255}));
  annotation (experiment(StopTime=1000), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestDynamicPlateHeatExchangerWaterSteam;
