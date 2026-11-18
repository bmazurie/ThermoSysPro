within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicOnePhaseFlowShell
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicOnePhaseFlowShell fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicOnePhaseFlowShellWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicOnePhaseFlowShell.C1.Q,fluid.dynamicOnePhaseFlowShell.C2.Q};
  fluidP={fluid.dynamicOnePhaseFlowShell.C1.P,fluid.dynamicOnePhaseFlowShell.C2.P};
  fluidH={fluid.dynamicOnePhaseFlowShell.C1.h,fluid.dynamicOnePhaseFlowShell.C2.h};
  waterSteamQ={waterSteam.dynamicOnePhaseFlowShell.C1.Q,waterSteam.dynamicOnePhaseFlowShell.C2.Q};
  waterSteamP={waterSteam.dynamicOnePhaseFlowShell.C1.P,waterSteam.dynamicOnePhaseFlowShell.C2.P};
  waterSteamH={waterSteam.dynamicOnePhaseFlowShell.C1.h,waterSteam.dynamicOnePhaseFlowShell.C2.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicOnePhaseFlowShell;
