within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Machines;
model CompareStodolaTurbine
  extends PartialComparison(nPorts=2);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Machines.TestStodolaTurbine fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStodolaTurbineWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.stodolaTurbine.Ce.Q,fluid.stodolaTurbine.Cs.Q};
  fluidP={fluid.stodolaTurbine.Ce.P,fluid.stodolaTurbine.Cs.P};
  fluidH={fluid.stodolaTurbine.Ce.h,fluid.stodolaTurbine.Cs.h};
  waterSteamQ={waterSteam.stodolaTurbine.Ce.Q,waterSteam.stodolaTurbine.Cs.Q};
  waterSteamP={waterSteam.stodolaTurbine.Ce.P,waterSteam.stodolaTurbine.Cs.P};
  waterSteamH={waterSteam.stodolaTurbine.Ce.h,waterSteam.stodolaTurbine.Cs.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareStodolaTurbine;
