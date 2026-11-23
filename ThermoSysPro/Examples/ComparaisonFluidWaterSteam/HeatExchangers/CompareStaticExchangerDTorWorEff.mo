within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model CompareStaticExchangerDTorWorEff
  extends PartialComparison(nPorts=4, assertionLevel=AssertionLevel.warning);
  ThermoSysPro.Fluid.Examples.SimpleExamples.HeatExchangers.TestStaticExchangerDTorWorEff fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStaticExchangerDTorWorEffWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.exchangerWaterSteamDTorWorEFF.Ec.Q,fluid.exchangerWaterSteamDTorWorEFF.Sc.Q,fluid.exchangerWaterSteamDTorWorEFF.Ef.Q,fluid.exchangerWaterSteamDTorWorEFF.Sf.Q};
  fluidP={fluid.exchangerWaterSteamDTorWorEFF.Ec.P,fluid.exchangerWaterSteamDTorWorEFF.Sc.P,fluid.exchangerWaterSteamDTorWorEFF.Ef.P,fluid.exchangerWaterSteamDTorWorEFF.Sf.P};
  fluidH={fluid.exchangerWaterSteamDTorWorEFF.Ec.h,fluid.exchangerWaterSteamDTorWorEFF.Sc.h,fluid.exchangerWaterSteamDTorWorEFF.Ef.h,fluid.exchangerWaterSteamDTorWorEFF.Sf.h};
  waterSteamQ={waterSteam.exchangerWaterSteamDTorWorEFF.Ec.Q,waterSteam.exchangerWaterSteamDTorWorEFF.Sc.Q,waterSteam.exchangerWaterSteamDTorWorEFF.Ef.Q,waterSteam.exchangerWaterSteamDTorWorEFF.Sf.Q};
  waterSteamP={waterSteam.exchangerWaterSteamDTorWorEFF.Ec.P,waterSteam.exchangerWaterSteamDTorWorEFF.Sc.P,waterSteam.exchangerWaterSteamDTorWorEFF.Ef.P,waterSteam.exchangerWaterSteamDTorWorEFF.Sf.P};
  waterSteamH={waterSteam.exchangerWaterSteamDTorWorEFF.Ec.h,waterSteam.exchangerWaterSteamDTorWorEFF.Sc.h,waterSteam.exchangerWaterSteamDTorWorEFF.Ef.h,waterSteam.exchangerWaterSteamDTorWorEFF.Sf.h};
  annotation (experiment(StopTime=1000, Tolerance=1e-6), Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CompareStaticExchangerDTorWorEff;
