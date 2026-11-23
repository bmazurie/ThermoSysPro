within ThermoSysPro.Examples.ComparaisonFluidWaterSteam;
package Boilers "Boiler comparison benches"
  extends ThermoSysPro.UsersGuide.Documentation.ThermoSysProPackageIcon;

  partial model PartialComparison "Common Q/P/h assertions on water/steam ports"
    parameter Real relativeTolerance=1e-6;
    parameter Real pressureAbsoluteTolerance(unit="Pa")=1;
    parameter Real flowAbsoluteTolerance(unit="kg/s")=1e-6;
    parameter Real enthalpyAbsoluteTolerance(unit="J/kg")=0.1;
    parameter AssertionLevel assertionLevel=AssertionLevel.error;
    Real fluidQ[2];
    Real fluidP[2];
    Real fluidH[2];
    Real waterSteamQ[2];
    Real waterSteamP[2];
    Real waterSteamH[2];
  equation
    for i in 1:2 loop
      assert(ComparaisonFluidWaterSteam.isClose(fluidQ[i], waterSteamQ[i], relativeTolerance, flowAbsoluteTolerance), "Boiler water/steam circuit: Q mismatch on port " + String(i), assertionLevel);
      assert(ComparaisonFluidWaterSteam.isClose(fluidP[i], waterSteamP[i], relativeTolerance, pressureAbsoluteTolerance), "Boiler water/steam circuit: P mismatch on port " + String(i), assertionLevel);
      assert(ComparaisonFluidWaterSteam.isClose(fluidH[i], waterSteamH[i], relativeTolerance, enthalpyAbsoluteTolerance), "Boiler water/steam circuit: h mismatch on port " + String(i), assertionLevel);
    end for;
  end PartialComparison;
end Boilers;
