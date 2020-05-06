within Dynawo.Electrical.Controls.WECC;

/*
* Copyright (c) 2015-2020, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source time domain simulation tool for power systems.
*/


model REGC_GeneratorControl "WECC PV Generator Control REGC"

  import Modelica;
  import Dynawo;

  extends Parameters.Params_GeneratorControl;

  //Inputs
  Modelica.Blocks.Interfaces.RealInput idCmdPu(start = Id0Pu) "Id setpoint from electrical control in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-168, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iqCmdPu(start = Iq0Pu) "Iq setpoint from electrical control in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-168, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput UPu(start = UInj0Pu) "Inverter terminal voltage magnitude in pu" annotation(
    Placement(visible = true, transformation(origin = {-168, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-59, 111}, extent = {{-9, -9}, {9, 9}}, rotation = -90)));

  // Outputs
  Modelica.Blocks.Interfaces.RealOutput idRefPu(start = Id0Pu) "Id setpoint to injector in p.u (injector convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {158, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iqRefPu(start = -Iq0Pu) "Iq setpoint to injector in p.u (injector convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {158, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput FRTon "Boolean signal for iq ramp after fault: true if FRT detected, false otherwise " annotation(
    Placement(visible = true, transformation(origin = {-168, 126}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 1.77636e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  //Blocks
  Modelica.Blocks.Sources.BooleanConstant RateFlag_const(k = RateFlag)  annotation(
    Placement(visible = true, transformation(origin = {-36, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder UPu_filt(T = Tfltr, k = 1, y(fixed = true, start = UInj0Pu), y_start = UInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {-102, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch VDependencySwitch annotation(
    Placement(visible = true, transformation(origin = {4, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Unom_fix1(k = UInj0Pu)  annotation(
    Placement(visible = true, transformation(origin = {-36, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product Pcmd annotation(
    Placement(visible = true, transformation(origin = {-102, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division IdrefPu annotation(
    Placement(visible = true, transformation(origin = {114, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain IqrefPu(k = -1) annotation(
    Placement(visible = true, transformation(origin = {62, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter UPu_NonZero(limitsAtInit = true, uMax = 999, uMin = 0.01)  annotation(
    Placement(visible = true, transformation(origin = {-66, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.RateLimFirstOrderFreeze Iqcmd_Filt(T = Tg, initType = Modelica.Blocks.Types.Init.SteadyState, use_rateLim = true, y_start = Iq0Pu)  annotation(
    Placement(visible = true, transformation(origin = {4, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Iqrmax_const(k = Iqrmax) annotation(
    Placement(visible = true, transformation(origin = {-116, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Iqrmin_const(k = Iqrmin) annotation(
    Placement(visible = true, transformation(origin = {-116, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.RateLimFirstOrderFreeze Pcmd_Filt(T = Tg, k = 1, use_rateLim = true, y_start = Id0Pu*UInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {74, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant rrpwr_pos_const(k = rrpwr) annotation(
    Placement(visible = true, transformation(origin = {44, -64}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant rrpwr_neg_const(k = -rrpwr) annotation(
    Placement(visible = true, transformation(origin = {44, -92}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switchIqmax annotation(
    Placement(visible = true, transformation(origin = {-48, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switchIqmin annotation(
    Placement(visible = true, transformation(origin = {-48, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constMaxFix(k = 9999)  annotation(
    Placement(visible = true, transformation(origin = {-90, 68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constMinFix(k = -9999) annotation(
    Placement(visible = true, transformation(origin = {-90, 18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.MathBoolean.FallingEdgeDelay fallingEdge(delayTime = max(abs(1/Iqrmax),abs(1/Iqrmin)))  annotation(
    Placement(visible = true, transformation(origin = {-98, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

protected

  parameter Types.VoltageModulePu UInj0Pu "Start value of voltage amplitude at injector terminal in p.u";
  parameter Types.CurrentModulePu Id0Pu "Start value of d-component current at injector terminal in p.u (injector convention) (base SNom)";
  parameter Types.CurrentModulePu Iq0Pu "Start value of q-component current at injector terminal in p.u (injector convention) (base SNom)";

equation

  connect(fallingEdge.y, switchIqmin.u2) annotation(
    Line(points = {{-86, 126}, {-74, 126}, {-74, 26}, {-60, 26}, {-60, 26}}, color = {255, 0, 255}));
  connect(fallingEdge.y, switchIqmax.u2) annotation(
    Line(points = {{-86, 126}, {-74, 126}, {-74, 76}, {-60, 76}, {-60, 76}}, color = {255, 0, 255}));
  connect(FRTon, fallingEdge.u) annotation(
    Line(points = {{-168, 126}, {-114, 126}, {-114, 126}, {-112, 126}}, color = {255, 0, 255}));
  connect(idCmdPu, Pcmd.u1) annotation(
    Line(points = {{-168, -74}, {-114, -74}}, color = {0, 0, 127}));
  connect(UPu, UPu_filt.u) annotation(
    Line(points = {{-168, -30}, {-114, -30}}, color = {0, 0, 127}));
  connect(iqCmdPu, Iqcmd_Filt.u) annotation(
    Line(points = {{-168, 50}, {-8, 50}}, color = {0, 0, 127}));
  connect(constMinFix.y, switchIqmin.u3) annotation(
    Line(points = {{-83, 18}, {-60, 18}}, color = {0, 0, 127}));
  connect(constMaxFix.y, switchIqmax.u3) annotation(
    Line(points = {{-83, 68}, {-60, 68}}, color = {0, 0, 127}));
  connect(switchIqmin.y, Iqcmd_Filt.dy_min) annotation(
    Line(points = {{-36, 26}, {-26, 26}, {-26, 44}, {-8, 44}, {-8, 44}}, color = {0, 0, 127}));
  connect(Iqrmin_const.y, switchIqmin.u1) annotation(
    Line(points = {{-105, 34}, {-60, 34}}, color = {0, 0, 127}));
  connect(Iqrmax_const.y, switchIqmax.u1) annotation(
    Line(points = {{-105, 84}, {-60, 84}}, color = {0, 0, 127}));
  connect(switchIqmax.y, Iqcmd_Filt.dy_max) annotation(
    Line(points = {{-36, 76}, {-26, 76}, {-26, 58}, {-8, 58}, {-8, 56}}, color = {0, 0, 127}));
  connect(Iqcmd_Filt.y, IqrefPu.u) annotation(
    Line(points = {{15, 50}, {49, 50}}, color = {0, 0, 127}));
  connect(IqrefPu.y, iqRefPu) annotation(
    Line(points = {{73, 50}, {158, 50}}, color = {0, 0, 127}));
  connect(rrpwr_neg_const.y, Pcmd_Filt.dy_min) annotation(
    Line(points = {{53, -92}, {56, -92}, {56, -86}, {62, -86}}, color = {0, 0, 127}));
  connect(rrpwr_pos_const.y, Pcmd_Filt.dy_max) annotation(
    Line(points = {{52, -64}, {56, -64}, {56, -74}, {62, -74}, {62, -74}}, color = {0, 0, 127}));
  connect(Pcmd.y, Pcmd_Filt.u) annotation(
    Line(points = {{-90, -80}, {62, -80}}, color = {0, 0, 127}));
  connect(Pcmd_Filt.y, IdrefPu.u1) annotation(
    Line(points = {{85, -80}, {102, -80}}, color = {0, 0, 127}));
  connect(RateFlag_const.y, VDependencySwitch.u2) annotation(
    Line(points = {{-25, -14}, {-20, -14}, {-20, -38}, {-8, -38}}, color = {255, 0, 255}));
  connect(VDependencySwitch.y, IdrefPu.u2) annotation(
    Line(points = {{15, -38}, {26, -38}, {26, -106}, {88, -106}, {88, -92}, {102, -92}}, color = {0, 0, 127}));
  connect(IdrefPu.y, idRefPu) annotation(
    Line(points = {{125, -86}, {158, -86}}, color = {0, 0, 127}));
  connect(VDependencySwitch.y, Pcmd.u2) annotation(
    Line(points = {{15, -38}, {24, -38}, {24, -106}, {-122, -106}, {-122, -87}, {-114, -87}, {-114, -86}}, color = {0, 0, 127}));
  connect(Unom_fix1.y, VDependencySwitch.u3) annotation(
    Line(points = {{-25, -46}, {-8, -46}}, color = {0, 0, 127}));
  connect(UPu_NonZero.y, VDependencySwitch.u1) annotation(
    Line(points = {{-54, -30}, {-8, -30}}, color = {0, 0, 127}));
  connect(UPu_filt.y, UPu_NonZero.u) annotation(
    Line(points = {{-90, -30}, {-78, -30}, {-78, -30}, {-78, -30}}, color = {0, 0, 127}));

  annotation(preferredView = "diagram",
Documentation(info="<html>

<p> The block calculates the final setpoints for Iq and Id while considering ramp rates for reactive current and active current (or active power if RampFlag is true).


</ul> </p></html>"),
    Diagram(coordinateSystem(initialScale = 0.2, extent = {{-150, -130}, {150, 180}}), graphics = {Text(origin = {52, 36}, extent = {{-22, 8}, {38, -32}}, textString = "Reactive power convention:
 negative reactive current refers to
  reactive power injection (posititve)")}),
  Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-27, 20}, extent = {{-63, 18}, {121, -56}}, textString = "Generator Control"), Text(origin = {134, 78}, extent = {{-22, 16}, {36, -28}}, textString = "idRefPu"), Text(origin = {134, -40}, extent = {{-22, 16}, {36, -32}}, textString = "iqRefPu"), Text(origin = {-28, 103}, extent = {{-18, 15}, {6, -1}}, textString = "UPu")}));

end REGC_GeneratorControl;
