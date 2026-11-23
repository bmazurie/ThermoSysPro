within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model TestTwoPhaseVolumeWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.Volumes.TwoPhaseVolume volume(
    steady_state=false,
    P0=13000000,
    P(start=13000000, fixed=true),
    hl(start=1454400),
    hv(start=2.658e6),
    xv(start=0.01),
    rhol(start=670),
    rhov(start=78),
    V=80,
    A=20,
    Vf0=0.5)  annotation (Placement(transformation(extent={{-20,-20},{40,40}}, rotation=0)));

  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sinkQ( Q0=1)
                                                                                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-40})));
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss liquidClosure(K=0)
    annotation (Placement(transformation(extent={{2,-32},{18,-22}}, rotation=90)));
equation
  connect(volume.Cl, liquidClosure.C1) annotation (Line(points={{10,-20},{10,-22}}, color={0,0,0}));
  connect(liquidClosure.C2, sinkQ.C) annotation (Line(points={{10,-32},{10,-40},{20,-40}}, color={0,0,0}));
  annotation (
    experiment(StopTime=1000),
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,80}})));
end TestTwoPhaseVolumeWaterSteam;
