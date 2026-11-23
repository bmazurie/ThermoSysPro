within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Boilers;
model TestBoilerSystemWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.MultiFluids.Boilers.FossilFuelBoiler boilerSystem(Wloss=0, Ke=1.e6, Tsf=386.16, mode=0) annotation (Placement(transformation(extent={{-28,-40},{28,40}})));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ fuelSourcePQ(Xashes=0.011, rho=1000, Hum=0.50, Xc=0.2479, Xh=0.0297, Xo=0.2088, Xn=0.0017, Xs=0.0003, LHV=1.5e7, Q0=0.0407331, T0=294.45) annotation (Placement(transformation(extent={{-18,-76},{18,-40}})));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ sourceFlueGases(Q0=27, T0=298.16, Xco2=0, Xh2o=0.01, Xo2=0.233, Xso2=0) annotation (Placement(transformation(extent={{-84,-58},{-48,-22}})));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkFlueGases(P0=100000) annotation (Placement(transformation(extent={{-34,74},{2,110}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourceWaterSteam(P0=140e5, Q0=24, h0=600e3) annotation (Placement(transformation(extent={{42,-64},{78,-28}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sinkWaterSteam annotation (Placement(transformation(extent={{36,80},{72,116}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss inletPressureLoss(K=1e-3, rho(start=932.96)) annotation (Placement(transformation(extent={{20,-60},{28,-52}}, rotation=90)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss outletPressureLoss(K=1e-3, rho(start=29.77)) annotation (Placement(transformation(extent={{46,48},{54,56}}, rotation=90)));
equation
  connect(sourceFlueGases.C, boilerSystem.Cair) annotation (Line(points={{-48,-40},{-28,-40},{-28,-24.8}}, color={0,0,0}));
  connect(boilerSystem.Cfg, sinkFlueGases.C) annotation (Line(points={{28,-24.8},{34,-24.8},{34,92},{-34,92}}, color={0,0,0}));
  connect(fuelSourcePQ.C, boilerSystem.Cfuel) annotation (Line(points={{18,-58},{0,-58},{0,-32}}, color={0,0,0}));
  connect(sourceWaterSteam.C, inletPressureLoss.C1) annotation (Line(points={{78,-46},{24,-46},{24,-60}}, color={0,0,255}));
  connect(inletPressureLoss.C2, boilerSystem.Cws1) annotation (Line(points={{24,-52},{24,24.8},{-28,24.8}}, color={0,0,255}));
  connect(boilerSystem.Cws2, outletPressureLoss.C1) annotation (Line(points={{28,24.8},{50,24.8},{50,48}}, color={0,0,255}));
  connect(outletPressureLoss.C2, sinkWaterSteam.C) annotation (Line(points={{50,56},{50,98},{36,98}}, color={0,0,255}));
  annotation (experiment(StopTime=1), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestBoilerSystemWaterSteam;
