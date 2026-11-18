within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.Junctions;
model CompareDryer
  extends PartialComparison(nPorts=3);
  ThermoSysPro.Fluid.Examples.SimpleExamples.Junctions.TestDryer fluid annotation (Placement(transformation(extent={{-90,-10},{-10,10}})));
  TestDryerWaterSteam waterSteam annotation (Placement(transformation(extent={{10,-10},{90,10}})));
equation
  fluidQ={fluid.steamDryer.Cev.Q,fluid.steamDryer.Csv.Q,fluid.steamDryer.Csl.Q};
  fluidP={fluid.steamDryer.Cev.P,fluid.steamDryer.Csv.P,fluid.steamDryer.Csl.P};
  fluidH={fluid.steamDryer.Cev.h,fluid.steamDryer.Csv.h,fluid.steamDryer.Csl.h};
  waterSteamQ={waterSteam.steamDryer.Cev.Q,waterSteam.steamDryer.Csv.Q,waterSteam.steamDryer.Csl.Q};
  waterSteamP={waterSteam.steamDryer.Cev.P,waterSteam.steamDryer.Csv.P,waterSteam.steamDryer.Csl.P};
  waterSteamH={waterSteam.steamDryer.Cev.h,waterSteam.steamDryer.Csv.h,waterSteam.steamDryer.Csl.h};
  annotation(Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6));
end CompareDryer;
