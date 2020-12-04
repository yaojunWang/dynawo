within Dynawo.Examples.Nordic.Components.ControlledGen.Util;


model ExciterAvrPssOelNordic
  
/*
* Copyright (c) 2015-2019, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source time domain simulation tool for power systems.
*/
  
  import Modelica;
  import Dynawo.Connectors;
  
  parameter Real G;
  parameter Real Ta;
  parameter Real Tb;
  parameter Real L2;
  parameter Real Kp;
  parameter Real Tw;
  parameter Real T1;
  parameter Real T2;
  parameter Real L1;
  parameter Real r;
  parameter Real f;
  parameter Real IfLimPu;
  
  Modelica.Blocks.Interfaces.RealInput UStatorPu(start = UStator0Pu) annotation(
    Placement(visible = true, transformation(origin = {-182, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ifPu(start = If0Pu) annotation(
    Placement(visible = true, transformation(origin = {-182, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput efdPu(start = Efd0Pu) annotation(
    Placement(visible = true, transformation(origin = {228, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Connectors.ImPin efdPuPin(value(start = Efd0Pu));
  Modelica.Blocks.Math.Min dU_OEL_min annotation(
    Placement(visible = true, transformation(origin = {14, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 dU(k1 = 1, k2 = -1, k3 = 1) annotation(
    Placement(visible = true, transformation(origin = {-126, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant URefPu_const(k = UsRef0Pu) annotation(
    Placement(visible = true, transformation(origin = {-174, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction dOmega_filt1(a = {Tw, 1}, b = {Kp, 0}, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-92, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction dOmega_filt2(a = {T2, 1}, b = {T1, 1}, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-56, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction dOmega_filt3(a = {T2, 1}, b = {T1, 1}, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-20, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter dOmega_filt3_minMax(limitsAtInit = true, uMax = 0.01, uMin = -0.01) annotation(
    Placement(visible = true, transformation(origin = {12, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch_OEL annotation(
    Placement(visible = true, transformation(origin = {-26, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold = 0) annotation(
    Placement(visible = true, transformation(origin = {-64, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dIf(k1 = -1, k2 = 1) annotation(
    Placement(visible = true, transformation(origin = {-124, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain dIf_minus(k = -1) annotation(
    Placement(visible = true, transformation(origin = {-88, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant iFLimPu_const(k = IfLimPu) annotation(
    Placement(visible = true, transformation(origin = {-172, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain kMulDU(k = G) annotation(
    Placement(visible = true, transformation(origin = {48, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OELFunction oELFunction1(f = f, r = r, y_start = -1) annotation(
    Placement(visible = true, transformation(origin = {-158, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain efd_filtGain(k = 10) annotation(
    Placement(visible = true, transformation(origin = {150, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add efd_filtAdd(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {118, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator efd_filtInt(k = 1, outMax = L2, outMin = 0, y_start = Efd0Pu) annotation(
    Placement(visible = true, transformation(origin = {186, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omegaPu annotation(
    Placement(visible = true, transformation(origin = {-182, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add dOmega(k1 = -1, k2 = 1) annotation(
    Placement(visible = true, transformation(origin = {-124, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant OmegaRefPu_const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-174, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator timer(k = 1, outMax = 99, outMin = L1, y_start = L1) annotation(
    Placement(visible = true, transformation(origin = {-110, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction leadLag(a = {20, 1}, b = {10, 1}, initType = Modelica.Blocks.Types.Init.NoInit, x(fixed = true, start = Efd0Pu), y_start = Efd0Pu)  annotation(
    Placement(visible = true, transformation(origin = {82, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

protected
  parameter Modelica.SIunits.PerUnit Efd0Pu(fixed=false);
  parameter Modelica.SIunits.PerUnit UStator0Pu(fixed=false);
  parameter Modelica.SIunits.PerUnit If0Pu(fixed=false);
  final parameter Modelica.SIunits.PerUnit UsRef0Pu = Efd0Pu / G + UStator0Pu;

equation
  connect(leadLag.y, efd_filtAdd.u1) annotation(
    Line(points = {{94, -38}, {104, -38}, {104, -38}, {106, -38}}, color = {0, 0, 127}));
  connect(kMulDU.y, leadLag.u) annotation(
    Line(points = {{60, -38}, {68, -38}, {68, -38}, {70, -38}}, color = {0, 0, 127}));
  connect(dOmega_filt3.y, dOmega_filt3_minMax.u) annotation(
    Line(points = {{-8, -88}, {0, -88}, {0, -88}, {0, -88}}, color = {0, 0, 127}));
  connect(dOmega_filt2.y, dOmega_filt3.u) annotation(
    Line(points = {{-44, -88}, {-32, -88}, {-32, -88}, {-32, -88}}, color = {0, 0, 127}));
  connect(dOmega_filt1.y, dOmega_filt2.u) annotation(
    Line(points = {{-80, -88}, {-68, -88}, {-68, -88}, {-68, -88}}, color = {0, 0, 127}));
  connect(dOmega.y, dOmega_filt1.u) annotation(
    Line(points = {{-112, -88}, {-106, -88}, {-106, -88}, {-104, -88}}, color = {0, 0, 127}));
  connect(efdPu, efdPuPin.value) annotation(
    Line);
  connect(efd_filtInt.y, efdPu) annotation(
    Line(points = {{197, -44}, {219, -44}, {219, -44}, {227, -44}}, color = {0, 0, 127}));
  connect(efd_filtAdd.y, efd_filtGain.u) annotation(
    Line(points = {{129, -44}, {137, -44}, {137, -44}, {137, -44}}, color = {0, 0, 127}));
  connect(efd_filtGain.y, efd_filtInt.u) annotation(
    Line(points = {{161, -44}, {171, -44}, {171, -44}, {173, -44}, {173, -44}, {173, -44}}, color = {0, 0, 127}));
  connect(efd_filtInt.y, efd_filtAdd.u2) annotation(
    Line(points = {{197, -44}, {203, -44}, {203, -70}, {93, -70}, {93, -50}, {105, -50}, {105, -50}, {105, -50}, {105, -50}}, color = {0, 0, 127}));
  connect(omegaPu, dOmega.u2) annotation(
    Line(points = {{-182, -108}, {-152, -108}, {-152, -94}, {-136, -94}, {-136, -94}}, color = {0, 0, 127}));
  connect(OmegaRefPu_const.y, dOmega.u1) annotation(
    Line(points = {{-162, -72}, {-152, -72}, {-152, -82}, {-136, -82}, {-136, -82}}, color = {0, 0, 127}));
  connect(dOmega_filt3_minMax.y, dU.u3) annotation(
    Line(points = {{23, -88}, {40, -88}, {40, -64}, {-152, -64}, {-152, -52}, {-138, -52}}, color = {0, 0, 127}));
  connect(realToBoolean.y, switch_OEL.u2) annotation(
    Line(points = {{-53, 22}, {-38, 22}}, color = {255, 0, 255}));
  connect(dIf.y, oELFunction1.u) annotation(
    Line(points = {{-113, 62}, {-109, 62}, {-109, 42}, {-181, 42}, {-181, 22}, {-170, 22}}, color = {0, 0, 127}));
  connect(dU_OEL_min.y, kMulDU.u) annotation(
    Line(points = {{25, -38}, {35, -38}, {35, -38}, {35, -38}}, color = {0, 0, 127}));
  connect(dU.y, dU_OEL_min.u2) annotation(
    Line(points = {{-115, -44}, {2, -44}}, color = {0, 0, 127}));
  connect(switch_OEL.y, dU_OEL_min.u1) annotation(
    Line(points = {{-15, 22}, {-6, 22}, {-6, -32}, {2, -32}}, color = {0, 0, 127}));
  connect(UStatorPu, dU.u2) annotation(
    Line(points = {{-182, -44}, {-138, -44}}, color = {0, 0, 127}));
  connect(URefPu_const.y, dU.u1) annotation(
    Line(points = {{-163, -10}, {-152, -10}, {-152, -36}, {-138, -36}}, color = {0, 0, 127}));
  connect(dU.y, switch_OEL.u3) annotation(
    Line(points = {{-115, -44}, {-47, -44}, {-47, 14}, {-38, 14}}, color = {0, 0, 127}));
  connect(dIf_minus.y, switch_OEL.u1) annotation(
    Line(points = {{-77, 62}, {-47, 62}, {-47, 30}, {-38, 30}}, color = {0, 0, 127}));
  connect(dIf.y, dIf_minus.u) annotation(
    Line(points = {{-113, 62}, {-100, 62}}, color = {0, 0, 127}));
  connect(iFLimPu_const.y, dIf.u1) annotation(
    Line(points = {{-161, 86}, {-151, 86}, {-151, 68}, {-136, 68}}, color = {0, 0, 127}));
  connect(ifPu, dIf.u2) annotation(
    Line(points = {{-182, 56}, {-136, 56}}, color = {0, 0, 127}));
  connect(oELFunction1.y, timer.u) annotation(
    Line(points = {{-148, 22}, {-122, 22}, {-122, 22}, {-122, 22}}, color = {0, 0, 127}));
  connect(timer.y, realToBoolean.u) annotation(
    Line(points = {{-98, 22}, {-76, 22}, {-76, 22}, {-76, 22}}, color = {0, 0, 127}));

annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 120}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-60, 20}, {60, -20}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    uses(Modelica(version = "3.2.3")));
	
end ExciterAvrPssOelNordic;
