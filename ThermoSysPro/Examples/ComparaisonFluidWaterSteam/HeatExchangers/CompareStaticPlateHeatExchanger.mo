within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareStaticPlateHeatExchanger
  extends PartialComparison(nPorts=4);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestStaticPlateHeatExchanger fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStaticPlateHeatExchangerWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.staticPlateHeatExchanger.Ec.Q,fluid.staticPlateHeatExchanger.Sc.Q,fluid.staticPlateHeatExchanger.Ef.Q,fluid.staticPlateHeatExchanger.Sf.Q};
  fluidP={fluid.staticPlateHeatExchanger.Ec.P,fluid.staticPlateHeatExchanger.Sc.P,fluid.staticPlateHeatExchanger.Ef.P,fluid.staticPlateHeatExchanger.Sf.P};
  fluidH={fluid.staticPlateHeatExchanger.Ec.h,fluid.staticPlateHeatExchanger.Sc.h,fluid.staticPlateHeatExchanger.Ef.h,fluid.staticPlateHeatExchanger.Sf.h};
  waterSteamQ={waterSteam.staticPlateHeatExchanger.Ec.Q,waterSteam.staticPlateHeatExchanger.Sc.Q,waterSteam.staticPlateHeatExchanger.Ef.Q,waterSteam.staticPlateHeatExchanger.Sf.Q};
  waterSteamP={waterSteam.staticPlateHeatExchanger.Ec.P,waterSteam.staticPlateHeatExchanger.Sc.P,waterSteam.staticPlateHeatExchanger.Ef.P,waterSteam.staticPlateHeatExchanger.Sf.P};
  waterSteamH={waterSteam.staticPlateHeatExchanger.Ec.h,waterSteam.staticPlateHeatExchanger.Sc.h,waterSteam.staticPlateHeatExchanger.Ef.h,waterSteam.staticPlateHeatExchanger.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareStaticPlateHeatExchanger;
