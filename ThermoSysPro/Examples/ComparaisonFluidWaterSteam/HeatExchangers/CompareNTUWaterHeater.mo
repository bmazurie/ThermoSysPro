within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareNTUWaterHeater
  extends PartialComparison(nPorts=5, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestNTUWaterHeater fluid(
    nTUWaterHeating1(Sp(h(fixed=false)), Se(h(fixed=false), P(fixed=false)),
      h(start=772347), Hep(start=878189), HDesF(start=877802), HeiF(start=774776),
      state_mcF(p(start=8147820)), state_desmF(h(start=877802))),
    singularPressureLoss6(Pm(start=8270000)),
    singularPressureLoss7(Pm(start=1749000)),
    singularPressureLoss8(Pm(start=8025639)),
    singularPressureLoss9(Pm(start=1749000)),
    singularPressureLoss10(Pm(start=1749000))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestNTUWaterHeaterWaterSteam waterSteam(
    nTUWaterHeating1(h(start=772347), Hep(start=878189), HDesF(start=877802), HeiF(start=774776),
      Se(h_vol(start=877802))),
    singularPressureLoss6(Pm(start=8270000), C2(h_vol(start=760830))),
    singularPressureLoss7(Pm(start=1749000)),
    singularPressureLoss8(Pm(start=8025639)),
    singularPressureLoss9(Pm(start=1749000)),
    singularPressureLoss10(Pm(start=2779000))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.nTUWaterHeating1.Ee.Q,fluid.nTUWaterHeating1.Se.Q,fluid.nTUWaterHeating1.Ev.Q,fluid.nTUWaterHeating1.Ep.Q,fluid.nTUWaterHeating1.Sp.Q};
  fluidP={fluid.nTUWaterHeating1.Ee.P,fluid.nTUWaterHeating1.Se.P,fluid.nTUWaterHeating1.Ev.P,fluid.nTUWaterHeating1.Ep.P,fluid.nTUWaterHeating1.Sp.P};
  fluidH={fluid.nTUWaterHeating1.Ee.h,fluid.nTUWaterHeating1.Se.h,fluid.nTUWaterHeating1.Ev.h,fluid.nTUWaterHeating1.Ep.h,fluid.nTUWaterHeating1.Sp.h};
  waterSteamQ={waterSteam.nTUWaterHeating1.Ee.Q,waterSteam.nTUWaterHeating1.Se.Q,waterSteam.nTUWaterHeating1.Ev.Q,waterSteam.nTUWaterHeating1.Ep.Q,waterSteam.nTUWaterHeating1.Sp.Q};
  waterSteamP={waterSteam.nTUWaterHeating1.Ee.P,waterSteam.nTUWaterHeating1.Se.P,waterSteam.nTUWaterHeating1.Ev.P,waterSteam.nTUWaterHeating1.Ev.P,waterSteam.nTUWaterHeating1.Sp.P};
  waterSteamH={waterSteam.nTUWaterHeating1.Ee.h,waterSteam.nTUWaterHeating1.Se.h,waterSteam.nTUWaterHeating1.Ev.h,waterSteam.nTUWaterHeating1.Ep.h,waterSteam.nTUWaterHeating1.Sp.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Both instances drop the three outlet values imposed by the SimpleExamples
(`Sp.h`, `Se.h`, `Se.P`), so that the heater is simulated and not calibrated.
In the WaterSteam Book example the exchange coefficients `KCond`, `KPurge` and
`lambdaE` are declared `fixed=false`: they are set back to `fixed=true` in the
WaterSteam bench, otherwise Dymola uses their bindings only as start values and
the initialisation is under-determined.

`Fluid.HeatExchangers.NTUWaterHeater` imposes the cavity pressure on the drain
inlet (`Ep.P = P`), whereas `WaterSteam.HeatExchangers.NTUWaterHeating` leaves
`Ep.P` to the drain source. The fourth pressure compared on the WaterSteam side
is therefore the cavity pressure `Ev.P`, which is the quantity that the Fluid
port carries.

Both instances receive start values taken from the Dymola solution (mean
pressures of the singular pressure losses, heater enthalpies): with the default
start values (1 bar for the pressure losses of an 80 bar circuit) OpenModelica
does not solve the initialisation of the combined model.
"));
end CompareNTUWaterHeater;
