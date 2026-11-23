within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.PressureLosses;
model TestDynamicReliefValveWaterSteam
  "WaterSteam equivalent of Fluid TestDynamicReliefValve"
  extends ThermoSysPro.UsersGuide.Icons.Example;
  ThermoSysPro.WaterSteam.PressureLosses.DynamicReliefValve dynamicReliefValve(
    vh(start=0.91), z(start=0.00389)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-40})));
equation
  connect(dynamicReliefValve.C2, sink.C) annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
  connect(dynamicReliefValve.C1, sourcePQ.C) annotation (Line(points={{0,-9.8},{0,-19.9},{5.55112e-16,-19.9},{5.55112e-16,-30}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end TestDynamicReliefValveWaterSteam;
