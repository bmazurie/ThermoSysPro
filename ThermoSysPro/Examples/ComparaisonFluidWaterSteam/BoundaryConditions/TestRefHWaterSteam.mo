within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model TestRefHWaterSteam
  "WaterSteam equivalent of Fluid TestRefH"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP(P0=2000000) annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefQ refQ(Q0=110) annotation (Placement(transformation(extent={{92,-10},{112,10}})));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss annotation (Placement(transformation(extent={{126,-10},{146,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefH refH(h0=2600e3) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss volumeClosure(K=0)
    annotation (Placement(transformation(extent={{20,-50},{0,-30}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante enthalpy(k=2600e3) annotation (Placement(transformation(extent={{-58,38},{-38,58}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante pressure(k=2000000) annotation (Placement(transformation(extent={{-110,38},{-90,58}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante massFlow(k=110) annotation (Placement(transformation(extent={{2,38},{22,58}})));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerH loopBreakerH annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                                                                                                                                                             rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerQ loopBreakerQ annotation (Placement(transformation(extent={{18,-10},{38,10}},
                                                                                                                                                            rotation=0)));
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerP loopBreakerP annotation (Placement(transformation(extent={{46,-10},{66,10}},
                                                                                                                                                            rotation=0)));
equation
  connect(refP.C2, refH.C1) annotation (Line(points={{-70,0},{-40,0}}, color={0,0,0}));
  connect(refQ.C2, pipePressureLoss.C1) annotation (Line(points={{112,0},{126,0}},
                                             color={0,0,0}));
  connect(pipePressureLoss.C2, volumeClosure.C1)
    annotation (Line(points={{146,0},{150,0},{150,-40},{20,-40}}, color={0,0,0}));
  connect(volumeClosure.C2, refP.C1)
    annotation (Line(points={{0,-40},{-102,-40},{-102,0},{-90,0}}, color={0,0,0}));
  connect(enthalpy.y, refH.ISpecificEnthalpy) annotation (Line(points={{-37,48},{-30,48},{-30,11}}, color={0,0,255}));
  connect(pressure.y, refP.IPressure) annotation (Line(points={{-89,48},{-80,48},{-80,11}}, color={0,0,255}));
  connect(massFlow.y, refQ.IMassFlow) annotation (Line(points={{23,48},{102,48},{102,11}},
                                                       color={0,0,255}));
  connect(refH.C2, loopBreakerH.C1) annotation (Line(points={{-20,0},{-10,0}}, color={0,0,0}));
  connect(loopBreakerH.C2, loopBreakerQ.C1) annotation (Line(points={{10,0},{18,0}}, color={0,0,0}));
  connect(loopBreakerQ.C2, loopBreakerP.C1) annotation (Line(points={{38,0},{46,0}}, color={0,0,0}));
  connect(loopBreakerP.C2, refQ.C1) annotation (Line(points={{66,0},{92,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6), Documentation(info="
The Fluid bench uses VolumeA with a static energy balance and only one active
inlet/outlet pair. The legacy WaterSteam VolumeA is always dynamic. A zero-loss
WaterSteam singular pressure loss provides the equivalent algebraic Q/P/h
closure for this bench.
"));
end TestRefHWaterSteam;
