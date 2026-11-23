within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Boilers;
model TestFossilFuelBoilerWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.MultiFluids.Boilers.FossilFuelBoiler fossilFuelBoiler(Wloss=0, Ke=1.e6, Tsf=386.16, mode=0, Tea(start=298.16), Tf(start=2138.32), deltaPe(start=4028755.6), rhof(start=0.2733)) annotation (Placement(transformation(extent={{-45,-51},{45,51}})));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ fuelSourcePQ(Xashes=0.011, rho=1000, Hum=0.50, Xc=0.2479, Xh=0.0297, Xo=0.2088, Xn=0.0017, Xs=0.0003, LHV=1.5e7, Q0=0.0407331, T0=294.45) annotation (Placement(transformation(extent={{-36,-78},{0,-41}})));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ sourceFlueGases(Q0=27, T0=298.16, Xco2=0, Xh2o=0.01, Xo2=0.233, Xso2=0) annotation (Placement(transformation(extent={{-110,-50},{-71,-13}})));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGases(P0=100000) annotation (Placement(transformation(extent={{68,-51},{110,-12}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourceWaterSteam(P0=140e5, Q0=24, h0=600e3) annotation (Placement(transformation(extent={{-107,14},{-71,48}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkWaterSteam annotation (Placement(transformation(extent={{74,13},{110,49}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss inletPressureLoss(K=1e-3, rho(start=932.96)) annotation (Placement(transformation(extent={{-64,25},{-56,37}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss outletPressureLoss(K=1e-3, rho(start=29.77)) annotation (Placement(transformation(extent={{57,25},{65,37}})));
equation
  connect(sourceFlueGases.C, fossilFuelBoiler.Cair) annotation (Line(points={{-71,-31.5},{-63.5,-31.5},{-63.5,-31.62},{-45,-31.62}}, color={0,0,0}, thickness=1));
  connect(fossilFuelBoiler.Cfg, sinkFlueGases.C) annotation (Line(points={{45,-31.62},{62,-31.62},{62,-31.5},{68,-31.5}}, color={0,0,0}, thickness=1));
  connect(fuelSourcePQ.C, fossilFuelBoiler.Cfuel) annotation (Line(points={{0,-59.5},{0,-40.8}}, color={0,0,0}));
  connect(sourceWaterSteam.C, inletPressureLoss.C1) annotation (Line(points={{-71,31},{-64,31}}, color={0,0,255}));
  connect(inletPressureLoss.C2, fossilFuelBoiler.Cws1) annotation (Line(points={{-56,31},{-50,31},{-50,30.6},{-45,30.6}}, color={0,0,255}));
  connect(fossilFuelBoiler.Cws2, outletPressureLoss.C1) annotation (Line(points={{45,30.6},{51,30.6},{51,31},{57,31}}, color={0,0,255}));
  connect(outletPressureLoss.C2, sinkWaterSteam.C) annotation (Line(points={{65,31},{74,31}}, color={0,0,255}));
  annotation (experiment(StopTime=1), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestFossilFuelBoilerWaterSteam;
