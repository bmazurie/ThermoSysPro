within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicPlateHeatExchanger
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicPlateHeatExchanger fluid(
    dynamicPlateHeatExchanger(
      Qf(start=fill(1.4e6, 6)),
      Ef(Q(start=1.4e6)),
      Sf(Q(start=1.4e6)))) annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicPlateHeatExchangerWaterSteam waterSteam(
    dynamicPlateHeatExchanger(
      Pmc(start=fill(3e5, 5)),
      Hmc(start=fill(2.8005e5, 5)),
      Pmf(start=fill(2e5, 5)),
      Hmf(start=fill(2.801e5, 5)),
      Qcc(start=fill(1036, 6)),
      Qcf(start=fill(1.4e6, 6)),
      Qf(start=fill(1.4e6, 5)),
      Ef(Q(start=1.4e6)),
      Sf(Q(start=1.4e6)))) annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicPlateHeatExchanger.Ec.Q,fluid.dynamicPlateHeatExchanger.Sc.Q,fluid.dynamicPlateHeatExchanger.Ef.Q,fluid.dynamicPlateHeatExchanger.Sf.Q};
  fluidP={fluid.dynamicPlateHeatExchanger.Ec.P,fluid.dynamicPlateHeatExchanger.Sc.P,fluid.dynamicPlateHeatExchanger.Ef.P,fluid.dynamicPlateHeatExchanger.Sf.P};
  fluidH={fluid.dynamicPlateHeatExchanger.Ec.h,fluid.dynamicPlateHeatExchanger.Sc.h,fluid.dynamicPlateHeatExchanger.Ef.h,fluid.dynamicPlateHeatExchanger.Sf.h};
  waterSteamQ={waterSteam.dynamicPlateHeatExchanger.Ec.Q,waterSteam.dynamicPlateHeatExchanger.Sc.Q,waterSteam.dynamicPlateHeatExchanger.Ef.Q,waterSteam.dynamicPlateHeatExchanger.Sf.Q};
  waterSteamP={waterSteam.dynamicPlateHeatExchanger.Ec.P,waterSteam.dynamicPlateHeatExchanger.Sc.P,waterSteam.dynamicPlateHeatExchanger.Ef.P,waterSteam.dynamicPlateHeatExchanger.Sf.P};
  waterSteamH={waterSteam.dynamicPlateHeatExchanger.Ec.h,waterSteam.dynamicPlateHeatExchanger.Sc.h,waterSteam.dynamicPlateHeatExchanger.Ef.h,waterSteam.dynamicPlateHeatExchanger.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), Documentation(info="
Both benches receive start values close to the solution: with `p_Kf = 1e-4` and
a 2 bar pressure difference the cold flow rate is about 1.4e6 kg/s, far from the
default start values. The hot flow rate is imposed by a `SinkQ` (`Q0 = 1036 kg/s`)
on both sides, as in the corrected SimpleExample; the former calibration of the
sink pressure (`P0(fixed=false)`) is not portable to OpenModelica, which uses the
default binding of `P0` as an equation.

This comparison relies on the correction of the cold side of
`Fluid.HeatExchangers.DynamicPlateHeatExchanger` (branch
`fix/125-dynamic-plate-heat-exchanger-cold-side`): the cold nodes are numbered
from `Sf` (1) to `Ef` (N+1) and the energy balance assumes a flow towards
decreasing indices, but the pressure loss and the upwind enthalpy assumed the
opposite direction (since ThermoSysPro 4.0). Before the correction the Fluid
cold flow converged to `Ef.Q = -1.4e6 kg/s`.
"));
end CompareDynamicPlateHeatExchanger;
