within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicPlateHeatExchangerW
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicPlateHeatExchangerW fluid(
    echangeurAPlaques1D1(
      Pc(start={3.0e5,2.667e5,2.333e5,2.0e5,1.667e5,1.333e5,1.0e5}),
      Pf(start={1.0e5,1.333e5,1.667e5,2.0e5,2.333e5,2.667e5,3.0e5}),
      hc(start={2.8005e5,2.8005e5,2.6e5,2.4e5,2.2e5,1.8e5,1.615e5}),
      hf(start={1.843e5,1.843e5,1.6e5,1.4e5,1.2e5,0.71e5,0.71e5}),
      hbc(start={2.8005e5,2.6e5,2.4e5,2.2e5,1.8e5,1.615e5}),
      hbf(start={1.843e5,1.6e5,1.4e5,1.2e5,0.9e5,0.71e5}),
      Qc(start=fill(1036, 6)),
      Qf(start=fill(1084, 6)))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicPlateHeatExchangerWWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.echangeurAPlaques1D1.Ec.Q,fluid.echangeurAPlaques1D1.Sc.Q,fluid.echangeurAPlaques1D1.Ef.Q,fluid.echangeurAPlaques1D1.Sf.Q};
  fluidP={fluid.echangeurAPlaques1D1.Ec.P,fluid.echangeurAPlaques1D1.Sc.P,fluid.echangeurAPlaques1D1.Ef.P,fluid.echangeurAPlaques1D1.Sf.P};
  fluidH={fluid.echangeurAPlaques1D1.Ec.h,fluid.echangeurAPlaques1D1.Sc.h,fluid.echangeurAPlaques1D1.Ef.h,fluid.echangeurAPlaques1D1.Sf.h};
  waterSteamQ={waterSteam.echangeurAPlaques1D1.Ec.Q,waterSteam.echangeurAPlaques1D1.Sc.Q,waterSteam.echangeurAPlaques1D1.Ef.Q,waterSteam.echangeurAPlaques1D1.Sf.Q};
  waterSteamP={waterSteam.echangeurAPlaques1D1.Ec.P,waterSteam.echangeurAPlaques1D1.Sc.P,waterSteam.echangeurAPlaques1D1.Ef.P,waterSteam.echangeurAPlaques1D1.Sf.P};
  waterSteamH={waterSteam.echangeurAPlaques1D1.Ec.h,waterSteam.echangeurAPlaques1D1.Sc.h,waterSteam.echangeurAPlaques1D1.Ef.h,waterSteam.echangeurAPlaques1D1.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
The Fluid exchanger receives start values taken from the WaterSteam solution
(pressures, enthalpies and flow rates along both sides). The hot flow rate is
imposed by a `SinkQ` (`Q0 = 1036 kg/s`) on both sides, as in the corrected
SimpleExample.

This comparison relies on the correction of the cold side of
`Fluid.HeatExchangers.DynamicPlateHeatExchanger` described in
`CompareDynamicPlateHeatExchanger`: before the correction the Fluid bench did not
initialise. The remaining deviation comes from the heat transfer computed with
the SRI correlations (about 110 MW on the Fluid side against 123 MW on the
WaterSteam side: outlet enthalpies 173.5 kJ/kg against 161.5 kJ/kg on the hot
side and 172.9 kJ/kg against 184.3 kJ/kg on the cold side).
Without the heat transfer correlation the enthalpy deviation drops to about 2 %;
without any correlation and with 20 cells instead of 5 it drops to 0.4-0.5 %
(discretisation: heat exchange evaluated at the nodes with the upwind enthalpy in
Fluid, at the mean of the cell boundaries in WaterSteam). With 20 cells and the
correlations 2 % remain, which come from the evaluation of the SRI correlations.
"));
end CompareDynamicPlateHeatExchangerW;
