within Dynawo.Examples.Nordic.Network;

model smallScaleDynamicTest_Tfo

  // Imports
  import Modelica.ComplexMath;
  import Modelica.Constants;
  import Modelica.SIunits;
  import Dynawo.Electrical.Buses;  
  import Dynawo.Electrical.Controls.Basics;
  import Dynawo.Electrical.Events;
  import Dynawo.Electrical.Lines.Line;
  import Dynawo.Electrical.Loads.LoadAlphaBeta;
  import Dynawo.Electrical.Events.NodeFault;
  import Dynawo.Electrical.Shunts.ShuntB;
  import Dynawo.Electrical.SystemBase;
  import Dynawo.Electrical.Transformers.TransformerFixedRatio;
  import Dynawo.Types;
  import Dynawo.Examples.Nordic.Components.ControlledGen;
  import Dynawo.Examples.Nordic.Components.ControlledTfo;
  // Reference Machine
  /*
      ControlledGen.ControlledGenFrameNordic g20(
        P0Pu = 1996.59/ SystemBase.SnRef,
        Q0Pu = 399.46/ SystemBase.SnRef,
        U0Pu = 1.0185,
        UPhase0 = SIunits.Conversions.from_deg(0),
        gen = ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g20) annotation(
      Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));*/
  Buses.InfiniteBus g20(UPu = 1.0185, UPhase = SIunits.Conversions.from_deg(0)) annotation(
    Placement(visible = true, transformation(origin = {30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Buses
  Buses.Bus bus_72 annotation(
    Placement(visible = true, transformation(origin = {-28, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buses.Bus bus_4072 annotation(
    Placement(visible = true, transformation(origin = {3.55271e-15, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Buses.Bus bus_4071 annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Buses.Bus bus_g19 annotation(
    Placement(visible = true, transformation(origin = {10, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buses.Bus bus_71 annotation(
    Placement(visible = true, transformation(origin = {-70, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Lines
  Line line_4071_4072a(BPu = 0.00093777000438421965 * XBase_line_4071_4072a, GPu = 0, RPu = 4.7999992370605469 / XBase_line_4071_4072a, XPu = 48 / XBase_line_4071_4072a) annotation(
    Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Line line_4071_4072b(BPu = 0.00093777000438421965 * XBase_line_4071_4072b, GPu = 0, RPu = 4.7999992370605469 / XBase_line_4071_4072b, XPu = 48 / XBase_line_4071_4072b) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  // Loads
  LoadAlphaBeta load_71(alpha = 1, beta = 2, i0Pu = i0Pu_Load_71, s0Pu = s0Pu_Load_71, u0Pu = u0Pu_Load_71) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LoadAlphaBeta load_72(alpha = 1, beta = 2, i0Pu = i0Pu_Load_72, s0Pu = s0Pu_Load_72, u0Pu = u0Pu_Load_72) annotation(
    Placement(visible = true, transformation(origin = {-28, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Generators
  ControlledGen.ControlledGenFrameNordic g19(P0Pu = P0Pu_Gen_g19, Q0Pu = Q0Pu_Gen_g19, U0Pu = U0Pu_Gen_g19, UPhase0 = SIunits.Conversions.from_deg(1.4157), gen = ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g19) annotation(
    Placement(visible = true, transformation(origin = {10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Trafos
  // XPu = impedance in pu from report * rTfoPu^2 * (SnRef Modelica = 100MVA / SNom from report)
  TransformerFixedRatio trafo_g19_4071(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 500), rTfoPu = 1.05) annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  TransformerFixedRatio trafo_g20_4072(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 4500), rTfoPu = 1.05) annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  //UMonDummySignal(start = 1.0434),
  ControlledTfo.ControlledTfoFrameNordic trafo_71_4071(P10Pu=P0Pu_Load_71, Q10Pu=Q0Pu_Load_71, U10Pu=U0Pu_Load_71, U1Phase0=UPhase0rad_Load_71, tfo = ControlledTfo.Util.ControlledTfoParamRecord.tfoPreset.trafo_71_4071)  annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  //UMonDummySignal(start = 1.0579),
  ControlledTfo.ControlledTfoFrameNordic trafo_72_4072(P10Pu=P0Pu_Load_72, Q10Pu=Q0Pu_Load_72,U10Pu=U0Pu_Load_72, U1Phase0=UPhase0rad_Load_72, tfo = ControlledTfo.Util.ControlledTfoParamRecord.tfoPreset.trafo_72_4072)  annotation(
    Placement(visible = true, transformation(origin = {-28, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  ShuntB shunt_4071(BPu=BPu_shunt_4071, u0Pu=u0Pu_shunt_4071, s0Pu=s0Pu_shunt_4071, i0Pu=i0Pu_shunt_4071) annotation(
    Placement(visible = true, transformation(origin = {-16, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  
  NodeFault nodeFault(RPu = 0 / XBase_line_4012_4071, XPu = 100 / XBase_line_4012_4071, tBegin = 10, tEnd = 10.1) annotation(
    Placement(visible = true, transformation(origin = {36, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Basics.Step PrefPu_l72(Value0=P0Pu_Load_72, Height=P0Pu_Load_72, tStep=1);
  Basics.SetPoint QrefPu_l72(Value0=Q0Pu_Load_72);
  Basics.SetPoint PrefPu_l71(Value0=P0Pu_Load_71);
  Basics.SetPoint QrefPu_l71(Value0=Q0Pu_Load_71);
  
  Types.ActivePower Check_g20_P;
  Types.ReactivePower Check_g20_Q;
  Types.ActivePower Check_g19_P;
  Types.ReactivePower Check_g19_Q;
  Types.VoltageModulePu Check_g19_UPu;
  Types.Angle Check_g19_UPhase;
  Types.ActivePower Check_l71_P;
  Types.ReactivePower Check_l71_Q;
  Types.VoltageModulePu Check_l71_UPu;
  Types.Angle Check_l71_UPhase;
  Types.ActivePower Check_l72_P;
  Types.ReactivePower Check_l72_Q;
  Types.VoltageModulePu Check_l72_UPu;
  Types.Angle Check_l72_UPhase;
  Types.ActivePower Check_t19_P;
  Types.ReactivePower Check_t19_Q;
  Types.VoltageModulePu Check_t19_UPu;
  Types.Angle Check_t19_UPhase;
  Types.ActivePower Check_t20_P;
  Types.ReactivePower Check_t20_Q;
  Types.VoltageModulePu Check_t20_UPu;
  Types.Angle Check_t20_UPhase;
  Types.ActivePower Check_t71_P;
  Types.ReactivePower Check_t71_Q;
  Types.VoltageModulePu Check_t71_UPu;
  Types.Angle Check_t71_UPhase;
  Types.ActivePower Check_t72_P;
  Types.ReactivePower Check_t72_Q;
  Types.VoltageModulePu Check_t72_UPu;
  Types.Angle Check_t72_UPhase;
  
protected
  // Generator g19 init values:
  // P0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g19 = -300 / SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g19 = -137.7 / SystemBase.SnRef;
  //final parameter Types.ComplexPerUnit s0Pu_Gen_g19 = Complex(P0Pu_Gen_g19, Q0Pu_Gen_g19);
  final parameter Types.PerUnit U0Pu_Gen_g19 = 1.03;
  final parameter Types.Angle UPhase0_Gen_g19 = SIunits.Conversions.from_deg(1.4157);
 
  // Load 71 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_71 = 298.5 / SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_71 = 83.0 / SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_71 = Complex(P0Pu_Load_71, Q0Pu_Load_71);
  final parameter Types.PerUnit U0Pu_Load_71 = 0.9980;
  final parameter Types.Angle UPhase0rad_Load_71 = SIunits.Conversions.from_deg(-6.4499);
  final parameter Types.ComplexPerUnit u0Pu_Load_71 = ComplexMath.fromPolar(U0Pu_Load_71,UPhase0rad_Load_71);
  final parameter Types.ComplexPerUnit i0Pu_Load_71 = ComplexMath.conj(s0Pu_Load_71 / u0Pu_Load_71);
  
  // Load 72 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_72 = 1998.0 / SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_72 = 395.3 / SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_72 = Complex(P0Pu_Load_72, Q0Pu_Load_72);
  final parameter Types.PerUnit U0Pu_Load_72 = 0.9964;
  final parameter Types.Angle UPhase0rad_Load_72 = SIunits.Conversions.from_deg(-6.5705);
  final parameter Types.ComplexPerUnit u0Pu_Load_72 = ComplexMath.fromPolar(U0Pu_Load_71,UPhase0rad_Load_71);
  final parameter Types.ComplexPerUnit i0Pu_Load_72 = ComplexMath.conj(s0Pu_Load_72 / u0Pu_Load_72);
  final parameter Types.ComplexPerUnit u0Pu_Load_4011 = ComplexMath.fromPolar(1.0434, SIunits.Conversions.from_deg(-3.6287));
  
  // Line Bases U2Nom / SnRef
  final parameter SIunits.Impedance XBase_line_4012_4071 = 400 ^ 2 / SystemBase.SnRef;
  final parameter SIunits.Impedance XBase_line_4011_4071 = 400 ^ 2 / SystemBase.SnRef;
  final parameter SIunits.Impedance XBase_line_4071_4072a = 400 ^ 2 / SystemBase.SnRef;
  final parameter SIunits.Impedance XBase_line_4071_4072b = 400 ^ 2 / SystemBase.SnRef;
  
  // Shunt Bases UNom / SnRef ((In the report, neg Qnom relates to inductors;
  // in ShuntB, positive BPu for inductive consumption))
  // BPu = (Qnom / UNom^2)/(XBase^-1)
  // XBase = UNom^2 / SnRef
  // BPu = (Qnom / UNom^2) / (SnRef / UNom^2) => (Qnom / UNom^2) * (UNom^2 / SnRef)
  // BPu = (Qnom / SnRef)
  final parameter Types.PerUnit BPu_shunt_4071 = 400 / SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4071 = u0Pu_Load_4011;
  final parameter Types.PerUnit U0Pu_shunt_4071 = ComplexMath.'abs'(u0Pu_Load_4011);
  final parameter Types.PerUnit Q0Pu_shunt_4071 = BPu_shunt_4071*U0Pu_shunt_4071^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4071 = Complex(0, Q0Pu_shunt_4071);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4071 = ComplexMath.conj(s0Pu_shunt_4071/ u0Pu_shunt_4071);
  
equation

  connect(trafo_72_4072.terminal2, bus_4072.terminal) annotation(
    Line(points = {{-28, -68}, {-28, -68}, {-28, -50}, {0, -50}, {0, -50}}, color = {0, 0, 255}));
  connect(bus_72.terminal, trafo_72_4072.terminal1) annotation(
    Line(points = {{-28, -110}, {-28, -110}, {-28, -88}, {-28, -88}}, color = {0, 0, 255}));
  connect(trafo_71_4071.terminal2, bus_4071.terminal) annotation(
    Line(points = {{-70, 42}, {-70, 42}, {-70, 60}, {0, 60}, {0, 60}}, color = {0, 0, 255}));
  connect(bus_71.terminal, trafo_71_4071.terminal1) annotation(
    Line(points = {{-70, 4}, {-70, 4}, {-70, 22}, {-70, 22}}, color = {0, 0, 255}));
  connect(load_71.terminal, bus_71.terminal) annotation(
    Line(points = {{-70, -10}, {-70, -10}, {-70, 4}, {-70, 4}}, color = {0, 0, 255}));
  connect(PrefPu_l72.step, load_72.PRefPu);
  connect(QrefPu_l72.setPoint, load_72.QRefPu);
  connect(PrefPu_l71.setPoint, load_71.PRefPu);
  connect(QrefPu_l71.setPoint, load_71.QRefPu);
  connect(nodeFault.terminal, line_4071_4072b.terminal1) annotation(
    Line);
  connect(shunt_4071.terminal, bus_4071.terminal) annotation(
    Line(points = {{-16, 90}, {-16, 90}, {-16, 60}, {0, 60}, {0, 60}}, color = {0, 0, 255}));
  connect(g20.terminal, trafo_g20_4072.terminal1) annotation(
    Line(points = {{30, -110}, {30, -100}}, color = {0, 0, 255}));
  connect(g19.terminal, bus_g19.terminal) annotation(
    Line(points = {{10, 130}, {10, 110}}, color = {0, 0, 255}));
  connect(trafo_g19_4071.terminal1, bus_g19.terminal) annotation(
    Line(points = {{10, 100}, {10, 110}}, color = {0, 0, 255}));
  connect(line_4071_4072a.terminal2, bus_4072.terminal) annotation(
    Line(points = {{-14, -10}, {-14, -50}, {0, -50}}, color = {0, 0, 255}));
  connect(bus_4071.terminal, line_4071_4072a.terminal1) annotation(
    Line(points = {{0, 60}, {-14, 60}, {-14, 10}}, color = {0, 0, 255}));
  connect(bus_4071.terminal, line_4071_4072b.terminal1) annotation(
    Line(points = {{0, 60}, {0, 10}}, color = {0, 0, 255}));
  connect(line_4071_4072b.terminal2, bus_4072.terminal) annotation(
    Line(points = {{0, -10}, {0, -50}}, color = {0, 0, 255}));
  connect(trafo_g19_4071.terminal2, bus_4071.terminal) annotation(
    Line(points = {{10, 80}, {10, 60}, {0, 60}}, color = {0, 0, 255}));
  connect(trafo_g20_4072.terminal2, bus_4072.terminal) annotation(
    Line(points = {{30, -80}, {30, -80}, {30, -50}, {0, -50}, {0, -50}}, color = {0, 0, 255}));
  connect(load_72.terminal, bus_72.terminal) annotation(
    Line(points = {{-28, -130}, {-28, -110}}, color = {0, 0, 255}));
  load_72.switchOffSignal1.value = false;
  load_72.switchOffSignal2.value = false;
  load_71.switchOffSignal1.value = false;
  load_71.switchOffSignal2.value = false;
  line_4071_4072a.switchOffSignal1.value = false;
  line_4071_4072a.switchOffSignal2.value = false;
  line_4071_4072b.switchOffSignal1.value = false;
  line_4071_4072b.switchOffSignal2.value = false;
  trafo_g19_4071.switchOffSignal1.value = false;
  trafo_g19_4071.switchOffSignal2.value = false;
  trafo_g20_4072.switchOffSignal1.value = false;
  trafo_g20_4072.switchOffSignal2.value = false;
  shunt_4071.switchOffSignal1.value = false;
  shunt_4071.switchOffSignal2.value = false;
  
  Check_g20_P = SystemBase.SnRef * ComplexMath.real(g20.terminal.V * ComplexMath.conj(g20.terminal.i));
  Check_g20_Q = SystemBase.SnRef * ComplexMath.imag(g20.terminal.V * ComplexMath.conj(g20.terminal.i));
  Check_g19_P = SystemBase.SnRef * ComplexMath.real(g19.terminal.V * ComplexMath.conj(g19.terminal.i));
  Check_g19_Q = SystemBase.SnRef * ComplexMath.imag(g19.terminal.V * ComplexMath.conj(g19.terminal.i));
  Check_g19_UPu = ComplexMath.'abs'(g19.terminal.V);
  Check_g19_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(g19.terminal.V));
  Check_l71_P = SystemBase.SnRef * ComplexMath.real(load_71.terminal.V * ComplexMath.conj(load_71.terminal.i));
  Check_l71_Q = SystemBase.SnRef * ComplexMath.imag(load_71.terminal.V * ComplexMath.conj(load_71.terminal.i));
  Check_l71_UPu = ComplexMath.'abs'(load_71.terminal.V);
  Check_l71_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(load_71.terminal.V));
  Check_l72_P = SystemBase.SnRef * ComplexMath.real(load_72.terminal.V * ComplexMath.conj(load_72.terminal.i));
  Check_l72_Q = SystemBase.SnRef * ComplexMath.imag(load_72.terminal.V * ComplexMath.conj(load_72.terminal.i));
  Check_l72_UPu = ComplexMath.'abs'(load_72.terminal.V);
  Check_l72_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(load_72.terminal.V));
  Check_t19_P = SystemBase.SnRef * ComplexMath.real(trafo_g19_4071.terminal2.V * ComplexMath.conj(trafo_g19_4071.terminal2.i));
  Check_t19_Q = SystemBase.SnRef * ComplexMath.imag(trafo_g19_4071.terminal2.V * ComplexMath.conj(trafo_g19_4071.terminal2.i));
  Check_t19_UPu = ComplexMath.'abs'(trafo_g19_4071.terminal2.V);
  Check_t19_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(trafo_g19_4071.terminal2.V));
  Check_t20_P = SystemBase.SnRef * ComplexMath.real(trafo_g20_4072.terminal2.V * ComplexMath.conj(trafo_g20_4072.terminal2.i));
  Check_t20_Q = SystemBase.SnRef * ComplexMath.imag(trafo_g20_4072.terminal2.V * ComplexMath.conj(trafo_g20_4072.terminal2.i));
  Check_t20_UPu = ComplexMath.'abs'(trafo_g20_4072.terminal2.V);
  Check_t20_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(trafo_g20_4072.terminal2.V));
  Check_t71_P = SystemBase.SnRef * ComplexMath.real(trafo_71_4071.terminal2.V * ComplexMath.conj(trafo_71_4071.terminal2.i));
  Check_t71_Q = SystemBase.SnRef * ComplexMath.imag(trafo_71_4071.terminal2.V * ComplexMath.conj(trafo_71_4071.terminal2.i));
  Check_t71_UPu = ComplexMath.'abs'(trafo_71_4071.terminal2.V);
  Check_t71_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(trafo_71_4071.terminal2.V));
  Check_t72_P = SystemBase.SnRef * ComplexMath.real(trafo_72_4072.terminal2.V * ComplexMath.conj(trafo_72_4072.terminal2.i));
  Check_t72_Q = SystemBase.SnRef * ComplexMath.imag(trafo_72_4072.terminal2.V * ComplexMath.conj(trafo_72_4072.terminal2.i));
  Check_t72_UPu = ComplexMath.'abs'(trafo_72_4072.terminal2.V);
  Check_t72_UPhase = SIunits.Conversions.to_deg(ComplexMath.arg(trafo_72_4072.terminal2.V));
  annotation(
    uses(Dynawo(version = "1.0.1")),
    Diagram(coordinateSystem(extent = {{-100, -150}, {100, 150}})),
    Icon(coordinateSystem(extent = {{-100, -150}, {100, 150}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-05, Interval = 0.001));
end smallScaleDynamicTest_Tfo;
