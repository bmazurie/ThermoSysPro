within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareStaticCondenser
  extends PartialComparison(nPorts=6, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestStaticCondenser fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStaticCondenserWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.condenseur.Cvt.Q,fluid.condenseur.Cev.Q,fluid.condenseur.Cep.Q,fluid.condenseur.Cee.Q,fluid.condenseur.Cse.Q,fluid.condenseur.Cex.Q};
  fluidP={fluid.condenseur.Cvt.P,fluid.condenseur.Cev.P,fluid.condenseur.Cep.P,fluid.condenseur.Cee.P,fluid.condenseur.Cse.P,fluid.condenseur.Cex.P};
  fluidH={fluid.condenseur.Cvt.h,fluid.condenseur.Cev.h,fluid.condenseur.Cep.h,fluid.condenseur.Cee.h,fluid.condenseur.Cse.h,fluid.condenseur.Cex.h};
  waterSteamQ={waterSteam.condenseur.Cvt.Q,waterSteam.condenseur.Cev.Q,waterSteam.condenseur.Cep.Q,waterSteam.condenseur.Cee.Q,waterSteam.condenseur.Cse.Q,waterSteam.condenseur.Cex.Q};
  waterSteamP={waterSteam.condenseur.Cvt.P,waterSteam.condenseur.Cev.P,waterSteam.condenseur.Cep.P,waterSteam.condenseur.Cee.P,waterSteam.condenseur.Cse.P,waterSteam.condenseur.Cex.P};
  waterSteamH={waterSteam.condenseur.Cvt.h,waterSteam.condenseur.Cev.h,waterSteam.condenseur.Cep.h,waterSteam.condenseur.Cee.h,waterSteam.condenseur.Cse.h,waterSteam.condenseur.Cex.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareStaticCondenser;
