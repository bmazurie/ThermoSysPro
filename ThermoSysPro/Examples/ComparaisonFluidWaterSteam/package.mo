within ThermoSysPro.Examples;
package ComparaisonFluidWaterSteam
  "Comparison benches for the Fluid and WaterSteam architectures"
  extends ThermoSysPro.UsersGuide.Documentation.ThermoSysProPackageIcon;

  function isClose "Relative and absolute comparison"
    input Real fluidValue;
    input Real waterSteamValue;
    input Real relativeTolerance = 1e-6;
    input Real absoluteTolerance = 0;
    output Boolean close;
  algorithm
    close := abs(fluidValue - waterSteamValue) <= absoluteTolerance
      + relativeTolerance*max(abs(fluidValue), abs(waterSteamValue));
  end isClose;

  annotation (Documentation(info="
## Fluid/WaterSteam comparisons

Each comparison instantiates an existing `Fluid.Examples.SimpleExamples` model
and a WaterSteam bench with matching boundaries and parameters. Assertions
compare the main physical quantities during simulation.
"));
end ComparaisonFluidWaterSteam;
