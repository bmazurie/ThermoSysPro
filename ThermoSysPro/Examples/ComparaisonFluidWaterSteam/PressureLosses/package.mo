within ThermoSysPro.Examples.ComparaisonFluidWaterSteam;
package PressureLosses
  "Pressure-loss comparison benches"
  extends ThermoSysPro.UsersGuide.Documentation.ThermoSysProPackageIcon;

  partial model PartialComparison "Common Q/P/h comparison tolerances"
    parameter Real relativeTolerance = 1e-6;
    parameter Real pressureAbsoluteTolerance(unit="Pa") = 1;
    parameter Real flowAbsoluteTolerance(unit="kg/s") = 1e-6;
    parameter Real enthalpyAbsoluteTolerance(unit="J/kg") = 0.1;
  end PartialComparison;
end PressureLosses;
