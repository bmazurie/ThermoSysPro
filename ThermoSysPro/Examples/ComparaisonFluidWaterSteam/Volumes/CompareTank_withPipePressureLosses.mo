within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Volumes;
model CompareTank_withPipePressureLosses
  extends PartialComparison(nPorts=3, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Volumes.TestTank_withPipePressureLosses fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestTank_withPipePressureLossesWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.Tank1.Ce1.Q,fluid.Tank1.Cs1.Q,fluid.Tank1.Cs2.Q};
  fluidP={fluid.Tank1.Ce1.P,fluid.Tank1.Cs1.P,fluid.Tank1.Cs2.P};
  fluidH={fluid.Tank1.Ce1.h,fluid.Tank1.Cs1.h,fluid.Tank1.Cs2.h};
  waterSteamQ={waterSteam.Tank1.Ce1.Q,waterSteam.Tank1.Cs1.Q,waterSteam.Tank1.Cs2.Q};
  waterSteamP={waterSteam.Tank1.Ce1.P,waterSteam.Tank1.Cs1.P,waterSteam.Tank1.Cs2.P};
  waterSteamH={waterSteam.Tank1.Ce1.h,waterSteam.Tank1.Cs1.h,waterSteam.Tank1.Cs2.h};
  annotation (experiment(StopTime=20, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareTank_withPipePressureLosses;
