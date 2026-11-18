within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareDynamicPlateHeatExchangerW
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestDynamicPlateHeatExchangerW fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDynamicPlateHeatExchangerWWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.echangeurAPlaques1D1.Ec.Q,fluid.echangeurAPlaques1D1.Sc.Q,fluid.echangeurAPlaques1D1.Ef.Q,fluid.echangeurAPlaques1D1.Sf.Q};
  fluidP={fluid.echangeurAPlaques1D1.Ec.P,fluid.echangeurAPlaques1D1.Sc.P,fluid.echangeurAPlaques1D1.Ef.P,fluid.echangeurAPlaques1D1.Sf.P};
  fluidH={fluid.echangeurAPlaques1D1.Ec.h,fluid.echangeurAPlaques1D1.Sc.h,fluid.echangeurAPlaques1D1.Ef.h,fluid.echangeurAPlaques1D1.Sf.h};
  waterSteamQ={waterSteam.echangeurAPlaques1D1.Ec.Q,waterSteam.echangeurAPlaques1D1.Sc.Q,waterSteam.echangeurAPlaques1D1.Ef.Q,waterSteam.echangeurAPlaques1D1.Sf.Q};
  waterSteamP={waterSteam.echangeurAPlaques1D1.Ec.P,waterSteam.echangeurAPlaques1D1.Sc.P,waterSteam.echangeurAPlaques1D1.Ef.P,waterSteam.echangeurAPlaques1D1.Sf.P};
  waterSteamH={waterSteam.echangeurAPlaques1D1.Ec.h,waterSteam.echangeurAPlaques1D1.Sc.h,waterSteam.echangeurAPlaques1D1.Ef.h,waterSteam.echangeurAPlaques1D1.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareDynamicPlateHeatExchangerW;
