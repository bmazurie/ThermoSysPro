within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicTwoPhaseFlowPipe
  extends PartialComparison(nPorts=2, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicTwoPhaseFlowPipe fluid(
    dynamicTwoPhaseFlowPipe(dpfCorr(fixed=true) = 0.2396333653343408),
    sourceP(C(Q(fixed=false)))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicTwoPhaseFlowPipeWaterSteam waterSteam(
    dynamicTwoPhaseFlowPipe(dpfCorr(fixed=true) = 0.2396333653343408),
    sourceP(C(Q(fixed=false)))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicTwoPhaseFlowPipe.C1.Q,fluid.dynamicTwoPhaseFlowPipe.C2.Q};
  fluidP={fluid.dynamicTwoPhaseFlowPipe.C1.P,fluid.dynamicTwoPhaseFlowPipe.C2.P};
  fluidH={fluid.dynamicTwoPhaseFlowPipe.C1.h,fluid.dynamicTwoPhaseFlowPipe.C2.h};
  waterSteamQ={waterSteam.dynamicTwoPhaseFlowPipe.C1.Q,waterSteam.dynamicTwoPhaseFlowPipe.C2.Q};
  waterSteamP={waterSteam.dynamicTwoPhaseFlowPipe.C1.P,waterSteam.dynamicTwoPhaseFlowPipe.C2.P};
  waterSteamH={waterSteam.dynamicTwoPhaseFlowPipe.C1.h,waterSteam.dynamicTwoPhaseFlowPipe.C2.h};
  annotation (experiment(StopTime=1500, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Both pipes start from steady state (`steady_state=true`, default of both
components), as in the Fluid SimpleExample. The WaterSteam bench previously
started from a uniform enthalpy `h0 = 800 kJ/kg` (`steady_state=false`), which
led to a different flow rate (0.28 kg/s instead of 1 kg/s) and was not a
comparison of the same problem.

Both SimpleExamples calibrate the friction correction with
`dpfCorr(fixed=false) = 1` and `C(Q(fixed=true))` on the source. Dymola uses the
binding of a `fixed=false` parameter as a start value only, OpenModelica uses it
as an equation and the initialisation becomes over-determined. Both instances
therefore use the value calibrated by Dymola, `dpfCorr = 0.2396333653343408`
(`fixed=true`), with a free source flow rate, which gives the same operating
point with both tools.
"));
end CompareDynamicTwoPhaseFlowPipe;
