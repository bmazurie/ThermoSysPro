within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicTwoPhaseFlowPipe
  extends PartialComparison(nPorts=2, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicTwoPhaseFlowPipe fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicTwoPhaseFlowPipeWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicTwoPhaseFlowPipe.C1.Q,fluid.dynamicTwoPhaseFlowPipe.C2.Q};
  fluidP={fluid.dynamicTwoPhaseFlowPipe.C1.P,fluid.dynamicTwoPhaseFlowPipe.C2.P};
  fluidH={fluid.dynamicTwoPhaseFlowPipe.C1.h,fluid.dynamicTwoPhaseFlowPipe.C2.h};
  waterSteamQ={waterSteam.dynamicTwoPhaseFlowPipe.C1.Q,waterSteam.dynamicTwoPhaseFlowPipe.C2.Q};
  waterSteamP={waterSteam.dynamicTwoPhaseFlowPipe.C1.P,waterSteam.dynamicTwoPhaseFlowPipe.C2.P};
  waterSteamH={waterSteam.dynamicTwoPhaseFlowPipe.C1.h,waterSteam.dynamicTwoPhaseFlowPipe.C2.h};
  annotation (experiment(StopTime=1500, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicTwoPhaseFlowPipe;
