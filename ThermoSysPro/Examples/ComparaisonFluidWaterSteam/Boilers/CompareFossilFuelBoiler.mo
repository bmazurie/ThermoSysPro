within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Boilers;
model CompareFossilFuelBoiler
  extends PartialComparison(assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Boilers.TestFossilFuelBoiler fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestFossilFuelBoilerWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.fossilFuelBoiler.Cws1.Q,fluid.fossilFuelBoiler.Cws2.Q};
  fluidP={fluid.fossilFuelBoiler.Cws1.P,fluid.fossilFuelBoiler.Cws2.P};
  fluidH={fluid.fossilFuelBoiler.Cws1.h,fluid.fossilFuelBoiler.Cws2.h};
  waterSteamQ={waterSteam.fossilFuelBoiler.Cws1.Q,waterSteam.fossilFuelBoiler.Cws2.Q};
  waterSteamP={waterSteam.fossilFuelBoiler.Cws1.P,waterSteam.fossilFuelBoiler.Cws2.P};
  waterSteamH={waterSteam.fossilFuelBoiler.Cws1.h,waterSteam.fossilFuelBoiler.Cws2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareFossilFuelBoiler;
