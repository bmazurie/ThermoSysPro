within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicOnePhaseFlowPipe
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicOnePhaseFlowPipe fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicOnePhaseFlowPipeWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicOnePhaseFlowPipe.C1.Q,fluid.dynamicOnePhaseFlowPipe.C2.Q};
  fluidP={fluid.dynamicOnePhaseFlowPipe.C1.P,fluid.dynamicOnePhaseFlowPipe.C2.P};
  fluidH={fluid.dynamicOnePhaseFlowPipe.C1.h,fluid.dynamicOnePhaseFlowPipe.C2.h};
  waterSteamQ={waterSteam.dynamicOnePhaseFlowPipe.C1.Q,waterSteam.dynamicOnePhaseFlowPipe.C2.Q};
  waterSteamP={waterSteam.dynamicOnePhaseFlowPipe.C1.P,waterSteam.dynamicOnePhaseFlowPipe.C2.P};
  waterSteamH={waterSteam.dynamicOnePhaseFlowPipe.C1.h,waterSteam.dynamicOnePhaseFlowPipe.C2.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicOnePhaseFlowPipe;
