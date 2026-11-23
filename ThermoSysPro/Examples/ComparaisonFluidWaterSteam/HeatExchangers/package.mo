within ThermoSysPro.Examples.ComparaisonFluidWaterSteam;
package HeatExchangers "Heat exchanger comparison benches"
  extends ThermoSysPro.UsersGuide.Documentation.ThermoSysProPackageIcon;

  partial model PartialComparison "Common Q/P/h assertions on heat exchanger ports"
    parameter Integer nPorts(min=1);
    parameter Real relativeTolerance=1e-6;
    parameter Real pressureAbsoluteTolerance(unit="Pa")=1;
    parameter Real flowAbsoluteTolerance(unit="kg/s")=1e-6;
    parameter Real enthalpyAbsoluteTolerance(unit="J/kg")=0.1;
    parameter AssertionLevel assertionLevel=AssertionLevel.error;
    Real fluidQ[nPorts];
    Real fluidP[nPorts];
    Real fluidH[nPorts];
    Real waterSteamQ[nPorts];
    Real waterSteamP[nPorts];
    Real waterSteamH[nPorts];
  equation
    for i in 1:nPorts loop
      assert(ComparaisonFluidWaterSteam.isClose(fluidQ[i], waterSteamQ[i], relativeTolerance, flowAbsoluteTolerance), "Heat exchanger: Q mismatch on port " + String(i), assertionLevel);
      assert(ComparaisonFluidWaterSteam.isClose(fluidP[i], waterSteamP[i], relativeTolerance, pressureAbsoluteTolerance), "Heat exchanger: P mismatch on port " + String(i), assertionLevel);
      assert(ComparaisonFluidWaterSteam.isClose(fluidH[i], waterSteamH[i], relativeTolerance, enthalpyAbsoluteTolerance), "Heat exchanger: h mismatch on port " + String(i), assertionLevel);
    end for;
  end PartialComparison;
end HeatExchangers;
