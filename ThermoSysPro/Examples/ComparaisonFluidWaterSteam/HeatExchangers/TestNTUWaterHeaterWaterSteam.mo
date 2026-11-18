within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestNTUWaterHeaterWaterSteam
  extends ThermoSysPro.Examples.Book.SimpleExamples.HeatExchanger.TestNTUWaterHeater(
    nTUWaterHeating1(
      Sp(h(fixed=false)),
      Se(h(fixed=false), P(fixed=false))));
  annotation (experiment(StopTime=1000, Tolerance=1e-6));
end TestNTUWaterHeaterWaterSteam;
