within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.HeatExchangers;
model TestStaticCondenserWaterSteam
  extends ThermoSysPro.Examples.Book.SimpleExamples.HeatExchanger.TestStaticCondenser(
    Puit_condenseur(P0(fixed=true)=100000),
    sourceP(h0=2.5817e6, C(Q(fixed=true, start=100))),
    sourceP1(h0=2.5481e6, C(Q(fixed=true, start=1e-5))),
    sourceP2(h0=2.5055e6, C(Q(fixed=true, start=1e-5))),
    condenseur(CPCE=0, KCO=100, QC0=200, z=5, SCO=15e3, Qee(start=4000, fixed=false), Pcond(fixed=false, start=2154.77)),
    Source_condenseur(h0=60e3, Q0(fixed=true)=4000, C(P(fixed=false))),
    singularPressureLoss2(K=1e-4));
  annotation (experiment(StopTime=1000, Tolerance=1e-6));
end TestStaticCondenserWaterSteam;
