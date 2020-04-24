within Dynawo.Electrical.Photovoltaics.WECC;

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

model PVCurrentSource "WECC PV model with a current source as interface with the grid"

  import Modelica;
  import Dynawo;

  parameter Types.ApparentPowerModule SNom "Nominal apparent power in MVA";
  parameter Types.PerUnit RPu "Resistance of equivalent branch connection to the grid in p.u (base SnRef)";
  parameter Types.PerUnit XPu "Reactance of equivalent branch connection to the grid in p.u (base SnRef)";

  // At regulated bus (from Load Flow)
  parameter Types.PerUnit P0Pu "Start value of active power at regulated bus in p.u (receptor convention) (base SnRef)";
  parameter Types.PerUnit Q0Pu "Start value of reactive power at regulated bus in p.u (receptor convention) (base SnRef)";
  parameter Types.PerUnit U0Pu "Start value of voltage magnitude at regulated bus in p.u.";
  parameter Types.Angle UPhase0 "Start value of voltage phase angle at regulated bus in rad";
  // At regulated bus (generator convention) (base SNom)
  final parameter Types.PerUnit PGen0Pu = - P0Pu * SystemBase.SnRef / SNom;
  final parameter Types.PerUnit QGen0Pu = - Q0Pu * SystemBase.SnRef / SNom;

  // Terminal
  Dynawo.Connectors.ACPower terminal(V(re(start = u0Pu.re), im(start = u0Pu.im)), i(re(start = i0Pu.re), im(start = i0Pu.im))) annotation(
    Placement(visible = true, transformation(origin = {-106, 40}, extent = {{-2, -2}, {2, 2}}, rotation = 0), iconTransformation(origin = {100, 8.88178e-16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Inputs_setpoints
  Modelica.Blocks.Interfaces.RealInput PRefPu(start = PGen0Pu) "Active power reference in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-102, -27}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput QRefPu(start = QGen0Pu) "Reactive power reference in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-102, -41}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput OmegaRefPu(start = SystemBase.omegaRef0Pu) "Frequency reference in p.u (base omegaNom)" annotation(
    Placement(visible = true, transformation(origin = {-102, -9}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

   // Grid connexion elements
  Dynawo.Electrical.Buses.Bus bus annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Lines.Line line(RPu = RPu, XPu = XPu, BPu = 0, GPu = 0) annotation(
    Placement(visible = true, transformation(origin = {-14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Blocks:
  Dynawo.Electrical.Controls.WECC.REPC_PlantControl wecc_repc(Ddn = 20, Dup = 0.001, FreqFlag = true, Kc = 0, Ki = 1.5, Kig = 2.36, Kp = 0.1, Kpg = 0.05, PMax = 1, PMin = 0, QMax = 0.4, QMin = -0.4, Rc = RPu, RefFlag = true, Tfltr = 0.04, Tft = 0, Tfv = 0.1, Tlag = 0.1, Tp = 0.04, VcompFlag = false, Vfrz = 0.0, Xc = XPu, dbd = 0.01, eMax = 999, eMin = -999, fdbd1 = 0.004, fdbd2 = 1, feMax = 999, feMin = -999, iInj0Pu = iInj0Pu, u0Pu = u0Pu, U0Pu = U0Pu, PInj0Pu = PInj0Pu, PGen0Pu = PGen0Pu, QInj0Pu = QInj0Pu, QGen0Pu = QGen0Pu) annotation(
    Placement(visible = true, transformation(origin = {-47, -24}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Dynawo.Electrical.Controls.WECC.REEC_ElectricalControl wecc_reec(Imax = 1.05, Iqh1 = 2, Iql1 = -2, Kqi = 0.5, Kqp = 1, Kqv = 2, Kvi = 1, Kvp = 1, PfFlag = false, Pmax = 1, Pmin = 0, PqFlag = false, QFlag = true, Qmax = 0.4, Qmin = -0.4, Tiq = 0.02, Tp = 0.04, Tpord = 0.02, Trv = 0.02, VFlag = true, Vdip = 0.9, Vmax = 1.1, Vmin = 0.9, Vref0 = 1, Vup = 1.1, dPmax = 999, dPmin = -999, dbd1 = -0.1, dbd2 = 0.1, PInj0Pu = PInj0Pu, QInj0Pu = QInj0Pu, UInj0Pu = UInj0Pu, PF0 = PF0) annotation(
    Placement(visible = true, transformation(origin = {8.30175, -24.3447}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Dynawo.Electrical.Controls.WECC.REGC_GeneratorControl wecc_regc(Iqrmax = 20, Iqrmin = -20, RateFlag = false, Tfltr = 0.02, Tg = 0.02, rrpwr = 10, U0Pu = UInj0Pu, Id0Pu = Id0Pu, Iq0Pu = Iq0Pu) annotation(
    Placement(visible = true, transformation(origin = {65.8052, -24.3158}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Dynawo.Electrical.Sources.InjectorIDQ injector(Id0Pu = Id0Pu, Iq0Pu = -Iq0Pu, P0Pu = - PInj0Pu * (SNom / SystemBase.SnRef), Q0Pu = - QInj0Pu * (SNom / SystemBase.SnRef), SNom = SNom, U0Pu = UInj0Pu, UPhase0 = UPhaseInj0, i0Pu = -iInj0Pu * (SNom / SystemBase.SnRef), u0Pu = uInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {72, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant OmegaRef(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-101, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Dynawo.Electrical.Controls.PLL.PLL pll(Ki = 20, Kp = 3, OmegaMaxPu = 1.5, OmegaMinPu = 0.5, u0Pu = u0Pu) annotation(
    Placement(visible = true, transformation(origin = {-86, 6}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));

  // Outputs for visualization
  Types.PerUnit PGenPu "Active power at regulated bus in p.u (generator convention) (base SnRef)";
  Types.PerUnit QGenPu "Reactive power at regulated bus in p.u (generator convention) (base SnRef)";

protected

  // At regulated bus (receptor convention) (base SnRef)
  final parameter Types.ComplexPerUnit u0Pu = ComplexMath.fromPolar(U0Pu, UPhase0);
  final parameter Types.ComplexPerUnit s0Pu = Complex(P0Pu, Q0Pu);
  final parameter Types.ComplexPerUnit i0Pu = ComplexMath.conj(s0Pu / u0Pu);
  // At inverter terminal (generator convention) (base SNom)
  final parameter Types.ComplexPerUnit iInj0Pu = -i0Pu * SystemBase.SnRef / SNom;
  final parameter Types.ComplexPerUnit ZPu = Complex(RPu, XPu);
  final parameter Types.ComplexPerUnit uInj0Pu = u0Pu -  ZPu * iInj0Pu;
  final parameter Types.ComplexPerUnit sInj0Pu = uInj0Pu * ComplexMath.conj(iInj0Pu);
  final parameter Types.PerUnit UInj0Pu = ComplexMath.'abs'(uInj0Pu);
  final parameter Types.Angle UPhaseInj0 = ComplexMath.arg(uInj0Pu);
  final parameter Types.PerUnit PInj0Pu = ComplexMath.real(sInj0Pu);
  final parameter Types.PerUnit QInj0Pu = ComplexMath.imag(sInj0Pu);
  final parameter Types.PerUnit PF0 = PInj0Pu / max(ComplexMath.'abs'(sInj0Pu), 0.001);
  final parameter Types.PerUnit Id0Pu = cos(UPhase0) * iInj0Pu.re + sin(UPhase0) * iInj0Pu.im;
  final parameter Types.PerUnit Iq0Pu = sin(UPhase0) * iInj0Pu.re - cos(UPhase0) * iInj0Pu.im;

equation
  connect(wecc_repc.QInjRefPu, wecc_reec.QInjRefPu) annotation(
    Line(points = {{-28, -34}, {-12, -34}, {-12, -36}, {-12, -36}, {-12, -36}}, color = {0, 0, 127}));
  connect(bus.terminal, line.terminal1) annotation(
    Line(points = {{-100, 40}, {-24, 40}, {-24, 40}, {-24, 40}}, color = {0, 0, 255}));
  connect(line.terminal2, injector.terminal) annotation(
    Line(points = {{-4, 40}, {60, 40}, {60, 40}, {60, 40}}, color = {0, 0, 255}));
  connect(pll.omegaPLLPu, wecc_repc.OmegaPu) annotation(
    Line(points = {{-82, 0}, {-84, 0}, {-84, -10}, {-66, -10}, {-66, -10}}, color = {0, 0, 127}));
  connect(wecc_regc.iqRefPu, injector.iqPu) annotation(
    Line(points = {{86, -36}, {98, -36}, {98, 36}, {84, 36}, {84, 36}, {84, 36}}, color = {0, 0, 127}));
  connect(wecc_regc.idRefPu, injector.idPu) annotation(
    Line(points = {{86, -14}, {92, -14}, {92, 26}, {84, 26}, {84, 26}}, color = {0, 0, 127}));
  connect(wecc_reec.iqCmdPu, wecc_regc.iqCmdPu) annotation(
    Line(points = {{28, -36}, {46, -36}, {46, -36}, {46, -36}}, color = {0, 0, 127}));
  connect(wecc_reec.FRTon, wecc_regc.FRTon) annotation(
    Line(points = {{28, -24}, {46, -24}, {46, -24}, {46, -24}}, color = {255, 0, 255}));
  connect(wecc_reec.idCmdPu, wecc_regc.idCmdPu) annotation(
    Line(points = {{28, -14}, {44, -14}, {44, -14}, {46, -14}}, color = {0, 0, 127}));
  connect(wecc_repc.PInjRefPu, wecc_reec.PInjRefPu) annotation(
    Line(points = {{-28, -14}, {-12, -14}, {-12, -14}, {-12, -14}}, color = {0, 0, 127}));
  connect(QRefPu, wecc_repc.QRefPu_PC) annotation(
    Line(points = {{-102, -40}, {-92, -40}, {-92, -34}, {-66, -34}, {-66, -34}}, color = {0, 0, 127}));
  connect(PRefPu, wecc_repc.PRefPu_PC) annotation(
    Line(points = {{-102, -26}, {-92, -26}, {-92, -28}, {-66, -28}, {-66, -28}}, color = {0, 0, 127}));
  connect(OmegaRefPu, wecc_repc.OmegaRefPu) annotation(
    Line(points = {{-102, -8}, {-92, -8}, {-92, -16}, {-66, -16}, {-66, -16}}, color = {0, 0, 127}));
  connect(terminal, bus.terminal) annotation(
    Line(points = {{-106, 40}, {-100, 40}}, color = {0, 0, 255}));
  connect(OmegaRef.y, pll.omegaRefPu) annotation(
    Line(points = {{-95.5, 19}, {-90, 19}, {-90, 12}}, color = {0, 0, 127}));
  connect(wecc_regc.UPu, injector.UPu) annotation(
    Line(points = {{55, -4}, {55, 24}, {60.5, 24}}, color = {0, 0, 127}));
  connect(injector.QInjPu, wecc_reec.QInjPu) annotation(
    Line(points = {{60.5, 31.5}, {-2, 31.5}, {-2, -5}}, color = {0, 0, 127}));
  connect(injector.PInjPu, wecc_reec.PInjPu) annotation(
    Line(points = {{60.5, 28}, {8, 28}, {8, -5}}, color = {0, 0, 127}));
  connect(injector.UPu, wecc_reec.UPu) annotation(
    Line(points = {{60.5, 24}, {19, 24}, {19, -5}}, color = {0, 0, 127}));
  // Outputs for visualization
  PGenPu = -ComplexMath.real(line.terminal1.V * ComplexMath.conj(line.terminal1.i));
  QGenPu = -ComplexMath.imag(line.terminal1.V * ComplexMath.conj(line.terminal1.i));
  // Connections with no graphical view
  pll.uPu = line.terminal1.V;
  wecc_repc.uPu = line.terminal1.V;
  wecc_repc.iPu = - line.terminal1.i * SystemBase.SnRef / SNom;
  wecc_repc.PRegPu = PGenPu * SystemBase.SnRef / SNom;
  wecc_repc.QRegPu = QGenPu * SystemBase.SnRef / SNom;
// switchOffSignals assignment
  line.switchOffSignal1.value = false;
  line.switchOffSignal2.value = false;
  injector.switchOffSignal1.value = false;
  injector.switchOffSignal2.value = false;
  injector.switchOffSignal3.value = false;
  annotation(
    Documentation(preferredView = "diagram",
    info = "<html>
<p> This block contains the generic WECC PV model according to (in case page cannot be found, copy link in browser): <a href='https://www.wecc.biz/Reliability/WECC%20Solar%20Plant%20Dynamic%20Modeling%20Guidelines.pdf/'>https://www.wecc.biz/Reliability/WECC%20Solar%20Plant%20Dynamic%20Modeling%20Guidelines.pdf </a> </p></html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-24, 11}, extent = {{-48, 27}, {98, -53}}, textString = "WECC PV")}));
end PVCurrentSource;
