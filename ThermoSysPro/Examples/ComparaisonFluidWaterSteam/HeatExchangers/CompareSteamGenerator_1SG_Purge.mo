within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareSteamGenerator_1SG_Purge
  extends PartialComparison(nPorts=5);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestSteamGenerator_1SG_Purge fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  ThermoSysPro.Examples.SimpleExamples.TestSteamGenerator_1SG_Purge waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamGenerator.fluidInlet.Q,fluid.steamGenerator.fluidOutletI.Q,fluid.steamGenerator.fluidInlet1.Q,fluid.steamGenerator.fluidOutletI1.Q,fluid.steamGenerator.fluidOutletI_purge.Q};
  fluidP={fluid.steamGenerator.fluidInlet.P,fluid.steamGenerator.fluidOutletI.P,fluid.steamGenerator.fluidInlet1.P,fluid.steamGenerator.fluidOutletI1.P,fluid.steamGenerator.fluidOutletI_purge.P};
  fluidH={fluid.steamGenerator.fluidInlet.h,fluid.steamGenerator.fluidOutletI.h,fluid.steamGenerator.fluidInlet1.h,fluid.steamGenerator.fluidOutletI1.h,fluid.steamGenerator.fluidOutletI_purge.h};
  waterSteamQ={waterSteam.steamGenerator.fluidInlet.Q,waterSteam.steamGenerator.fluidOutletI.Q,waterSteam.steamGenerator.fluidInlet1.Q,waterSteam.steamGenerator.fluidOutletI1.Q,waterSteam.steamGenerator.fluidOutletI_purge.Q};
  waterSteamP={waterSteam.steamGenerator.fluidInlet.P,waterSteam.steamGenerator.fluidOutletI.P,waterSteam.steamGenerator.fluidInlet1.P,waterSteam.steamGenerator.fluidOutletI1.P,waterSteam.steamGenerator.fluidOutletI_purge.P};
  waterSteamH={waterSteam.steamGenerator.fluidInlet.h,waterSteam.steamGenerator.fluidOutletI.h,waterSteam.steamGenerator.fluidInlet1.h,waterSteam.steamGenerator.fluidOutletI1.h,waterSteam.steamGenerator.fluidOutletI_purge.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Compares `Fluid.Examples.SimpleExamples.HeatExchangers.TestSteamGenerator_1SG_Purge` with the WaterSteam example
`Examples.SimpleExamples.TestSteamGenerator_1SG_Purge` (5.55 kg/s purge), including the purge outlet. Both examples have the same
component structure, parameters, boundary conditions and inverse problem, and the same dynamic mass balance of
`steamGenerator.volumeA`.
"));
end CompareSteamGenerator_1SG_Purge;
