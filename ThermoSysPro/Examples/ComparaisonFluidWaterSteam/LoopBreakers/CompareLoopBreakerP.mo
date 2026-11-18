within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.LoopBreakers;
model CompareLoopBreakerP
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.LoopBreakers.TestLoopBreakerP fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestLoopBreakerPWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.loopBreakerP.C1.Q,fluid.loopBreakerP.C2.Q};
  fluidP={fluid.loopBreakerP.C1.P,fluid.loopBreakerP.C2.P};
  fluidH={fluid.loopBreakerP.C1.h,fluid.loopBreakerP.C2.h};
  waterSteamQ={waterSteam.loopBreakerP.C1.Q,waterSteam.loopBreakerP.C2.Q};
  waterSteamP={waterSteam.loopBreakerP.C1.P,waterSteam.loopBreakerP.C2.P};
  waterSteamH={waterSteam.loopBreakerP.C1.h,waterSteam.loopBreakerP.C2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareLoopBreakerP;
