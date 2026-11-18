within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareSimpleDynamicCondenser
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestSimpleDynamicCondenser fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSimpleDynamicCondenserWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.Condenseur.Cv.Q,fluid.Condenseur.Cl.Q,fluid.Condenseur.Cee.Q,fluid.Condenseur.Cse.Q};
  fluidP={fluid.Condenseur.Cv.P,fluid.Condenseur.Cl.P,fluid.Condenseur.Cee.P,fluid.Condenseur.Cse.P};
  fluidH={fluid.Condenseur.Cv.h,fluid.Condenseur.Cl.h,fluid.Condenseur.Cee.h,fluid.Condenseur.Cse.h};
  waterSteamQ={waterSteam.Condenseur.Cv.Q,waterSteam.Condenseur.Cl.Q,waterSteam.Condenseur.Cee.Q,waterSteam.Condenseur.Cse.Q};
  waterSteamP={waterSteam.Condenseur.Cv.P,waterSteam.Condenseur.Cl.P,waterSteam.Condenseur.Cee.P,waterSteam.Condenseur.Cse.P};
  waterSteamH={waterSteam.Condenseur.Cv.h,waterSteam.Condenseur.Cl.h,waterSteam.Condenseur.Cee.h,waterSteam.Condenseur.Cse.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareSimpleDynamicCondenser;
