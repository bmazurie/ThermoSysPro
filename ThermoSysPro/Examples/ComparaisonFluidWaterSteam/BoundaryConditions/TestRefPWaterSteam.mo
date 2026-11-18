within ThermoSysPro.Examples.ComparaisonFluidWaterSteam.BoundaryConditions;
model TestRefPWaterSteam
  "WaterSteam equivalent of Fluid TestRefP"
  extends ThermoSysPro.UsersGuide.Icons.Example;

  final parameter Units.SI.AbsolutePressure referencePressure=20e5;
  final parameter Units.SI.Temperature sourceTemperature=423.15;
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink(h0=633e3) annotation (Placement(transformation(extent={{66,-10},{86,10}})));
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ(
    h0=ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(
      referencePressure, sourceTemperature, 0)) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(
    k=referencePressure) annotation (Placement(transformation(extent={{-30,38},{-10,58}})));
equation
  connect(sink.C, pipePressureLoss.C2) annotation (Line(points={{66,0},{52,0}}, color={0,0,0}));
  connect(refP.C2, pipePressureLoss.C1) annotation (Line(points={{10,0},{32,0}}, color={0,0,0}));
  connect(sourceQ.C, refP.C1) annotation (Line(points={{-46,0},{-10,0}}, color={0,0,0}));
  connect(constante.y, refP.IPressure) annotation (Line(points={{-9,48},{0,48},{0,11}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=1, Tolerance=1e-6), Documentation(info="
WaterSteam SourceQ accepts enthalpy rather than temperature. Its h0 is computed
from the Fluid bench point (P=2 MPa, T=423.15 K), preserving the same (P,T)
boundary point.
"));
end TestRefPWaterSteam;
