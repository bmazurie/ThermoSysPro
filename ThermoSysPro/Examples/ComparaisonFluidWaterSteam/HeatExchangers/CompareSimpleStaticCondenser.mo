within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareSimpleStaticCondenser
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestSimpleStaticCondenser fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestSimpleStaticCondenserWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.simpleStaticCondenser.Ec.Q,fluid.simpleStaticCondenser.Sc.Q,fluid.simpleStaticCondenser.Ef.Q,fluid.simpleStaticCondenser.Sf.Q};
  fluidP={fluid.simpleStaticCondenser.Ec.P,fluid.simpleStaticCondenser.Sc.P,fluid.simpleStaticCondenser.Ef.P,fluid.simpleStaticCondenser.Sf.P};
  fluidH={fluid.simpleStaticCondenser.Ec.h,fluid.simpleStaticCondenser.Sc.h,fluid.simpleStaticCondenser.Ef.h,fluid.simpleStaticCondenser.Sf.h};
  waterSteamQ={waterSteam.simpleStaticCondenser.Ec.Q,waterSteam.simpleStaticCondenser.Sc.Q,waterSteam.simpleStaticCondenser.Ef.Q,waterSteam.simpleStaticCondenser.Sf.Q};
  waterSteamP={waterSteam.simpleStaticCondenser.Ec.P,waterSteam.simpleStaticCondenser.Sc.P,waterSteam.simpleStaticCondenser.Ef.P,waterSteam.simpleStaticCondenser.Sf.P};
  waterSteamH={waterSteam.simpleStaticCondenser.Ec.h,waterSteam.simpleStaticCondenser.Sc.h,waterSteam.simpleStaticCondenser.Ef.h,waterSteam.simpleStaticCondenser.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareSimpleStaticCondenser;
