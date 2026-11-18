within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestDynamicPlateHeatExchangerWWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.HeatExchangers.DynamicWaterWaterExchanger echangeurAPlaques1D1(N=5, Sc(Q(fixed=true, start=1036))) annotation (Placement(transformation(extent={{-14,6},{6,26}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP2(T0=340) annotation (Placement(transformation(extent={{-74,6},{-54,26}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP3 annotation (Placement(transformation(extent={{-54,-14},{-34,6}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP2(P0(fixed=false)=100000) annotation (Placement(transformation(extent={{46,6},{66,26}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP3 annotation (Placement(transformation(extent={{26,-14},{46,6}}, rotation=0)));
equation
  connect(sourceP2.C, echangeurAPlaques1D1.Ec) annotation (Line(points={{-54,16},{-14,16}}, color={0,0,255}));
  connect(sourceP3.C, echangeurAPlaques1D1.Ef) annotation (Line(points={{-34,-4},{-9,-4},{-9,10}}, color={0,0,255}));
  connect(echangeurAPlaques1D1.Sc, puitsP2.C) annotation (Line(points={{6,16},{46,16}}, color={0,0,255}));
  connect(echangeurAPlaques1D1.Sf, puitsP3.C) annotation (Line(points={{1,10},{0,10},{0,-4},{26,-4}}, color={0,0,255}));
  annotation (experiment(StopTime=1000), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestDynamicPlateHeatExchangerWWaterSteam;
