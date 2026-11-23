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
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
The Fluid cooling water source imposes the temperature `T0 = 290.68 K`. The
WaterSteam `SourceQ` only accepts an enthalpy: the WaterSteam bench uses the
enthalpy of the Fluid source at that temperature (`h0 = 73675.3 J/kg`) instead of
the former `113 kJ/kg`. The WaterSteam condenser also receives the start values
`hl` and `hv` of the Fluid solution.

Known component difference: the regularisation parameter of the valve law
`ThermoSquare(Q, eps)` is `eps = 1e-3` in `Fluid.PressureLosses.ControlValve` and
`eps = 1` in `WaterSteam.PressureLosses.ControlValve`, so below 1 kg/s the
WaterSteam valve law is linear instead of quadratic. `eps` is a protected
parameter in both components and cannot be aligned by a modifier.
"));
end CompareSimpleDynamicCondenser;
