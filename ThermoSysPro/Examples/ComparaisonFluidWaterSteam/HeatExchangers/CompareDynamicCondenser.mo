within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicCondenser
  extends PartialComparison(nPorts=6, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicCondenser fluid(condenser(dynamic_energy_balance=true, DynamicCondenser(steady_state=false))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicCondenserWaterSteam waterSteam(condenser(DynamicCondenser(steady_state=false), pipe_3(advection=false))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.condenser.C1vap.Q,fluid.condenser.C2vap.Q,fluid.condenser.C1.Q,fluid.condenser.C2ex.Q,fluid.condenser.Ce1.Q,fluid.condenser.Ce2.Q};
  fluidP={fluid.condenser.C1vap.P,fluid.condenser.C2vap.P,fluid.condenser.C1.P,fluid.condenser.C2ex.P,fluid.condenser.Ce1.P,fluid.condenser.Ce2.P};
  fluidH={fluid.condenser.C1vap.h,fluid.condenser.C2vap.h,fluid.condenser.C1.h,fluid.condenser.C2ex.h,fluid.condenser.Ce1.h,fluid.condenser.Ce2.h};
  waterSteamQ={waterSteam.condenser.C1vap.Q,waterSteam.condenser.C2vap.Q,waterSteam.condenser.C1.Q,waterSteam.condenser.C2ex.Q,waterSteam.condenser.Ce1.Q,waterSteam.condenser.Ce2.Q};
  waterSteamP={waterSteam.condenser.C1vap.P,waterSteam.condenser.C2vap.P,waterSteam.condenser.C1.P,waterSteam.condenser.C2ex.P,waterSteam.condenser.Ce1.P,waterSteam.condenser.Ce2.P};
  waterSteamH={waterSteam.condenser.C1vap.h,waterSteam.condenser.C2vap.h,waterSteam.condenser.C1.h,waterSteam.condenser.C2ex.h,waterSteam.condenser.Ce1.h,waterSteam.condenser.Ce2.h};
  annotation (experiment(StopTime=1, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
The Fluid SimpleExample uses static balances (`dynamic_energy_balance=false`),
which give a non-physical cavity state (negative liquid volume, vapour enthalpy
of 354 kJ/kg), and the WaterSteam component has no static mode. Both condensers
are therefore dynamic, with the same initial cavity state (`steady_state=false`
with the default `P0c = 1e4 Pa` and `Vf0 = 0.066` of both components). The
WaterSteam cooling pipe uses `advection=false` like the Fluid one.

The remaining deviation comes from the vapour phase of the cavity: after 1 s the
Fluid vapour enthalpy drops to 2.29 MJ/kg (wet vapour) while the WaterSteam one
stays near 2.59 MJ/kg, which gives a cavity pressure of 12.8 kPa against
10.8 kPa. There is no ramp or step in this bench. The cause is the mean
enthalpy of the incoming steam `hvIn` in `Fluid.Volumes.TwoPhaseCavityOnePipe`:
its dynamic equation `0.1*rho*der(hvIn) = CvBP.Q*(CvBP.h - (hvIn - P/rhov)) + ...`
gives `hvIn = h_in + P/rhov` at equilibrium (2.846 MJ/kg instead of 2.7 MJ/kg at
0.1 bar), which overestimates the desuperheating power and biases the
condensation. With `CvBP.Q*(CvBP.h - hvIn) + CvGCT.Q*(CvGCT.h - hvIn)` the
deviation drops to 0.35 %. No steady-state variant of this comparison is
provided: in steady state the vapour quality of the cavity is not determined by
the equations, which are the same in both libraries.
"));
end CompareDynamicCondenser;
