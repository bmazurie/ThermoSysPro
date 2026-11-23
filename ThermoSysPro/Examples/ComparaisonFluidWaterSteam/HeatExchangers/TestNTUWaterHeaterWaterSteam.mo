within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestNTUWaterHeaterWaterSteam
  extends ThermoSysPro.Examples.Book.SimpleExamples.HeatExchanger.TestNTUWaterHeater(
    nTUWaterHeating1(
      Sp(h(fixed=false)),
      Se(h(fixed=false), P(fixed=false)),
      KCond(fixed=true),
      KPurge(fixed=true),
      lambdaE(fixed=true)));
  annotation (experiment(StopTime=1000, Tolerance=1e-6));
end TestNTUWaterHeaterWaterSteam;
