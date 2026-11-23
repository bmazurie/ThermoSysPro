within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Sensors;
model TestSensorsWaterSteam
  extends ThermoSysPro.UsersGuide.Icons.Example;

  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink
    annotation (Placement(transformation(extent={{86,-10},{106,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ sourcePQ
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}})));
  ThermoSysPro.WaterSteam.Sensors.SensorP sensorP
    annotation (Placement(transformation(extent={{-82,-2},{-62,18}})));
  ThermoSysPro.WaterSteam.Sensors.SensorQ sensorQ
    annotation (Placement(transformation(extent={{-58,-2},{-38,18}})));
  ThermoSysPro.WaterSteam.Sensors.SensorQv sensorQv
    annotation (Placement(transformation(extent={{-34,-2},{-14,18}})));
  ThermoSysPro.WaterSteam.Sensors.SensorH sensorH
    annotation (Placement(transformation(extent={{-10,-2},{10,18}})));
  ThermoSysPro.WaterSteam.Sensors.SensorT sensorT
    annotation (Placement(transformation(extent={{14,-2},{34,18}})));
equation
  connect(sensorP.C1, sourcePQ.C) annotation (Line(points={{-82,0},{-86,0}}, color={0,0,0}));
  connect(sensorP.C2, sensorQ.C1) annotation (Line(points={{-61.8,0},{-58,0}}, color={0,0,0}));
  connect(sensorQ.C2, sensorQv.C1) annotation (Line(points={{-37.8,0},{-34,0}}, color={0,0,0}));
  connect(sensorQv.C2, sensorH.C1) annotation (Line(points={{-13.8,0},{-10,0}}, color={0,0,0}));
  connect(sensorH.C2, sensorT.C1) annotation (Line(points={{10.2,0},{14,0}}, color={0,0,0}));
  connect(sensorT.C2, sink.C) annotation (Line(points={{34.2,0},{86,0}}, color={0,0,0}));
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="SensorSubC and SensorX are omitted because the legacy WaterSteam architecture has no corresponding trace or composition sensors."));
end TestSensorsWaterSteam;
