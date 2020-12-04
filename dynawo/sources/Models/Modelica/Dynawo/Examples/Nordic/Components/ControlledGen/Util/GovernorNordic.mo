within Dynawo.Examples.Nordic.Components.ControlledGen.Util;


model GovernorNordic
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
  
  parameter Real sigma;
  
  Connectors.ImPin PmPuPin(value(start = Pm0Pu));
  
  Modelica.Blocks.Interfaces.RealInput omegaPu(start = 1) annotation(
    Placement(visible = true, transformation(origin = {-210, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PGenPuPNom(start = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {-210, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PmPu(start = Pm0Pu) "Synchronous machine mechanical power in p.u (base PNom)" annotation(
    Placement(visible = true, transformation(origin = {214, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain dHdivTw(k = 1) annotation(
    Placement(visible = true, transformation(origin = {44, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator waterFlow(k = 1, y_start = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {76, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dH(k1 = -1, k2 = 1) annotation(
    Placement(visible = true, transformation(origin = {12, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Hs_const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-26, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division FlowDivGateOpening annotation(
    Placement(visible = true, transformation(origin = {-82, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add GovOut_filtAdd(k1 = +1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {94, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain GovOut_filtGain(k = 5) annotation(
    Placement(visible = true, transformation(origin = {124, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter GovOut_filtLim(limitsAtInit = true, uMax = 0.1, uMin = -0.1) annotation(
    Placement(visible = true, transformation(origin = {156, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator GovOut_filt(k = 1, outMax = 1, outMin = 0, y_start = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {190, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add GovOut(k1 = +1, k2 = +1) annotation(
    Placement(visible = true, transformation(origin = {54, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain GovKp(k = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain GovKi(k = 0.4) annotation(
    Placement(visible = true, transformation(origin = {-12, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator GovInt(k = 1, y_start = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {18, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dOmegaPlusDroop(k1 = 1, k2 = 1) annotation(
    Placement(visible = true, transformation(origin = {-48, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant OmegaRefPu_const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-202, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product HeadWater annotation(
    Placement(visible = true, transformation(origin = {-38, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product Pmech annotation(
    Placement(visible = true, transformation(origin = {148, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dOmega(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-126, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Pm0Pu_const(k = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {-202, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 2, k = 1, y_start = Pm0Pu) annotation(
    Placement(visible = true, transformation(origin = {-166, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dP(k1 = 1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-126, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain dPmulDroop(k = sigma) annotation(
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //protected
  parameter Modelica.SIunits.PerUnit Pm0Pu(fixed = false);
equation
 connect(Pm0Pu_const.y, dP.u1) annotation(
    Line(points = {{-191, 26}, {-138, 26}}, color = {0, 0, 127}));
 connect(dHdivTw.y, waterFlow.u) annotation(
    Line(points = {{55, -40}, {64, -40}}, color = {0, 0, 127}));
 connect(dH.y, dHdivTw.u) annotation(
    Line(points = {{23, -40}, {29, -40}, {29, -40}, {31, -40}}, color = {0, 0, 127}));
 connect(waterFlow.y, Pmech.u2) annotation(
    Line(points = {{87, -40}, {97, -40}, {97, -46}, {135, -46}}, color = {0, 0, 127}));
 connect(waterFlow.y, FlowDivGateOpening.u1) annotation(
    Line(points = {{87, -40}, {91, -40}, {91, -86}, {-111, -86}, {-111, -28}, {-95, -28}}, color = {0, 0, 127}));
 connect(GovInt.y, GovOut.u2) annotation(
    Line(points = {{29, 46}, {42, 46}}, color = {0, 0, 127}));
 connect(GovKi.y, GovInt.u) annotation(
    Line(points = {{-1, 46}, {6, 46}}, color = {0, 0, 127}));
 connect(GovOut_filtLim.y, GovOut_filt.u) annotation(
    Line(points = {{167, 46}, {175, 46}, {175, 46}, {177, 46}}, color = {0, 0, 127}));
 connect(GovOut_filtGain.y, GovOut_filtLim.u) annotation(
    Line(points = {{135, 46}, {141, 46}, {141, 46}, {143, 46}}, color = {0, 0, 127}));
 connect(GovOut_filt.y, FlowDivGateOpening.u2) annotation(
    Line(points = {{201, 46}, {215, 46}, {215, -10}, {-117, -10}, {-117, -42}, {-97.5, -42}, {-97.5, -40}, {-94, -40}}, color = {0, 0, 127}));
 connect(GovOut_filt.y, GovOut_filtAdd.u2) annotation(
    Line(points = {{201, 46}, {215, 46}, {215, 26}, {71, 26}, {71, 40}, {81, 40}, {81, 40}}, color = {0, 0, 127}));
  connect(PmPuPin.value, PmPu) annotation(
    Line);
 connect(Pmech.y, PmPu) annotation(
    Line(points = {{159, -40}, {205, -40}, {205, -40}, {213, -40}}, color = {0, 0, 127}));
 connect(HeadWater.y, Pmech.u1) annotation(
    Line(points = {{-27, -34}, {-13, -34}, {-13, -18}, {127, -18}, {127, -34}, {135, -34}, {135, -34}}, color = {0, 0, 127}));
 connect(GovOut_filtAdd.y, GovOut_filtGain.u) annotation(
    Line(points = {{105, 46}, {109, 46}, {109, 46}, {111, 46}}, color = {0, 0, 127}));
 connect(GovOut.y, GovOut_filtAdd.u1) annotation(
    Line(points = {{65, 52}, {81, 52}, {81, 52}, {81, 52}}, color = {0, 0, 127}));
 connect(GovKp.y, GovOut.u1) annotation(
    Line(points = {{1, 82}, {34, 82}, {34, 58}, {42, 58}}, color = {0, 0, 127}));
 connect(Hs_const.y, dH.u2) annotation(
    Line(points = {{-15, -66}, {-11, -66}, {-11, -46}, {-1, -46}, {-1, -46}}, color = {0, 0, 127}));
 connect(HeadWater.y, dH.u1) annotation(
    Line(points = {{-27, -34}, {-1, -34}, {-1, -34}, {-1, -34}}, color = {0, 0, 127}));
 connect(dOmegaPlusDroop.y, GovKp.u) annotation(
    Line(points = {{-37, 46}, {-30, 46}, {-30, 82}, {-22, 82}}, color = {0, 0, 127}));
 connect(dOmegaPlusDroop.y, GovKi.u) annotation(
    Line(points = {{-37, 46}, {-24, 46}}, color = {0, 0, 127}));
 connect(FlowDivGateOpening.y, HeadWater.u1) annotation(
    Line(points = {{-71, -34}, {-67, -34}, {-67, -28}, {-51, -28}, {-51, -28}}, color = {0, 0, 127}));
 connect(FlowDivGateOpening.y, HeadWater.u2) annotation(
    Line(points = {{-71, -34}, {-67, -34}, {-67, -40}, {-51, -40}, {-51, -40}}, color = {0, 0, 127}));
 connect(dPmulDroop.y, dOmegaPlusDroop.u2) annotation(
    Line(points = {{-75, 20}, {-73, 20}, {-73, 40}, {-61, 40}}, color = {0, 0, 127}));
 connect(dOmega.y, dOmegaPlusDroop.u1) annotation(
    Line(points = {{-115, 66}, {-73, 66}, {-73, 52}, {-61, 52}}, color = {0, 0, 127}));
 connect(dP.y, dPmulDroop.u) annotation(
    Line(points = {{-115, 20}, {-99, 20}, {-99, 20}, {-99, 20}}, color = {0, 0, 127}));
 connect(omegaPu, dOmega.u2) annotation(
    Line(points = {{-210, 60}, {-138, 60}}, color = {0, 0, 127}));
 connect(OmegaRefPu_const.y, dOmega.u1) annotation(
    Line(points = {{-191, 96}, {-148, 96}, {-148, 72}, {-138, 72}}, color = {0, 0, 127}));
 connect(firstOrder1.y, dP.u2) annotation(
    Line(points = {{-155, -10}, {-149, -10}, {-149, 14}, {-138, 14}}, color = {0, 0, 127}));
  connect(PGenPuPNom, firstOrder1.u) annotation(
    Line(points = {{-210, -10}, {-178, -10}}, color = {0, 0, 127}));
	
  annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 120}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-60, 20}, {60, -20}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
	
end GovernorNordic;
