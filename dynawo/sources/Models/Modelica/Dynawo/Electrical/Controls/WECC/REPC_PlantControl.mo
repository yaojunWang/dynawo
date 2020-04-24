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

model REPC_PlantControl "WECC PV Plant Control REPC"
  import Modelica;
  import Dynawo;

  extends Parameters.Params_PlantControl;

  // Inputs setpoints
  Modelica.Blocks.Interfaces.RealInput PRefPu_PC(start = PGen0Pu) "Active power setpoint at regulated bus in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-308, -36}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-111, -19}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput QRefPu_PC(start = QGen0Pu) "Reactive power setpoint at regulated bus in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-308, -4}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-111, -59}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput OmegaRefPu(start = SystemBase.omega0Pu) "Frequency setpoint" annotation(
    Placement(visible = true, transformation(origin = {-308, -118}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-111, 41}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Inputs measurements from regulated bus
  Modelica.Blocks.Interfaces.RealInput PRegPu(start = PGen0Pu) "Active power at regulated bus in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-170, -160}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {79, 111}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput QRegPu(start = QGen0Pu) "Reactive power at regulated bus in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-202, -160}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {31, 111}, extent = {{10, 10}, {-10, -10}}, rotation = 90)));
  Modelica.ComplexBlocks.Interfaces.ComplexInput uPu(re(start = u0Pu.re), im(start = u0Pu.im)) "Complex voltage at regulated bus in p.u" annotation(
    Placement(visible = true, transformation(origin = {-236, -156}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {-31, 111}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.ComplexBlocks.Interfaces.ComplexInput iPu(re(start = iInj0Pu.re), im(start = iInj0Pu.im)) "Complex current at regulated bus in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-272, -156}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {-79, 111}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput OmegaPu(start = SystemBase.omega0Pu) "Frequency at regulated bus in p.u (base omegaNom)" annotation(
    Placement(visible = true, transformation(origin = {-140, -160}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {-111, 79}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));

  // Outputs
  Modelica.Blocks.Interfaces.RealOutput PInjRefPu(start = PInj0Pu, fixed = true) "Active power setpoint at inverter terminal in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {210, -73}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput QInjRefPu(start = QInj0Pu, fixed = true) "Reactive power setpoint at inverter terminal in p.u (generator convention) (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {208, 87}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  //Blocks
  Modelica.Blocks.Logical.Switch FreqFlagSwitch annotation(
    Placement(visible = true, transformation(origin = {170, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant FreqFlag_const(k = FreqFlag) annotation(
    Placement(visible = true, transformation(origin = {130, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Pref_lag(T = Tlag, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {130, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Zero(k = 0) annotation(
    Placement(visible = true, transformation(origin = {70, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter Pref_Lim(limitsAtInit = true, uMax = feMax, uMin = feMin) annotation(
    Placement(visible = true, transformation(origin = {70, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID_P(Ti = Kpg / Kig, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.InitPID.SteadyState, k = Kpg, limitsAtInit = true, xi_start = PInj0Pu / Kpg, yMax = PMax, yMin = PMin, y_start = PInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {100, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 PCtrlErr(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {10, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Pbranch_Filt(T = Tp, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = PGen0Pu) annotation(
    Placement(visible = true, transformation(origin = {-50, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter QVErr_Lim(limitsAtInit = true, uMax = eMax, uMin = eMin) annotation(
    Placement(visible = true, transformation(origin = {110, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction QVext_LeadLag(a = {Tfv, 1}, b = {Tft, 1}, initType = Modelica.Blocks.Types.Init.NoInit) annotation(
    Placement(visible = true, transformation(origin = {170, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Zero1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {114, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant RefFlag_const(k = RefFlag) annotation(
    Placement(visible = true, transformation(origin = {-18, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch RefFlagSwitch annotation(
    Placement(visible = true, transformation(origin = {50, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone QVext_dbd(uMax = dbd, uMin = -dbd) annotation(
    Placement(visible = true, transformation(origin = {80, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Qbranch_Filt(T = Tfltr, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = QGen0Pu) annotation(
    Placement(visible = true, transformation(origin = {-50, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add QCtrlErr(k1 = -1) annotation(
    Placement(visible = true, transformation(origin = {10, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add UCtrlErr(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {10, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder Ubranch_Filt(T = Tfltr, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = if VcompFlag == true then URefPu else U0Pu) annotation(
    Placement(visible = true, transformation(origin = {-50, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseControls.calcUPcc calcUPCC1(Rc = Rc, Xc = Xc) annotation(
    Placement(visible = true, transformation(origin = {-174, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch VCompFlagSwitch annotation(
    Placement(visible = true, transformation(origin = {-80, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant VCompFlag_const(k = VcompFlag) annotation(
    Placement(visible = true, transformation(origin = {-130, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add QVCtrlErr annotation(
    Placement(visible = true, transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain GainKc(k = Kc) annotation(
    Placement(visible = true, transformation(origin = {-164, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add wCtrlErr(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-122, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone Frq_dbd(deadZoneAtInit = true, uMax = fdbd2, uMin = -fdbd1) annotation(
    Placement(visible = true, transformation(origin = {-90, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add dPfreq annotation(
    Placement(visible = true, transformation(origin = {30, -118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain dPfreq_down(k = Ddn) annotation(
    Placement(visible = true, transformation(origin = {-42, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain dPfreq_up(k = Dup) annotation(
    Placement(visible = true, transformation(origin = {-42, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter dPfreq_down_lim(limitsAtInit = true, uMax = 0, uMin = -999) annotation(
    Placement(visible = true, transformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter dPfreq_up_lim(limitsAtInit = true, uMax = 999, uMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = PInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {130, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.LimPIDFreeze PID_Q(Td = 0, Ti = Kp / Ki, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.InitPID.InitialState, k = Kp, limitsAtInit = true, xi_start = QInj0Pu / Kp, yMax = QMax, yMin = QMin, y_start = QInj0Pu) annotation(
    Placement(visible = true, transformation(origin = {140, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseControls.VoltageCheck voltage_check1(Vdip = Vfrz, Vup = 999) annotation(
    Placement(visible = true, transformation(origin = {68, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant uRefPu(k = URefPu) annotation(
    Placement(visible = true, transformation(origin = {-82, 128}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

protected

  parameter Types.PerUnit PGen0Pu "Start value of active power at regulated bus in p.u (generator convention) (base SNom)";
  parameter Types.PerUnit QGen0Pu "Start value of reactive power at regulated bus in p.u (generator convention) (base SNom)";
  parameter Types.PerUnit U0Pu "Start value of voltage magnitude at regulated bus in p.u";
  parameter Types.ComplexPerUnit u0Pu "Start value of complex voltage at regulated bus in p.u";
  parameter Types.ComplexPerUnit iInj0Pu "Start value of complex current at regulated bus in p.u (generator convention) (base SNom)";
  parameter Types.PerUnit PInj0Pu "Start value of active power at injector terminal in p.u (generator convention) (base SNom)";
  parameter Types.PerUnit QInj0Pu "Start value of reactive power at injector terminal in p.u (injector convention) (base SNom)";
  final parameter Types.PerUnit URefPu = if VcompFlag == true then sqrt((u0Pu.re + Rc * iInj0Pu.re - Xc * iInj0Pu.im) ^ 2 + (u0Pu.im + Rc * iInj0Pu.im + Xc * iInj0Pu.re) ^ 2) else (U0Pu + Kc * QGen0Pu) "Voltage setpoint for plant level control, calculated depending on VcompFlag";

equation

  connect(iPu, calcUPCC1.iPu) annotation(
    Line(points = {{-272, -156}, {-272, -156}, {-272, 118}, {-184, 118}, {-184, 118}}, color = {85, 170, 255}));
  connect(uRefPu.y, UCtrlErr.u1) annotation(
    Line(points = {{-71, 128}, {-20, 128}, {-20, 100}, {-2, 100}}, color = {0, 0, 127}));
  connect(voltage_check1.freeze, PID_Q.freeze) annotation(
    Line(points = {{80, 34}, {134, 34}, {134, 70}, {134.5, 70}, {134.5, 74}, {133, 74}}, color = {255, 0, 255}));
  connect(calcUPCC1.UPu, QVCtrlErr.u1) annotation(
    Line(points = {{-164, 106}, {-153.8, 106}, {-153.8, 56}, {-141.8, 56}}, color = {0, 0, 127}));
  connect(calcUPCC1.UPuLineDrop, VCompFlagSwitch.u1) annotation(
    Line(points = {{-164, 118}, {-112, 118}, {-112, 96}, {-92, 96}}, color = {0, 0, 127}));
  connect(uPu, calcUPCC1.uPu) annotation(
    Line(points = {{-236, -156}, {-237, -156}, {-237, 106}, {-184, 106}}, color = {85, 170, 255}));
  connect(calcUPCC1.UPu, voltage_check1.Vt) annotation(
    Line(points = {{-164, 106}, {-148, 106}, {-148, 34}, {56, 34}}, color = {0, 0, 127}));
  connect(QVErr_Lim.y, PID_Q.u_s) annotation(
    Line(points = {{122, 86}, {128, 86}}, color = {0, 0, 127}));
  connect(PID_Q.y, QVext_LeadLag.u) annotation(
    Line(points = {{151, 86}, {158, 86}}, color = {0, 0, 127}));
  connect(Zero1.y, PID_Q.u_m) annotation(
    Line(points = {{125, 16}, {140, 16}, {140, 74}}, color = {0, 0, 127}));
  connect(PRegPu, Pbranch_Filt.u) annotation(
    Line(points = {{-170, -160}, {-170, -58}, {-62, -58}}, color = {0, 0, 127}));
  connect(QRegPu, Qbranch_Filt.u) annotation(
    Line(points = {{-202, -160}, {-202, 16}, {-62, 16}}, color = {0, 0, 127}));
  connect(GainKc.u, QRegPu) annotation(
    Line(points = {{-176, 44}, {-202, 44}, {-202, -160}}, color = {0, 0, 127}));
  connect(OmegaPu, wCtrlErr.u2) annotation(
    Line(points = {{-140, -160}, {-141, -160}, {-141, -130}, {-134, -130}}, color = {0, 0, 127}));
  connect(FreqFlagSwitch.y, PInjRefPu) annotation(
    Line(points = {{181, -74}, {197, -74}, {197, -72}, {209, -72}}, color = {0, 0, 127}));
  connect(QVext_LeadLag.y, QInjRefPu) annotation(
    Line(points = {{181, 86}, {208, 86}, {208, 87}}, color = {0, 0, 127}));
  connect(OmegaRefPu, wCtrlErr.u1) annotation(
    Line(points = {{-308, -118}, {-134, -118}}, color = {0, 0, 127}));
  connect(wCtrlErr.y, Frq_dbd.u) annotation(
    Line(points = {{-111, -124}, {-103, -124}, {-103, -124}, {-103, -124}}, color = {0, 0, 127}));
  connect(Frq_dbd.y, dPfreq_down.u) annotation(
    Line(points = {{-79, -124}, {-69, -124}, {-69, -90}, {-55, -90}, {-55, -90}}, color = {0, 0, 127}));
  connect(Frq_dbd.y, dPfreq_up.u) annotation(
    Line(points = {{-79, -124}, {-57, -124}, {-57, -124}, {-55, -124}}, color = {0, 0, 127}));
  connect(dPfreq_down_lim.y, dPfreq.u1) annotation(
    Line(points = {{1, -90}, {9, -90}, {9, -112}, {17, -112}, {17, -112}}, color = {0, 0, 127}));
  connect(dPfreq.y, PCtrlErr.u3) annotation(
    Line(points = {{41, -118}, {45, -118}, {45, -62}, {-17, -62}, {-17, -52}, {-3, -52}, {-3, -52}}, color = {0, 0, 127}));
  connect(dPfreq_up_lim.y, dPfreq.u2) annotation(
    Line(points = {{1, -124}, {17, -124}, {17, -124}, {17, -124}}, color = {0, 0, 127}));
  connect(dPfreq_up.y, dPfreq_up_lim.u) annotation(
    Line(points = {{-31, -124}, {-23, -124}, {-23, -124}, {-23, -124}}, color = {0, 0, 127}));
  connect(PRefPu_PC, PCtrlErr.u1) annotation(
    Line(points = {{-308, -36}, {-2, -36}}, color = {0, 0, 127}));
  connect(const.y, FreqFlagSwitch.u3) annotation(
    Line(points = {{141, -112}, {149, -112}, {149, -82}, {157, -82}, {157, -82}}, color = {0, 0, 127}));
  connect(FreqFlag_const.y, FreqFlagSwitch.u2) annotation(
    Line(points = {{141, -74}, {157, -74}, {157, -74}, {157, -74}}, color = {255, 0, 255}));
  connect(Pref_lag.y, FreqFlagSwitch.u1) annotation(
    Line(points = {{141, -44}, {149, -44}, {149, -66}, {157, -66}, {157, -66}}, color = {0, 0, 127}));
  connect(PID_P.y, Pref_lag.u) annotation(
    Line(points = {{111, -44}, {117, -44}, {117, -44}, {117, -44}}, color = {0, 0, 127}));
  connect(Zero.y, PID_P.u_m) annotation(
    Line(points = {{81, -94}, {99, -94}, {99, -56}, {99, -56}}, color = {0, 0, 127}));
  connect(Pref_Lim.y, PID_P.u_s) annotation(
    Line(points = {{81, -44}, {85, -44}, {85, -44}, {87, -44}}, color = {0, 0, 127}));
  connect(PCtrlErr.y, Pref_Lim.u) annotation(
    Line(points = {{21, -44}, {57, -44}, {57, -44}, {57, -44}, {57, -44}}, color = {0, 0, 127}));
  connect(Pbranch_Filt.y, PCtrlErr.u2) annotation(
    Line(points = {{-39, -58}, {-31, -58}, {-31, -44}, {-3, -44}, {-3, -44}}, color = {0, 0, 127}));
  connect(QVext_dbd.y, QVErr_Lim.u) annotation(
    Line(points = {{91, 86}, {95, 86}, {95, 86}, {97, 86}}, color = {0, 0, 127}));
  connect(RefFlag_const.y, RefFlagSwitch.u2) annotation(
    Line(points = {{-7, 66}, {25, 66}, {25, 86}, {37, 86}, {37, 86}}, color = {255, 0, 255}));
  connect(RefFlagSwitch.y, QVext_dbd.u) annotation(
    Line(points = {{61, 86}, {67, 86}, {67, 86}, {67, 86}}, color = {0, 0, 127}));
  connect(QCtrlErr.y, RefFlagSwitch.u3) annotation(
    Line(points = {{21, 2}, {31, 2}, {31, 78}, {37, 78}, {37, 78}}, color = {0, 0, 127}));
  connect(UCtrlErr.y, RefFlagSwitch.u1) annotation(
    Line(points = {{21, 94}, {35, 94}, {35, 94}, {37, 94}, {37, 94}}, color = {0, 0, 127}));
  connect(QRefPu_PC, QCtrlErr.u2) annotation(
    Line(points = {{-308, -4}, {-2, -4}}, color = {0, 0, 127}));
  connect(Qbranch_Filt.y, QCtrlErr.u1) annotation(
    Line(points = {{-39, 16}, {-19, 16}, {-19, 8}, {-3, 8}, {-3, 8}}, color = {0, 0, 127}));
  connect(Ubranch_Filt.y, UCtrlErr.u2) annotation(
    Line(points = {{-39, 88}, {-5, 88}, {-5, 88}, {-3, 88}}, color = {0, 0, 127}));
  connect(dPfreq_down.y, dPfreq_down_lim.u) annotation(
    Line(points = {{-31, -90}, {-23, -90}, {-23, -90}, {-23, -90}}, color = {0, 0, 127}));
  connect(VCompFlagSwitch.y, Ubranch_Filt.u) annotation(
    Line(points = {{-69, 88}, {-63, 88}, {-63, 88}, {-63, 88}}, color = {0, 0, 127}));
  connect(QVCtrlErr.y, VCompFlagSwitch.u3) annotation(
    Line(points = {{-119, 50}, {-101, 50}, {-101, 80}, {-93, 80}, {-93, 80}}, color = {0, 0, 127}));
  connect(VCompFlag_const.y, VCompFlagSwitch.u2) annotation(
    Line(points = {{-119, 80}, {-105, 80}, {-105, 88}, {-93, 88}, {-93, 88}}, color = {255, 0, 255}));
  connect(GainKc.y, QVCtrlErr.u2) annotation(
    Line(points = {{-153, 44}, {-143, 44}, {-143, 44}, {-143, 44}}, color = {0, 0, 127}));

  annotation(preferredView = "diagram",
    Documentation(info = "<html>
<p> This block contains the generic WECC PV plant level control model according to (in case page cannot be found, copy link in browser): <a href='https://www.wecc.biz/Reliability/WECC%20Solar%20Plant%20Dynamic%20Modeling%20Guidelines.pdf/'>https://www.wecc.biz/Reliability/WECC%20Solar%20Plant%20Dynamic%20Modeling%20Guidelines.pdf </a> </p>
<p>Plant level active and reactive power/voltage control. Reactive power or voltage control dependent on RefFlag. Frequency dependent active power control is enabled or disabled with FreqFlag. With voltage control (RefFlag = true), voltage at remote bus can be controlled when VcompFlag == true. Therefore, Rc and Xc shall be defined as per real impedance between inverter terminal and regulated bus. If measurements from the regulated bus are available, Vcomp should be set to false and the measurements from regulated bus shall be connected with the input measurement signals (PRegPu, QRegPu, uPu, iPu). </p>
</html>"),
    Diagram(coordinateSystem(extent = {{-300, -150}, {200, 150}})),
    version = "",
    uses(Modelica(version = "3.2.3")),
    __OpenModelica_commandLineOptions = "",
  Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-29, 11}, extent = {{-41, 19}, {97, -41}}, textString = "Plant Control"), Text(origin = {137, 74}, extent = {{-23, 10}, {41, -12}}, textString = "PInjRefPu"), Text(origin = {59, 110}, extent = {{-15, 12}, {11, -12}}, textString = "QPu"), Text(origin = {103, 110}, extent = {{-15, 12}, {11, -12}}, textString = "PPu"), Text(origin = {-53, 110}, extent = {{-15, 12}, {11, -12}}, textString = "iPu"), Text(origin = {-7, 110}, extent = {{-15, 12}, {11, -12}}, textString = "uPu"), Text(origin = {-149, -10}, extent = {{-23, 10}, {21, -10}}, textString = "PRefPu"), Text(origin = {-149, -52}, extent = {{-23, 10}, {21, -10}}, textString = "QRefPu"), Text(origin = {-149, 34}, extent = {{-55, 40}, {21, -10}}, textString = "OmegaRefPu"), Text(origin = {-151, 78}, extent = {{-31, 32}, {21, -10}}, textString = "OmegaPu"),  Text(origin = {139, -46}, extent = {{-23, 10}, {41, -12}}, textString = "QInjRefPu")}, coordinateSystem(initialScale = 0.1)));

end REPC_PlantControl;
