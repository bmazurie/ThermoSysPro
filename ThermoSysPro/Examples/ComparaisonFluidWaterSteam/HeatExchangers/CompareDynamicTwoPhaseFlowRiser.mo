within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicTwoPhaseFlowRiser
  extends PartialComparison(nPorts=2, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicTwoPhaseFlowRiser fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicTwoPhaseFlowRiserWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicTwoPhaseFlowRiser.C1.Q,fluid.dynamicTwoPhaseFlowRiser.C2.Q};
  fluidP={fluid.dynamicTwoPhaseFlowRiser.C1.P,fluid.dynamicTwoPhaseFlowRiser.C2.P};
  fluidH={fluid.dynamicTwoPhaseFlowRiser.C1.h,fluid.dynamicTwoPhaseFlowRiser.C2.h};
  waterSteamQ={waterSteam.dynamicTwoPhaseFlowRiser.C1.Q,waterSteam.dynamicTwoPhaseFlowRiser.C2.Q};
  waterSteamP={waterSteam.dynamicTwoPhaseFlowRiser.C1.P,waterSteam.dynamicTwoPhaseFlowRiser.C2.P};
  waterSteamH={waterSteam.dynamicTwoPhaseFlowRiser.C1.h,waterSteam.dynamicTwoPhaseFlowRiser.C2.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicTwoPhaseFlowRiser;
