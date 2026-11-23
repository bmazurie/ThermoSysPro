within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareMixer8
  extends PartialComparison(nPorts=7, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestMixer8 fluid(
    staticVolume(P(start=272445), h(start=71016)),
    staticVolume1(P(start=197846), h(start=71004)),
    staticVolume2(P(start=199419), h(start=70921)),
    valve1(Pm(start=235146)),
    valve2(Pm(start=198632)),
    valve3(Pm(start=148923))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestMixer8WaterSteam waterSteam(
    staticVolume(P(start=272445), h(start=71016)),
    staticVolume1(P(start=197846), h(start=71004)),
    staticVolume2(P(start=199419), h(start=70921)),
    valve1(Pm(start=235146)),
    valve2(Pm(start=198632)),
    valve3(Pm(start=148923))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.staticVolume.Ce4.Q,fluid.staticVolume.Cs.Q,fluid.staticVolume2.Ce4.Q,fluid.staticVolume2.Cs.Q,fluid.staticVolume1.Ce1.Q,fluid.staticVolume1.Ce8.Q,fluid.staticVolume1.Cs.Q};
  fluidP={fluid.staticVolume.Ce4.P,fluid.staticVolume.Cs.P,fluid.staticVolume2.Ce4.P,fluid.staticVolume2.Cs.P,fluid.staticVolume1.Ce1.P,fluid.staticVolume1.Ce8.P,fluid.staticVolume1.Cs.P};
  fluidH={fluid.staticVolume.Ce4.h,fluid.staticVolume.Cs.h,fluid.staticVolume2.Ce4.h,fluid.staticVolume2.Cs.h,fluid.staticVolume1.Ce1.h,fluid.staticVolume1.Ce8.h,fluid.staticVolume1.Cs.h};
  waterSteamQ={waterSteam.staticVolume.Ce4.Q,waterSteam.staticVolume.Cs.Q,waterSteam.staticVolume2.Ce4.Q,waterSteam.staticVolume2.Cs.Q,waterSteam.staticVolume1.Ce1.Q,waterSteam.staticVolume1.Ce8.Q,waterSteam.staticVolume1.Cs.Q};
  waterSteamP={waterSteam.staticVolume.Ce4.P,waterSteam.staticVolume.Cs.P,waterSteam.staticVolume2.Ce4.P,waterSteam.staticVolume2.Cs.P,waterSteam.staticVolume1.Ce1.P,waterSteam.staticVolume1.Ce8.P,waterSteam.staticVolume1.Cs.P};
  waterSteamH={waterSteam.staticVolume.Ce4.h,waterSteam.staticVolume.Cs.h,waterSteam.staticVolume2.Ce4.h,waterSteam.staticVolume2.Cs.h,waterSteam.staticVolume1.Ce1.h,waterSteam.staticVolume1.Ce8.h,waterSteam.staticVolume1.Cs.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=10, Tolerance=1e-6), Documentation(info="
Both instances receive start values taken from the Dymola solution (pressures and
enthalpies of the three mixers, mean pressures of the three valves). The default
start values of the mixers (10 bar, 1 MJ/kg) lie in the two-phase region whereas
the fluid is liquid water at about 71 kJ/kg; with them OpenModelica does not
solve the initialisation of the Fluid bench.

The assertions are emitted at the `warning` level: both benches reach the same
final state, but the flow reversal of the `staticVolume2` branch around
`t = 1.15 s` and the end of the valve ramps around `t = 3.9 s` are not
synchronised to the 1e-6 relative tolerance (largest deviation about 1e-3),
because of the valve regularisation difference described below.

The WaterSteam bench gives the three `Mixer8` volumes the enthalpy start values
that the Fluid SimpleExample sets through its connectors (`h_vol_1`/`h_vol_2`).
Without them the WaterSteam mixers start at their default 1 MJ/kg and the
initialisation leaves the IF97 domain under Dymola.

Known component difference: the regularisation parameter of the valve law
`ThermoSquare(Q, eps)` is `eps = 1e-3` in `Fluid.PressureLosses.ControlValve` and
`eps = 1` in `WaterSteam.PressureLosses.ControlValve`, so below 1 kg/s the
WaterSteam valve law is linear instead of quadratic. `eps` is a protected
parameter in both components and cannot be aligned by a modifier.
"));
end CompareMixer8;
