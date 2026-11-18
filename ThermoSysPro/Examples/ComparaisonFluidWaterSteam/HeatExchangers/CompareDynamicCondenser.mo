within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicCondenser
  extends PartialComparison(nPorts=6, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicCondenser fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicCondenserWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.condenser.C1vap.Q,fluid.condenser.C2vap.Q,fluid.condenser.C1.Q,fluid.condenser.C2ex.Q,fluid.condenser.Ce1.Q,fluid.condenser.Ce2.Q};
  fluidP={fluid.condenser.C1vap.P,fluid.condenser.C2vap.P,fluid.condenser.C1.P,fluid.condenser.C2ex.P,fluid.condenser.Ce1.P,fluid.condenser.Ce2.P};
  fluidH={fluid.condenser.C1vap.h,fluid.condenser.C2vap.h,fluid.condenser.C1.h,fluid.condenser.C2ex.h,fluid.condenser.Ce1.h,fluid.condenser.Ce2.h};
  waterSteamQ={waterSteam.condenser.C1vap.Q,waterSteam.condenser.C2vap.Q,waterSteam.condenser.C1.Q,waterSteam.condenser.C2ex.Q,waterSteam.condenser.Ce1.Q,waterSteam.condenser.Ce2.Q};
  waterSteamP={waterSteam.condenser.C1vap.P,waterSteam.condenser.C2vap.P,waterSteam.condenser.C1.P,waterSteam.condenser.C2ex.P,waterSteam.condenser.Ce1.P,waterSteam.condenser.Ce2.P};
  waterSteamH={waterSteam.condenser.C1vap.h,waterSteam.condenser.C2vap.h,waterSteam.condenser.C1.h,waterSteam.condenser.C2ex.h,waterSteam.condenser.Ce1.h,waterSteam.condenser.Ce2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicCondenser;
