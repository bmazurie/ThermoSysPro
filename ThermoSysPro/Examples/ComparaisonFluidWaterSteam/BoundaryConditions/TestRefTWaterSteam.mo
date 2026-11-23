within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model TestRefTWaterSteam
  "WaterSteam equivalent of Fluid TestRefT"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP annotation (Placement(transformation(extent={{-90,0},{-70,20}}, rotation=0)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=2e5) annotation (Placement(transformation(extent={{-100,60},{-80,80}}, rotation=0)));
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump pump annotation (Placement(transformation(extent={{-30,0},{-10,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerQ loopBreakerQ annotation (Placement(transformation(extent={{0,0},{20,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerH loopBreakerH annotation (Placement(transformation(extent={{30,0},{50,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefT refT annotation (Placement(transformation(extent={{-60,0},{-40,20}}, rotation=0)));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss volumeClosure(K=0)
    annotation (Placement(transformation(extent={{10,-30},{-10,-10}})));
equation
  connect(refP.C2, refT.C1) annotation (Line(points={{-70,10},{-60,10}}, color={0,0,255}));
  connect(refT.C2, pump.C1) annotation (Line(points={{-40,10},{-30,10}}, color={0,0,255}));
  connect(constante.y, refP.IPressure) annotation (Line(points={{-79,70},{-60,70},{-60,34},{-80,34},{-80,21}}));
  connect(pump.C2, loopBreakerQ.C1) annotation (Line(points={{-10,10},{0,10}}, color={0,0,255}));
  connect(loopBreakerQ.C2, loopBreakerH.C1) annotation (Line(points={{20,10},{30,10}}, color={0,0,255}));
  connect(volumeClosure.C2, refP.C1)
    annotation (Line(points={{-10,-20},{-100,-20},{-100,10},{-90,10}}, color={0,0,0}));
  connect(loopBreakerH.C2, volumeClosure.C1)
    annotation (Line(points={{50,10},{100,10},{100,-20},{10,-20}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6), Documentation(info="
The Fluid bench uses VolumeA with a static energy balance and only one active
inlet/outlet pair. The legacy WaterSteam VolumeA is always dynamic. A zero-loss
WaterSteam singular pressure loss provides the equivalent algebraic Q/P/h
closure for this bench.
"));
end TestRefTWaterSteam;
