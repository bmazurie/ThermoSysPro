within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestSteamGenerator_1SGWaterSteam
  extends ThermoSysPro.Examples.SimpleExamples.TestSteamGenerator_1SG(
    Q_Prim=4756,
    Q_Secondary=531.242,
    P_Prim=15450000,
    P_Secondary=6600000,
    sourceP(option_temperature=2, h0=1.47084e6),
    sinkQ(Q0=4756, h0=1.27187e6),
    sourceQ1(Q0=531.242, h0=991272),
    sinkP1(P0=6600000, option_temperature=2, h0=2.77257e6));
  annotation (experiment(StopTime=1, Tolerance=1e-6));
end TestSteamGenerator_1SGWaterSteam;
