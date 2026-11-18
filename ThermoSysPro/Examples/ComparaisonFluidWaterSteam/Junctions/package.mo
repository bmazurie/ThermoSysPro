within ThermoSysPro.Examples.ComparaisonFluidWaterSteam;
package Junctions "Junction comparison benches"
  extends ThermoSysPro.UsersGuide.Documentation.ThermoSysProPackageIcon;

  partial model PartialComparison "Common assertions on every active port"
    parameter Integer nPorts(min=1);
    parameter Real relativeTolerance=1e-6;
    parameter Real pressureAbsoluteTolerance(unit="Pa")=1;
    parameter Real flowAbsoluteTolerance(unit="kg/s")=1e-6;
    parameter Real enthalpyAbsoluteTolerance(unit="J/kg")=0.1;
    Real fluidQ[nPorts];
    Real fluidP[nPorts];
    Real fluidH[nPorts];
    Real waterSteamQ[nPorts];
    Real waterSteamP[nPorts];
    Real waterSteamH[nPorts];
  equation
    for i in 1:nPorts loop
      assert(ComparaisonFluidWaterSteam.isClose(fluidQ[i], waterSteamQ[i], relativeTolerance, flowAbsoluteTolerance), "Junction: Q mismatch on port " + String(i));
      assert(ComparaisonFluidWaterSteam.isClose(fluidP[i], waterSteamP[i], relativeTolerance, pressureAbsoluteTolerance), "Junction: P mismatch on port " + String(i));
      assert(ComparaisonFluidWaterSteam.isClose(fluidH[i], waterSteamH[i], relativeTolerance, enthalpyAbsoluteTolerance), "Junction: h mismatch on port " + String(i));
    end for;
  end PartialComparison;
end Junctions;
