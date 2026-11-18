within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Sensors;
model CompareSensors
  extends PartialComparison(nPorts=6);
  parameter Real volumeFlowAbsoluteTolerance(unit="m3/s")=1e-8;
  parameter Real temperatureAbsoluteTolerance(unit="K")=1e-4;
  ThermoSysPro.Fluid.Examples.SimpleExamples.Sensors.TestSensors fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSensorsWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.sensorP.C1.Q,fluid.sensorP.C2.Q,fluid.sensorQ.C2.Q,fluid.sensorQv.C2.Q,fluid.sensorH.C2.Q,fluid.sensorT.C2.Q};
  fluidP={fluid.sensorP.C1.P,fluid.sensorP.C2.P,fluid.sensorQ.C2.P,fluid.sensorQv.C2.P,fluid.sensorH.C2.P,fluid.sensorT.C2.P};
  fluidH={fluid.sensorP.C1.h,fluid.sensorP.C2.h,fluid.sensorQ.C2.h,fluid.sensorQv.C2.h,fluid.sensorH.C2.h,fluid.sensorT.C2.h};
  waterSteamQ={waterSteam.sensorP.C1.Q,waterSteam.sensorP.C2.Q,waterSteam.sensorQ.C2.Q,waterSteam.sensorQv.C2.Q,waterSteam.sensorH.C2.Q,waterSteam.sensorT.C2.Q};
  waterSteamP={waterSteam.sensorP.C1.P,waterSteam.sensorP.C2.P,waterSteam.sensorQ.C2.P,waterSteam.sensorQv.C2.P,waterSteam.sensorH.C2.P,waterSteam.sensorT.C2.P};
  waterSteamH={waterSteam.sensorP.C1.h,waterSteam.sensorP.C2.h,waterSteam.sensorQ.C2.h,waterSteam.sensorQv.C2.h,waterSteam.sensorH.C2.h,waterSteam.sensorT.C2.h};
  assert(ComparaisonFluidWaterSteam.isClose(fluid.sensorP.Measure.signal, waterSteam.sensorP.Measure.signal, relativeTolerance, pressureAbsoluteTolerance), "SensorP measurement mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.sensorQ.Measure.signal, waterSteam.sensorQ.Measure.signal, relativeTolerance, flowAbsoluteTolerance), "SensorQ measurement mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.sensorQv.Measure.signal, waterSteam.sensorQv.Measure.signal, relativeTolerance, volumeFlowAbsoluteTolerance), "SensorQv measurement mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.sensorH.Measure.signal, waterSteam.sensorH.Measure.signal, relativeTolerance, enthalpyAbsoluteTolerance), "SensorH measurement mismatch");
  assert(ComparaisonFluidWaterSteam.isClose(fluid.sensorT.Measure.signal, waterSteam.sensorT.Measure.signal, relativeTolerance, temperatureAbsoluteTolerance), "SensorT measurement mismatch");
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareSensors;
