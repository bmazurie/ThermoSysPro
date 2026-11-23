within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareStaticDrum
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestStaticDrum fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestStaticDrumWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.StaticDrumTh1.Ce_eco.Q,fluid.StaticDrumTh1.Cs_purg.Q,fluid.StaticDrumTh1.Cs_sur.Q};
  fluidP={fluid.StaticDrumTh1.Ce_eco.P,fluid.StaticDrumTh1.Cs_purg.P,fluid.StaticDrumTh1.Cs_sur.P};
  fluidH={fluid.StaticDrumTh1.Ce_eco.h,fluid.StaticDrumTh1.Cs_purg.h,fluid.StaticDrumTh1.Cs_sur.h};
  waterSteamQ={waterSteam.StaticDrumTh1.Ce_eco.Q,waterSteam.StaticDrumTh1.Cs_purg.Q,waterSteam.StaticDrumTh1.Cs_sur.Q};
  waterSteamP={waterSteam.StaticDrumTh1.Ce_eco.P,waterSteam.StaticDrumTh1.Cs_purg.P,waterSteam.StaticDrumTh1.Cs_sur.P};
  waterSteamH={waterSteam.StaticDrumTh1.Ce_eco.h,waterSteam.StaticDrumTh1.Cs_purg.h,waterSteam.StaticDrumTh1.Cs_sur.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1000, Tolerance=1e-6));
end CompareStaticDrum;
