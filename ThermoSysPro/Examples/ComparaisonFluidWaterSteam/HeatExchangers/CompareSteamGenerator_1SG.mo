within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareSteamGenerator_1SG
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestSteamGenerator_1SG fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSteamGenerator_1SGWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamGenerator.fluidInlet.Q,fluid.steamGenerator.fluidOutletI.Q,fluid.steamGenerator.fluidInlet1.Q,fluid.steamGenerator.fluidOutletI1.Q};
  fluidP={fluid.steamGenerator.fluidInlet.P,fluid.steamGenerator.fluidOutletI.P,fluid.steamGenerator.fluidInlet1.P,fluid.steamGenerator.fluidOutletI1.P};
  fluidH={fluid.steamGenerator.fluidInlet.h,fluid.steamGenerator.fluidOutletI.h,fluid.steamGenerator.fluidInlet1.h,fluid.steamGenerator.fluidOutletI1.h};
  waterSteamQ={waterSteam.steamGenerator.fluidInlet.Q,waterSteam.steamGenerator.fluidOutletI.Q,waterSteam.steamGenerator.fluidInlet1.Q,waterSteam.steamGenerator.fluidOutletI1.Q};
  waterSteamP={waterSteam.steamGenerator.fluidInlet.P,waterSteam.steamGenerator.fluidOutletI.P,waterSteam.steamGenerator.fluidInlet1.P,waterSteam.steamGenerator.fluidOutletI1.P};
  waterSteamH={waterSteam.steamGenerator.fluidInlet.h_vol,waterSteam.steamGenerator.fluidOutletI.h_vol,waterSteam.steamGenerator.fluidInlet1.h_vol,waterSteam.steamGenerator.fluidOutletI1.h_vol};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareSteamGenerator_1SG;
