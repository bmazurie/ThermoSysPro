within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Boilers;
model CompareBoilerSystem
  extends PartialComparison(assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Boilers.TestBoilerSystem fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestBoilerSystemWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.boilerSystem.InletWaterSteam.Q,fluid.boilerSystem.OutletWaterSteam.Q};
  fluidP={fluid.boilerSystem.InletWaterSteam.P,fluid.boilerSystem.OutletWaterSteam.P};
  fluidH={fluid.boilerSystem.InletWaterSteam.h,fluid.boilerSystem.OutletWaterSteam.h};
  waterSteamQ={waterSteam.boilerSystem.Cws1.Q,waterSteam.boilerSystem.Cws2.Q};
  waterSteamP={waterSteam.boilerSystem.Cws1.P,waterSteam.boilerSystem.Cws2.P};
  waterSteamH={waterSteam.boilerSystem.Cws1.h,waterSteam.boilerSystem.Cws2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareBoilerSystem;
