within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.LoopBreakers;
model CompareLoopBreakerQH
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.LoopBreakers.TestLoopBreakerQH fluid
    annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestLoopBreakerQHWaterSteam waterSteam
    annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.loopBreakerQ.C1.Q,fluid.loopBreakerQ.C2.Q,fluid.loopBreakerH.C1.Q,fluid.loopBreakerH.C2.Q};
  fluidP={fluid.loopBreakerQ.C1.P,fluid.loopBreakerQ.C2.P,fluid.loopBreakerH.C1.P,fluid.loopBreakerH.C2.P};
  fluidH={fluid.loopBreakerQ.C1.h,fluid.loopBreakerQ.C2.h,fluid.loopBreakerH.C1.h,fluid.loopBreakerH.C2.h};
  waterSteamQ={waterSteam.loopBreakerQ.C1.Q,waterSteam.loopBreakerQ.C2.Q,waterSteam.loopBreakerH.C1.Q,waterSteam.loopBreakerH.C2.Q};
  waterSteamP={waterSteam.loopBreakerQ.C1.P,waterSteam.loopBreakerQ.C2.P,waterSteam.loopBreakerH.C1.P,waterSteam.loopBreakerH.C2.P};
  waterSteamH={waterSteam.loopBreakerQ.C1.h,waterSteam.loopBreakerQ.C2.h,waterSteam.loopBreakerH.C1.h,waterSteam.loopBreakerH.C2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareLoopBreakerQH;
