within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicPlateHeatExchanger
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicPlateHeatExchanger fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicPlateHeatExchangerWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.dynamicPlateHeatExchanger.Ec.Q,fluid.dynamicPlateHeatExchanger.Sc.Q,fluid.dynamicPlateHeatExchanger.Ef.Q,fluid.dynamicPlateHeatExchanger.Sf.Q};
  fluidP={fluid.dynamicPlateHeatExchanger.Ec.P,fluid.dynamicPlateHeatExchanger.Sc.P,fluid.dynamicPlateHeatExchanger.Ef.P,fluid.dynamicPlateHeatExchanger.Sf.P};
  fluidH={fluid.dynamicPlateHeatExchanger.Ec.h,fluid.dynamicPlateHeatExchanger.Sc.h,fluid.dynamicPlateHeatExchanger.Ef.h,fluid.dynamicPlateHeatExchanger.Sf.h};
  waterSteamQ={waterSteam.dynamicPlateHeatExchanger.Ec.Q,waterSteam.dynamicPlateHeatExchanger.Sc.Q,waterSteam.dynamicPlateHeatExchanger.Ef.Q,waterSteam.dynamicPlateHeatExchanger.Sf.Q};
  waterSteamP={waterSteam.dynamicPlateHeatExchanger.Ec.P,waterSteam.dynamicPlateHeatExchanger.Sc.P,waterSteam.dynamicPlateHeatExchanger.Ef.P,waterSteam.dynamicPlateHeatExchanger.Sf.P};
  waterSteamH={waterSteam.dynamicPlateHeatExchanger.Ec.h,waterSteam.dynamicPlateHeatExchanger.Sc.h,waterSteam.dynamicPlateHeatExchanger.Ef.h,waterSteam.dynamicPlateHeatExchanger.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicPlateHeatExchanger;
