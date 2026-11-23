within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareSteamGenerator_1SG
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestSteamGenerator_1SG fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  ThermoSysPro.Examples.SimpleExamples.TestSteamGenerator_1SG waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamGenerator.fluidInlet.Q,fluid.steamGenerator.fluidOutletI.Q,fluid.steamGenerator.fluidInlet1.Q,fluid.steamGenerator.fluidOutletI1.Q};
  fluidP={fluid.steamGenerator.fluidInlet.P,fluid.steamGenerator.fluidOutletI.P,fluid.steamGenerator.fluidInlet1.P,fluid.steamGenerator.fluidOutletI1.P};
  fluidH={fluid.steamGenerator.fluidInlet.h,fluid.steamGenerator.fluidOutletI.h,fluid.steamGenerator.fluidInlet1.h,fluid.steamGenerator.fluidOutletI1.h};
  waterSteamQ={waterSteam.steamGenerator.fluidInlet.Q,waterSteam.steamGenerator.fluidOutletI.Q,waterSteam.steamGenerator.fluidInlet1.Q,waterSteam.steamGenerator.fluidOutletI1.Q};
  waterSteamP={waterSteam.steamGenerator.fluidInlet.P,waterSteam.steamGenerator.fluidOutletI.P,waterSteam.steamGenerator.fluidInlet1.P,waterSteam.steamGenerator.fluidOutletI1.P};
  waterSteamH={waterSteam.steamGenerator.fluidInlet.h,waterSteam.steamGenerator.fluidOutletI.h,waterSteam.steamGenerator.fluidInlet1.h,waterSteam.steamGenerator.fluidOutletI1.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Compares `Fluid.Examples.SimpleExamples.HeatExchangers.TestSteamGenerator_1SG` with the WaterSteam example
`Examples.SimpleExamples.TestSteamGenerator_1SG`. Since the port of #154 to `Fluid.HeatExchangers.SteamGenerator_1SG`, both examples
have the same component structure, parameters, boundary conditions and inverse problem (drum level imposed at 1 m, steam line
pressure loss coefficient computed), so they are compared directly, without a dedicated WaterSteam bench.

The only difference is the mass balance of `steamGenerator.volumeA`, static in the Fluid example (dynamic in the component): at steady
state both settings give the same equations, and the Fluid setting lets OpenModelica solve the initialisation without purge flow.
"));
end CompareSteamGenerator_1SG;
