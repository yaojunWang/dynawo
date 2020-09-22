within Dynawo.Examples.Nordic32TestSystem;
model Loadflow

  extends StaticNetwork;
  import Dynawo.Electrical;
  import Dynawo.Types;
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.SIunits;

  Electrical.Buses.InfiniteBus slackbus_g20(UPu = 1.0185, UPhase = SIunits.Conversions.from_deg(0));
  Electrical.Machines.GeneratorPQ g09(PMin = 0, PMax = 9999, PNom = 950.0, u0Pu = u0Pu_Gen_g09, i0Pu = i0Pu_Gen_g09, PGen0Pu = P0Pu_Gen_g09, QGen0Pu = Q0Pu_Gen_g09, U0Pu = U0Pu_Gen_g09, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g01(PMin = 0, PMax = 9999, PNom = 760.0, u0Pu = u0Pu_Gen_g01, i0Pu = i0Pu_Gen_g01, PGen0Pu = P0Pu_Gen_g01, QGen0Pu = Q0Pu_Gen_g01, U0Pu = U0Pu_Gen_g01, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g10(PMin = 0, PMax = 9999, PNom = 760.0, u0Pu = u0Pu_Gen_g10, i0Pu = i0Pu_Gen_g10, PGen0Pu = P0Pu_Gen_g10, QGen0Pu = Q0Pu_Gen_g10, U0Pu = U0Pu_Gen_g10, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g02(PMin = 0, PMax = 9999, PNom = 570.0, u0Pu = u0Pu_Gen_g02, i0Pu = i0Pu_Gen_g02, PGen0Pu = P0Pu_Gen_g02, QGen0Pu = Q0Pu_Gen_g02, U0Pu = U0Pu_Gen_g02, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g03(PMin = 0, PMax = 9999, PNom = 665.0, u0Pu = u0Pu_Gen_g03, i0Pu = i0Pu_Gen_g03, PGen0Pu = P0Pu_Gen_g03, QGen0Pu = Q0Pu_Gen_g03, U0Pu = U0Pu_Gen_g03, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g04(PMin = 0, PMax = 9999, PNom = 570.0, u0Pu = u0Pu_Gen_g04, i0Pu = i0Pu_Gen_g04, PGen0Pu = P0Pu_Gen_g04, QGen0Pu = Q0Pu_Gen_g04, U0Pu = U0Pu_Gen_g04, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g05(PMin = 0, PMax = 9999, PNom = 237.5, u0Pu = u0Pu_Gen_g05, i0Pu = i0Pu_Gen_g05, PGen0Pu = P0Pu_Gen_g05, QGen0Pu = Q0Pu_Gen_g05, U0Pu = U0Pu_Gen_g05, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g06(PMin = 0, PMax = 9999, PNom = 360.0, u0Pu = u0Pu_Gen_g06, i0Pu = i0Pu_Gen_g06, PGen0Pu = P0Pu_Gen_g06, QGen0Pu = Q0Pu_Gen_g06, U0Pu = U0Pu_Gen_g06, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g07(PMin = 0, PMax = 9999, PNom = 180.0, u0Pu = u0Pu_Gen_g07, i0Pu = i0Pu_Gen_g07, PGen0Pu = P0Pu_Gen_g07, QGen0Pu = Q0Pu_Gen_g07, U0Pu = U0Pu_Gen_g07, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g12(PMin = 0, PMax = 9999, PNom = 332.5, u0Pu = u0Pu_Gen_g12, i0Pu = i0Pu_Gen_g12, PGen0Pu = P0Pu_Gen_g12, QGen0Pu = Q0Pu_Gen_g12, U0Pu = U0Pu_Gen_g12, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g08(PMin = 0, PMax = 9999, PNom = 807.5, u0Pu = u0Pu_Gen_g08, i0Pu = i0Pu_Gen_g08, PGen0Pu = P0Pu_Gen_g08, QGen0Pu = Q0Pu_Gen_g08, U0Pu = U0Pu_Gen_g08, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g11(PMin = 0, PMax = 9999, PNom = 285.0, u0Pu = u0Pu_Gen_g11, i0Pu = i0Pu_Gen_g11, PGen0Pu = P0Pu_Gen_g11, QGen0Pu = Q0Pu_Gen_g11, U0Pu = U0Pu_Gen_g11, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g13(PMin = 0, PMax = 9999, PNom = 0, u0Pu = u0Pu_Gen_g13, i0Pu = i0Pu_Gen_g13, PGen0Pu = P0Pu_Gen_g13, QGen0Pu = Q0Pu_Gen_g13, U0Pu = U0Pu_Gen_g13, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g14(PMin = 0, PMax = 9999, PNom = 630.0, u0Pu = u0Pu_Gen_g14, i0Pu = i0Pu_Gen_g14, PGen0Pu = P0Pu_Gen_g14, QGen0Pu = Q0Pu_Gen_g14, U0Pu = U0Pu_Gen_g14, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g15(PMin = 0, PMax = 9999, PNom = 1080.0, u0Pu = u0Pu_Gen_g15, i0Pu = i0Pu_Gen_g15, PGen0Pu = P0Pu_Gen_g15, QGen0Pu = Q0Pu_Gen_g15, U0Pu = U0Pu_Gen_g15, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g16(PMin = 0, PMax = 9999, PNom = 630.0, u0Pu = u0Pu_Gen_g16, i0Pu = i0Pu_Gen_g16, PGen0Pu = P0Pu_Gen_g16, QGen0Pu = Q0Pu_Gen_g16, U0Pu = U0Pu_Gen_g16, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g17(PMin = 0, PMax = 9999, PNom = 540.0, u0Pu = u0Pu_Gen_g17, i0Pu = i0Pu_Gen_g17, PGen0Pu = P0Pu_Gen_g17, QGen0Pu = Q0Pu_Gen_g17, U0Pu = U0Pu_Gen_g17, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g18(PMin = 0, PMax = 9999, PNom = 1080.0, u0Pu = u0Pu_Gen_g18, i0Pu = i0Pu_Gen_g18, PGen0Pu = P0Pu_Gen_g18, QGen0Pu = Q0Pu_Gen_g18, U0Pu = U0Pu_Gen_g18, AlphaPuPNom = 0);
  Electrical.Machines.GeneratorPQ g19(PMin = 0, PMax = 9999, PNom = 475.0, u0Pu = u0Pu_Gen_g19, i0Pu = i0Pu_Gen_g19, PGen0Pu = P0Pu_Gen_g19, QGen0Pu = Q0Pu_Gen_g19, U0Pu = U0Pu_Gen_g19, AlphaPuPNom = 0);
  Electrical.Loads.LoadAlphaBeta load_11(alpha = 1, beta = 2, s0Pu = s0Pu_Load_11, u0Pu = u0Pu_Load_11, i0Pu = i0Pu_Load_11);
  Electrical.Loads.LoadAlphaBeta load_12(alpha = 1, beta = 2, s0Pu = s0Pu_Load_12, u0Pu = u0Pu_Load_12, i0Pu = i0Pu_Load_12);
  Electrical.Loads.LoadAlphaBeta load_13(alpha = 1, beta = 2, s0Pu = s0Pu_Load_13, u0Pu = u0Pu_Load_13, i0Pu = i0Pu_Load_13);
  Electrical.Loads.LoadAlphaBeta load_22(alpha = 1, beta = 2, s0Pu = s0Pu_Load_22, u0Pu = u0Pu_Load_22, i0Pu = i0Pu_Load_22);
  Electrical.Loads.LoadAlphaBeta load_01(alpha = 1, beta = 2, s0Pu = s0Pu_Load_01, u0Pu = u0Pu_Load_01, i0Pu = i0Pu_Load_01);
  Electrical.Loads.LoadAlphaBeta load_02(alpha = 1, beta = 2, s0Pu = s0Pu_Load_02, u0Pu = u0Pu_Load_02, i0Pu = i0Pu_Load_02);
  Electrical.Loads.LoadAlphaBeta load_03(alpha = 1, beta = 2, s0Pu = s0Pu_Load_03, u0Pu = u0Pu_Load_03, i0Pu = i0Pu_Load_03);
  Electrical.Loads.LoadAlphaBeta load_04(alpha = 1, beta = 2, s0Pu = s0Pu_Load_04, u0Pu = u0Pu_Load_04, i0Pu = i0Pu_Load_04);
  Electrical.Loads.LoadAlphaBeta load_05(alpha = 1, beta = 2, s0Pu = s0Pu_Load_05, u0Pu = u0Pu_Load_05, i0Pu = i0Pu_Load_05);
  Electrical.Loads.LoadAlphaBeta load_31(alpha = 1, beta = 2, s0Pu = s0Pu_Load_31, u0Pu = u0Pu_Load_31, i0Pu = i0Pu_Load_31);
  Electrical.Loads.LoadAlphaBeta load_32(alpha = 1, beta = 2, s0Pu = s0Pu_Load_32, u0Pu = u0Pu_Load_32, i0Pu = i0Pu_Load_32);
  Electrical.Loads.LoadAlphaBeta load_41(alpha = 1, beta = 2, s0Pu = s0Pu_Load_41, u0Pu = u0Pu_Load_41, i0Pu = i0Pu_Load_41);
  Electrical.Loads.LoadAlphaBeta load_42(alpha = 1, beta = 2, s0Pu = s0Pu_Load_42, u0Pu = u0Pu_Load_42, i0Pu = i0Pu_Load_42);
  Electrical.Loads.LoadAlphaBeta load_43(alpha = 1, beta = 2, s0Pu = s0Pu_Load_43, u0Pu = u0Pu_Load_43, i0Pu = i0Pu_Load_43);
  Electrical.Loads.LoadAlphaBeta load_46(alpha = 1, beta = 2, s0Pu = s0Pu_Load_46, u0Pu = u0Pu_Load_46, i0Pu = i0Pu_Load_46);
  Electrical.Loads.LoadAlphaBeta load_47(alpha = 1, beta = 2, s0Pu = s0Pu_Load_47, u0Pu = u0Pu_Load_47, i0Pu = i0Pu_Load_47);
  Electrical.Loads.LoadAlphaBeta load_51(alpha = 1, beta = 2, s0Pu = s0Pu_Load_51, u0Pu = u0Pu_Load_51, i0Pu = i0Pu_Load_51);
  Electrical.Loads.LoadAlphaBeta load_61(alpha = 1, beta = 2, s0Pu = s0Pu_Load_61, u0Pu = u0Pu_Load_61, i0Pu = i0Pu_Load_61);
  Electrical.Loads.LoadAlphaBeta load_62(alpha = 1, beta = 2, s0Pu = s0Pu_Load_62, u0Pu = u0Pu_Load_62, i0Pu = i0Pu_Load_62);
  Electrical.Loads.LoadAlphaBeta load_63(alpha = 1, beta = 2, s0Pu = s0Pu_Load_63, u0Pu = u0Pu_Load_63, i0Pu = i0Pu_Load_63);
  Electrical.Loads.LoadAlphaBeta load_71(alpha = 1, beta = 2, s0Pu = s0Pu_Load_71, u0Pu = u0Pu_Load_71, i0Pu = i0Pu_Load_71);
  Electrical.Loads.LoadAlphaBeta load_72(alpha = 1, beta = 2, s0Pu = s0Pu_Load_72, u0Pu = u0Pu_Load_72, i0Pu = i0Pu_Load_72);
  Dynawo.Electrical.Shunts.ShuntB shunt_1022(BPu = BPu_shunt_1022, u0Pu = u0Pu_shunt_1022);
  Dynawo.Electrical.Shunts.ShuntB shunt_1041(BPu = BPu_shunt_1041, u0Pu = u0Pu_shunt_1041);
  Dynawo.Electrical.Shunts.ShuntB shunt_1043(BPu = BPu_shunt_1043, u0Pu = u0Pu_shunt_1043);
  Dynawo.Electrical.Shunts.ShuntB shunt_1044(BPu = BPu_shunt_1044, u0Pu = u0Pu_shunt_1044);
  Dynawo.Electrical.Shunts.ShuntB shunt_1045(BPu = BPu_shunt_1045, u0Pu = u0Pu_shunt_1045);
  Dynawo.Electrical.Shunts.ShuntB shunt_4012(BPu = BPu_shunt_4012, u0Pu = u0Pu_shunt_4012);
  Dynawo.Electrical.Shunts.ShuntB shunt_4041(BPu = BPu_shunt_4041, u0Pu = u0Pu_shunt_4041);
  Dynawo.Electrical.Shunts.ShuntB shunt_4043(BPu = BPu_shunt_4043, u0Pu = u0Pu_shunt_4043);
  Dynawo.Electrical.Shunts.ShuntB shunt_4046(BPu = BPu_shunt_4046, u0Pu = u0Pu_shunt_4046);
  Dynawo.Electrical.Shunts.ShuntB shunt_4051(BPu = BPu_shunt_4051, u0Pu = u0Pu_shunt_4051);
  Dynawo.Electrical.Shunts.ShuntB shunt_4071(BPu = BPu_shunt_4071, u0Pu = u0Pu_shunt_4071);
  Types.ActivePower Check_g20_P;
  Types.ReactivePower Check_g20_Q;

protected
  // Generator g09 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g09 = 668.5 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g09 = 201.3 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g09 = Complex(P0Pu_Gen_g09, Q0Pu_Gen_g09);
  final parameter Types.PerUnit U0Pu_Gen_g09 = 0.9988;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g09 = ComplexMath.fromPolar(U0Pu_Gen_g09, SIunits.Conversions.from_deg(-1.63));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g09 = -1 * ComplexMath.conj(s0Pu_Gen_g09 / u0Pu_Gen_g09);

  // Generator g01 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g01 = 600.00 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g01 = 58.3 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g01 = Complex(P0Pu_Gen_g01, Q0Pu_Gen_g01);
  final parameter Types.PerUnit U0Pu_Gen_g01 = 1.0684;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g01 = ComplexMath.fromPolar(U0Pu_Gen_g01, SIunits.Conversions.from_deg(2.59));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g01 = -1 * ComplexMath.conj(s0Pu_Gen_g01 / u0Pu_Gen_g01);

  // Generator g10 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g10 = 600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g10 = 255.7 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g10 = Complex(P0Pu_Gen_g10, Q0Pu_Gen_g10);
  final parameter Types.PerUnit U0Pu_Gen_g10 = 1.0157;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g10 = ComplexMath.fromPolar(U0Pu_Gen_g10, SIunits.Conversions.from_deg(0.99));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g10 = -1 * ComplexMath.conj(s0Pu_Gen_g10 / u0Pu_Gen_g10);

  // Generator g02 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g02 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g02 = 17.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g02 = Complex(P0Pu_Gen_g02, Q0Pu_Gen_g02);
  final parameter Types.PerUnit U0Pu_Gen_g02 = 1.0565;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g02 = ComplexMath.fromPolar(U0Pu_Gen_g02, SIunits.Conversions.from_deg(5.12));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g02 = -1 * ComplexMath.conj(s0Pu_Gen_g02 / u0Pu_Gen_g02);

  // Generator g03 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g03 = 550.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g03 = 20.9 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g03 = Complex(P0Pu_Gen_g03, Q0Pu_Gen_g03);
  final parameter Types.PerUnit U0Pu_Gen_g03 = 1.0595;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g03 = ComplexMath.fromPolar(U0Pu_Gen_g03, SIunits.Conversions.from_deg(10.27));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g03 = -1 * ComplexMath.conj(s0Pu_Gen_g03 / u0Pu_Gen_g03);

  // Generator g04 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g04 = 400.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g04 = 30.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g04 = Complex(P0Pu_Gen_g04, Q0Pu_Gen_g04);
  final parameter Types.PerUnit U0Pu_Gen_g04 = 1.0339;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g04 = ComplexMath.fromPolar(U0Pu_Gen_g04, SIunits.Conversions.from_deg(8.03));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g04 = -1 * ComplexMath.conj(s0Pu_Gen_g04 / u0Pu_Gen_g04);

  // Generator g05 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g05 = 200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g05 = 60.1 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g05 = Complex(P0Pu_Gen_g05, Q0Pu_Gen_g05);
  final parameter Types.PerUnit U0Pu_Gen_g05 = 1.0294;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g05 = ComplexMath.fromPolar(U0Pu_Gen_g05, SIunits.Conversions.from_deg(-12.36));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g05 = -1 * ComplexMath.conj(s0Pu_Gen_g05 / u0Pu_Gen_g05);

  // Generator g06 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g06 = 360.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g06 = 138.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g06 = Complex(P0Pu_Gen_g06, Q0Pu_Gen_g06);
  final parameter Types.PerUnit U0Pu_Gen_g06 = 1.0084;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g06 = ComplexMath.fromPolar(U0Pu_Gen_g06, SIunits.Conversions.from_deg(-59.42));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g06 = -1 * ComplexMath.conj(s0Pu_Gen_g06 / u0Pu_Gen_g06);

  // Generator g07 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g07 = 180.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g07 = 60.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g07 = Complex(P0Pu_Gen_g07, Q0Pu_Gen_g07);
  final parameter Types.PerUnit U0Pu_Gen_g07 = 1.0141;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g07 = ComplexMath.fromPolar(U0Pu_Gen_g07, SIunits.Conversions.from_deg(-68.95));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g07 = -1 * ComplexMath.conj(s0Pu_Gen_g07 / u0Pu_Gen_g07);

  // Generator g12 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g12 = 310.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g12 = 98.3 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g12 = Complex(P0Pu_Gen_g12, Q0Pu_Gen_g12);
  final parameter Types.PerUnit U0Pu_Gen_g12 = 1.02;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g12 = ComplexMath.fromPolar(U0Pu_Gen_g12, SIunits.Conversions.from_deg(-31.88));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g12 = -1 * ComplexMath.conj(s0Pu_Gen_g12 / u0Pu_Gen_g12);

  // Generator g08 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g08 = 750.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g08 = 232.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g08 = Complex(P0Pu_Gen_g08, Q0Pu_Gen_g08);
  final parameter Types.PerUnit U0Pu_Gen_g08 = 1.0498;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g08 = ComplexMath.fromPolar(U0Pu_Gen_g08, SIunits.Conversions.from_deg(-16.81));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g08 = -1 * ComplexMath.conj(s0Pu_Gen_g08 / u0Pu_Gen_g08);

  // Generator g11 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g11 = 250.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g11 = 60.7 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g11 = Complex(P0Pu_Gen_g11, Q0Pu_Gen_g11);
  final parameter Types.PerUnit U0Pu_Gen_g11 = 1.0211;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g11 = ComplexMath.fromPolar(U0Pu_Gen_g11, SIunits.Conversions.from_deg(-29.04));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g11 = -1 * ComplexMath.conj(s0Pu_Gen_g11 / u0Pu_Gen_g11);

  // Generator g13 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g13 = 0.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g13 = 50.1 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g13 = Complex(P0Pu_Gen_g13, Q0Pu_Gen_g13);
  final parameter Types.PerUnit U0Pu_Gen_g13 = 1.017;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g13 = ComplexMath.fromPolar(U0Pu_Gen_g13, SIunits.Conversions.from_deg(-54.3));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g13 = -1 * ComplexMath.conj(s0Pu_Gen_g13 / u0Pu_Gen_g13);

  // Generator g14 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g14 = 630.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g14 = 295.9 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g14 = Complex(P0Pu_Gen_g14, Q0Pu_Gen_g14);
  final parameter Types.PerUnit U0Pu_Gen_g14 = 1.0454;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g14 = ComplexMath.fromPolar(U0Pu_Gen_g14, SIunits.Conversions.from_deg(-49.9));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g14 = -1 * ComplexMath.conj(s0Pu_Gen_g14 / u0Pu_Gen_g14);

  // Generator g15 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g15 = 1080.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g15 = 377.9 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g15 = Complex(P0Pu_Gen_g15, Q0Pu_Gen_g15);
  final parameter Types.PerUnit U0Pu_Gen_g15 = 1.0455;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g15 = ComplexMath.fromPolar(U0Pu_Gen_g15, SIunits.Conversions.from_deg(-52.19));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g15 = -1 * ComplexMath.conj(s0Pu_Gen_g15 / u0Pu_Gen_g15);

  // Generator g16 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g16 = 600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g16 = 222.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g16 = Complex(P0Pu_Gen_g16, Q0Pu_Gen_g16);
  final parameter Types.PerUnit U0Pu_Gen_g16 = 1.0531;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g16 = ComplexMath.fromPolar(U0Pu_Gen_g16, SIunits.Conversions.from_deg(-64.1));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g16 = -1 * ComplexMath.conj(s0Pu_Gen_g16 / u0Pu_Gen_g16);

  // Generator g17 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g17 = 530.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g17 = 48.7 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g17 = Complex(P0Pu_Gen_g17, Q0Pu_Gen_g17);
  final parameter Types.PerUnit U0Pu_Gen_g17 = 1.0092;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g17 = ComplexMath.fromPolar(U0Pu_Gen_g17, SIunits.Conversions.from_deg(-46.85));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g17 = -1 * ComplexMath.conj(s0Pu_Gen_g17 / u0Pu_Gen_g17);

  // Generator g18 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g18 = 1060.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g18 = 293.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g18 = Complex(P0Pu_Gen_g18, Q0Pu_Gen_g18);
  final parameter Types.PerUnit U0Pu_Gen_g18 = 1.0307;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g18 = ComplexMath.fromPolar(U0Pu_Gen_g18, SIunits.Conversions.from_deg(-43.32));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g18 = -1 * ComplexMath.conj(s0Pu_Gen_g18 / u0Pu_Gen_g18);

  // Generator g19 init values:
  // PGen0Pu in SnRef, generator convention
  // i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Gen_g19 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Gen_g19 = 121.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Gen_g19 = Complex(P0Pu_Gen_g19, Q0Pu_Gen_g19);
  final parameter Types.PerUnit U0Pu_Gen_g19 = 1.03;
  final parameter Types.ComplexPerUnit u0Pu_Gen_g19 = ComplexMath.fromPolar(U0Pu_Gen_g19, SIunits.Conversions.from_deg(0.03));
  final parameter Types.ComplexPerUnit i0Pu_Gen_g19 = -1 * ComplexMath.conj(s0Pu_Gen_g19 / u0Pu_Gen_g19);

  // Load_11 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_11 = 200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_11 = 68.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_11 = Complex(P0Pu_Load_11, Q0Pu_Load_11);
  final parameter Types.ComplexPerUnit u0Pu_Load_11 = ComplexMath.fromPolar(1.0026, SIunits.Conversions.from_deg(-9.45));
  final parameter Types.ComplexPerUnit i0Pu_Load_11 = ComplexMath.conj(s0Pu_Load_11 / u0Pu_Load_11);

  // Load_12 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_12 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_12 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_12 = Complex(P0Pu_Load_12, Q0Pu_Load_12);
  final parameter Types.ComplexPerUnit u0Pu_Load_12 = ComplexMath.fromPolar(0.9975, SIunits.Conversions.from_deg(-5.93));
  final parameter Types.ComplexPerUnit i0Pu_Load_12 = ComplexMath.conj(s0Pu_Load_12 / u0Pu_Load_12);

  // Load_13 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_13 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_13 = 34.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_13 = Complex(P0Pu_Load_13, Q0Pu_Load_13);
  final parameter Types.ComplexPerUnit u0Pu_Load_13 = ComplexMath.fromPolar(0.9957, SIunits.Conversions.from_deg(-1.58));
  final parameter Types.ComplexPerUnit i0Pu_Load_13 = ComplexMath.conj(s0Pu_Load_13 / u0Pu_Load_13);

  // Load_22 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_22 = 280.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_22 = 79.9 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_22 = Complex(P0Pu_Load_22, Q0Pu_Load_22);
  final parameter Types.ComplexPerUnit u0Pu_Load_22 = ComplexMath.fromPolar(0.9952, SIunits.Conversions.from_deg(-21.89));
  final parameter Types.ComplexPerUnit i0Pu_Load_22 = ComplexMath.conj(s0Pu_Load_22 / u0Pu_Load_22);

  // Load_01 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_01 = 600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_01 = 148.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_01 = Complex(P0Pu_Load_01, Q0Pu_Load_01);
  final parameter Types.ComplexPerUnit u0Pu_Load_01 = ComplexMath.fromPolar(0.9988, SIunits.Conversions.from_deg(-84.71));
  final parameter Types.ComplexPerUnit i0Pu_Load_01 = ComplexMath.conj(s0Pu_Load_01 / u0Pu_Load_01);

  // Load_02 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_02 = 330.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_02 = 71 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_02 = Complex(P0Pu_Load_02, Q0Pu_Load_02);
  final parameter Types.ComplexPerUnit u0Pu_Load_02 = ComplexMath.fromPolar(1.0012, SIunits.Conversions.from_deg(-70.49));
  final parameter Types.ComplexPerUnit i0Pu_Load_02 = ComplexMath.conj(s0Pu_Load_02 / u0Pu_Load_02);

  // Load_03 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_03 = 260.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_03 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_03 = Complex(P0Pu_Load_03, Q0Pu_Load_03);
  final parameter Types.ComplexPerUnit u0Pu_Load_03 = ComplexMath.fromPolar(0.9974, SIunits.Conversions.from_deg(-79.97));
  final parameter Types.ComplexPerUnit i0Pu_Load_03 = ComplexMath.conj(s0Pu_Load_03 / u0Pu_Load_03);

  // Load_04 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_04 = 840.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_04 = 252.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_04 = Complex(P0Pu_Load_04, Q0Pu_Load_04);
  final parameter Types.ComplexPerUnit u0Pu_Load_04 = ComplexMath.fromPolar(0.9996, SIunits.Conversions.from_deg(-70.67));
  final parameter Types.ComplexPerUnit i0Pu_Load_04 = ComplexMath.conj(s0Pu_Load_04 / u0Pu_Load_04);

  // Load_05 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_05 = 720.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_05 = 190.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_05 = Complex(P0Pu_Load_05, Q0Pu_Load_05);
  final parameter Types.ComplexPerUnit u0Pu_Load_05 = ComplexMath.fromPolar(0.9961, SIunits.Conversions.from_deg(-74.59));
  final parameter Types.ComplexPerUnit i0Pu_Load_05 = ComplexMath.conj(s0Pu_Load_05 / u0Pu_Load_05);

  // Load_31 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_31 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_31 = 24.7 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_31 = Complex(P0Pu_Load_31, Q0Pu_Load_31);
  final parameter Types.ComplexPerUnit u0Pu_Load_31 = ComplexMath.fromPolar(1.0042, SIunits.Conversions.from_deg(-39.47));
  final parameter Types.ComplexPerUnit i0Pu_Load_31 = ComplexMath.conj(s0Pu_Load_31 / u0Pu_Load_31);

  // Load_32 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_32 = 200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_32 = 39.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_32 = Complex(P0Pu_Load_32, Q0Pu_Load_32);
  final parameter Types.ComplexPerUnit u0Pu_Load_32 = ComplexMath.fromPolar(0.9978, SIunits.Conversions.from_deg(-26.77));
  final parameter Types.ComplexPerUnit i0Pu_Load_32 = ComplexMath.conj(s0Pu_Load_32 / u0Pu_Load_32);

  // Load_41 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_41 = 540.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_41 = 131.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_41 = Complex(P0Pu_Load_41, Q0Pu_Load_41);
  final parameter Types.ComplexPerUnit u0Pu_Load_41 = ComplexMath.fromPolar(0.9967, SIunits.Conversions.from_deg(-57.14));
  final parameter Types.ComplexPerUnit i0Pu_Load_41 = ComplexMath.conj(s0Pu_Load_41 / u0Pu_Load_41);

  // Load_42 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_42 = 400.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_42 = 127.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_42 = Complex(P0Pu_Load_42, Q0Pu_Load_42);
  final parameter Types.ComplexPerUnit u0Pu_Load_42 = ComplexMath.fromPolar(0.9952, SIunits.Conversions.from_deg(-60.22));
  final parameter Types.ComplexPerUnit i0Pu_Load_42 = ComplexMath.conj(s0Pu_Load_42 / u0Pu_Load_42);

  // Load_43 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_43 = 900.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_43 = 254.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_43 = Complex(P0Pu_Load_43, Q0Pu_Load_43);
  final parameter Types.ComplexPerUnit u0Pu_Load_43 = ComplexMath.fromPolar(1.0013, SIunits.Conversions.from_deg(-66.33));
  final parameter Types.ComplexPerUnit i0Pu_Load_43 = ComplexMath.conj(s0Pu_Load_43 / u0Pu_Load_43);

  // Load_46 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_46 = 700.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_46 = 211.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_46 = Complex(P0Pu_Load_46, Q0Pu_Load_46);
  final parameter Types.ComplexPerUnit u0Pu_Load_46 = ComplexMath.fromPolar(0.999, SIunits.Conversions.from_deg(-66.93));
  final parameter Types.ComplexPerUnit i0Pu_Load_46 = ComplexMath.conj(s0Pu_Load_46 / u0Pu_Load_46);

  // Load_47 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_47 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_47 = 44.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_47 = Complex(P0Pu_Load_47, Q0Pu_Load_47);
  final parameter Types.ComplexPerUnit u0Pu_Load_47 = ComplexMath.fromPolar(0.995, SIunits.Conversions.from_deg(-62.38));
  final parameter Types.ComplexPerUnit i0Pu_Load_47 = ComplexMath.conj(s0Pu_Load_47 / u0Pu_Load_47);

  // Load_51 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_51 = 800.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_51 = 258.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_51 = Complex(P0Pu_Load_51, Q0Pu_Load_51);
  final parameter Types.ComplexPerUnit u0Pu_Load_51 = ComplexMath.fromPolar(0.9978, SIunits.Conversions.from_deg(-73.84));
  final parameter Types.ComplexPerUnit i0Pu_Load_51 = ComplexMath.conj(s0Pu_Load_51 / u0Pu_Load_51);

  // Load_61 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_61 = 500.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_61 = 122.5 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_61 = Complex(P0Pu_Load_61, Q0Pu_Load_61);
  final parameter Types.ComplexPerUnit u0Pu_Load_61 = ComplexMath.fromPolar(0.9949, SIunits.Conversions.from_deg(-60.78));
  final parameter Types.ComplexPerUnit i0Pu_Load_61 = ComplexMath.conj(s0Pu_Load_61 / u0Pu_Load_61);

  // Load_62 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_62 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_62 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_62 = Complex(P0Pu_Load_62, Q0Pu_Load_62);
  final parameter Types.ComplexPerUnit u0Pu_Load_62 = ComplexMath.fromPolar(1.0002, SIunits.Conversions.from_deg(-57.18));
  final parameter Types.ComplexPerUnit i0Pu_Load_62 = ComplexMath.conj(s0Pu_Load_62 / u0Pu_Load_62);

  // Load_63 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_63 = 590.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_63 = 264.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_63 = Complex(P0Pu_Load_63, Q0Pu_Load_63);
  final parameter Types.ComplexPerUnit u0Pu_Load_63 = ComplexMath.fromPolar(0.9992, SIunits.Conversions.from_deg(-53.49));
  final parameter Types.ComplexPerUnit i0Pu_Load_63 = ComplexMath.conj(s0Pu_Load_63 / u0Pu_Load_63);

  // Load_71 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_71 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_71 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_71 = Complex(P0Pu_Load_71, Q0Pu_Load_71);
  final parameter Types.ComplexPerUnit u0Pu_Load_71 = ComplexMath.fromPolar(1.0028, SIunits.Conversions.from_deg(-7.8));
  final parameter Types.ComplexPerUnit i0Pu_Load_71 = ComplexMath.conj(s0Pu_Load_71 / u0Pu_Load_71);

  // Load_72 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_72 = 2000.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_72 = 396.1 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_72 = Complex(P0Pu_Load_72, Q0Pu_Load_72);
  final parameter Types.ComplexPerUnit u0Pu_Load_72 = ComplexMath.fromPolar(0.9974, SIunits.Conversions.from_deg(-6.83));
  final parameter Types.ComplexPerUnit i0Pu_Load_72 = ComplexMath.conj(s0Pu_Load_72 / u0Pu_Load_72);

  // shunt_1022 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_1022 = ComplexMath.fromPolar(1.0512, SIunits.Conversions.from_deg(-19.05));
  final parameter Types.PerUnit BPu_shunt_1022 = -50.0 / Electrical.SystemBase.SnRef;

  // shunt_1041 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_1041 = ComplexMath.fromPolar(1.0124, SIunits.Conversions.from_deg(-81.87));
  final parameter Types.PerUnit BPu_shunt_1041 = -250.0 / Electrical.SystemBase.SnRef;

  // shunt_1043 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_1043 = ComplexMath.fromPolar(1.0274, SIunits.Conversions.from_deg(-76.77));
  final parameter Types.PerUnit BPu_shunt_1043 = -200.0 / Electrical.SystemBase.SnRef;

  // shunt_1044 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_1044 = ComplexMath.fromPolar(1.0066, SIunits.Conversions.from_deg(-67.71));
  final parameter Types.PerUnit BPu_shunt_1044 = -200.0 / Electrical.SystemBase.SnRef;

  // shunt_1045 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_1045 = ComplexMath.fromPolar(1.0111, SIunits.Conversions.from_deg(-71.66));
  final parameter Types.PerUnit BPu_shunt_1045 = -200.0 / Electrical.SystemBase.SnRef;

  // shunt_4012 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4012 = ComplexMath.fromPolar(1.0235, SIunits.Conversions.from_deg(-5.54));
  final parameter Types.PerUnit BPu_shunt_4012 = 100.0 / Electrical.SystemBase.SnRef;

  // shunt_4041 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4041 = ComplexMath.fromPolar(1.0506, SIunits.Conversions.from_deg(-54.30));
  final parameter Types.PerUnit BPu_shunt_4041 = -200.0 / Electrical.SystemBase.SnRef;

  // shunt_4043 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4043 = ComplexMath.fromPolar(1.0370, SIunits.Conversions.from_deg(-63.51));
  final parameter Types.PerUnit BPu_shunt_4043 = -200.0 / Electrical.SystemBase.SnRef;

  // shunt_4046 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4046 = ComplexMath.fromPolar(1.0357, SIunits.Conversions.from_deg(-64.11));
  final parameter Types.PerUnit BPu_shunt_4046 = -100.0 / Electrical.SystemBase.SnRef;

  // shunt_4051 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4051 = ComplexMath.fromPolar(1.0659, SIunits.Conversions.from_deg(-71.01));
  final parameter Types.PerUnit BPu_shunt_4051 = -100.0 / Electrical.SystemBase.SnRef;

  // shunt_4071 init values:
  final parameter Types.ComplexPerUnit u0Pu_shunt_4071 = ComplexMath.fromPolar(1.0484, SIunits.Conversions.from_deg(-4.99));
  final parameter Types.PerUnit BPu_shunt_4071 = 400.0 / Electrical.SystemBase.SnRef;


equation

  connect(slackbus_g20.terminal, bus_BG20.terminal);
  connect(g09.terminal, bus_BG09.terminal);
  connect(g01.terminal, bus_BG01.terminal);
  connect(g10.terminal, bus_BG10.terminal);
  connect(g02.terminal, bus_BG02.terminal);
  connect(g03.terminal, bus_BG03.terminal);
  connect(g04.terminal, bus_BG04.terminal);
  connect(g05.terminal, bus_BG05.terminal);
  connect(g06.terminal, bus_BG06.terminal);
  connect(g07.terminal, bus_BG07.terminal);
  connect(g12.terminal, bus_BG12.terminal);
  connect(g08.terminal, bus_BG08.terminal);
  connect(g11.terminal, bus_BG11.terminal);
  connect(g13.terminal, bus_BG13.terminal);
  connect(g14.terminal, bus_BG14.terminal);
  connect(g15.terminal, bus_BG15.terminal);
  connect(g16.terminal, bus_BG16.terminal);
  connect(g17.terminal, bus_BG17.terminal);
  connect(g18.terminal, bus_BG18.terminal);
  connect(g19.terminal, bus_BG19.terminal);
  connect(load_11.terminal, bus_B11.terminal);
  connect(load_12.terminal, bus_B12.terminal);
  connect(load_13.terminal, bus_B13.terminal);
  connect(load_22.terminal, bus_B22.terminal);
  connect(load_01.terminal, bus_B01.terminal);
  connect(load_02.terminal, bus_B02.terminal);
  connect(load_03.terminal, bus_B03.terminal);
  connect(load_04.terminal, bus_B04.terminal);
  connect(load_05.terminal, bus_B05.terminal);
  connect(load_31.terminal, bus_B31.terminal);
  connect(load_32.terminal, bus_B32.terminal);
  connect(load_41.terminal, bus_B41.terminal);
  connect(load_42.terminal, bus_B42.terminal);
  connect(load_43.terminal, bus_B43.terminal);
  connect(load_46.terminal, bus_B46.terminal);
  connect(load_47.terminal, bus_B47.terminal);
  connect(load_51.terminal, bus_B51.terminal);
  connect(load_61.terminal, bus_B61.terminal);
  connect(load_62.terminal, bus_B62.terminal);
  connect(load_63.terminal, bus_B63.terminal);
  connect(load_71.terminal, bus_B71.terminal);
  connect(load_72.terminal, bus_B72.terminal);
  connect(shunt_1022.terminal, bus_1022.terminal);
  connect(shunt_1041.terminal, bus_1041.terminal);
  connect(shunt_1043.terminal, bus_1043.terminal);
  connect(shunt_1044.terminal, bus_1044.terminal);
  connect(shunt_1045.terminal, bus_1045.terminal);
  connect(shunt_4012.terminal, bus_4012.terminal);
  connect(shunt_4041.terminal, bus_4041.terminal);
  connect(shunt_4043.terminal, bus_4043.terminal);
  connect(shunt_4046.terminal, bus_4046.terminal);
  connect(shunt_4051.terminal, bus_4051.terminal);
  connect(shunt_4071.terminal, bus_4071.terminal);

  g09.switchOffSignal1.value = false;
  g09.switchOffSignal2.value = false;
  g09.switchOffSignal3.value = false;
  g09.omegaRefPu.value = 1;
  g01.switchOffSignal1.value = false;
  g01.switchOffSignal2.value = false;
  g01.switchOffSignal3.value = false;
  g01.omegaRefPu.value = 1;
  g10.switchOffSignal1.value = false;
  g10.switchOffSignal2.value = false;
  g10.switchOffSignal3.value = false;
  g10.omegaRefPu.value = 1;
  g02.switchOffSignal1.value = false;
  g02.switchOffSignal2.value = false;
  g02.switchOffSignal3.value = false;
  g02.omegaRefPu.value = 1;
  g03.switchOffSignal1.value = false;
  g03.switchOffSignal2.value = false;
  g03.switchOffSignal3.value = false;
  g03.omegaRefPu.value = 1;
  g04.switchOffSignal1.value = false;
  g04.switchOffSignal2.value = false;
  g04.switchOffSignal3.value = false;
  g04.omegaRefPu.value = 1;
  g05.switchOffSignal1.value = false;
  g05.switchOffSignal2.value = false;
  g05.switchOffSignal3.value = false;
  g05.omegaRefPu.value = 1;
  g06.switchOffSignal1.value = false;
  g06.switchOffSignal2.value = false;
  g06.switchOffSignal3.value = false;
  g06.omegaRefPu.value = 1;
  g07.switchOffSignal1.value = false;
  g07.switchOffSignal2.value = false;
  g07.switchOffSignal3.value = false;
  g07.omegaRefPu.value = 1;
  g12.switchOffSignal1.value = false;
  g12.switchOffSignal2.value = false;
  g12.switchOffSignal3.value = false;
  g12.omegaRefPu.value = 1;
  g08.switchOffSignal1.value = false;
  g08.switchOffSignal2.value = false;
  g08.switchOffSignal3.value = false;
  g08.omegaRefPu.value = 1;
  g11.switchOffSignal1.value = false;
  g11.switchOffSignal2.value = false;
  g11.switchOffSignal3.value = false;
  g11.omegaRefPu.value = 1;
  g13.switchOffSignal1.value = false;
  g13.switchOffSignal2.value = false;
  g13.switchOffSignal3.value = false;
  g13.omegaRefPu.value = 1;
  g14.switchOffSignal1.value = false;
  g14.switchOffSignal2.value = false;
  g14.switchOffSignal3.value = false;
  g14.omegaRefPu.value = 1;
  g15.switchOffSignal1.value = false;
  g15.switchOffSignal2.value = false;
  g15.switchOffSignal3.value = false;
  g15.omegaRefPu.value = 1;
  g16.switchOffSignal1.value = false;
  g16.switchOffSignal2.value = false;
  g16.switchOffSignal3.value = false;
  g16.omegaRefPu.value = 1;
  g17.switchOffSignal1.value = false;
  g17.switchOffSignal2.value = false;
  g17.switchOffSignal3.value = false;
  g17.omegaRefPu.value = 1;
  g18.switchOffSignal1.value = false;
  g18.switchOffSignal2.value = false;
  g18.switchOffSignal3.value = false;
  g18.omegaRefPu.value = 1;
  g19.switchOffSignal1.value = false;
  g19.switchOffSignal2.value = false;
  g19.switchOffSignal3.value = false;
  g19.omegaRefPu.value = 1;
  load_11.switchOffSignal1.value = false;
  load_11.switchOffSignal2.value = false;
  der(load_11.PRefPu.value) = 0;
  der(load_11.QRefPu.value) = 0;
  load_12.switchOffSignal1.value = false;
  load_12.switchOffSignal2.value = false;
  der(load_12.PRefPu.value) = 0;
  der(load_12.QRefPu.value) = 0;
  load_13.switchOffSignal1.value = false;
  load_13.switchOffSignal2.value = false;
  der(load_13.PRefPu.value) = 0;
  der(load_13.QRefPu.value) = 0;
  load_22.switchOffSignal1.value = false;
  load_22.switchOffSignal2.value = false;
  der(load_22.PRefPu.value) = 0;
  der(load_22.QRefPu.value) = 0;
  load_01.switchOffSignal1.value = false;
  load_01.switchOffSignal2.value = false;
  der(load_01.PRefPu.value) = 0;
  der(load_01.QRefPu.value) = 0;
  load_02.switchOffSignal1.value = false;
  load_02.switchOffSignal2.value = false;
  der(load_02.PRefPu.value) = 0;
  der(load_02.QRefPu.value) = 0;
  load_03.switchOffSignal1.value = false;
  load_03.switchOffSignal2.value = false;
  der(load_03.PRefPu.value) = 0;
  der(load_03.QRefPu.value) = 0;
  load_04.switchOffSignal1.value = false;
  load_04.switchOffSignal2.value = false;
  der(load_04.PRefPu.value) = 0;
  der(load_04.QRefPu.value) = 0;
  load_05.switchOffSignal1.value = false;
  load_05.switchOffSignal2.value = false;
  der(load_05.PRefPu.value) = 0;
  der(load_05.QRefPu.value) = 0;
  load_31.switchOffSignal1.value = false;
  load_31.switchOffSignal2.value = false;
  der(load_31.PRefPu.value) = 0;
  der(load_31.QRefPu.value) = 0;
  load_32.switchOffSignal1.value = false;
  load_32.switchOffSignal2.value = false;
  der(load_32.PRefPu.value) = 0;
  der(load_32.QRefPu.value) = 0;
  load_41.switchOffSignal1.value = false;
  load_41.switchOffSignal2.value = false;
  der(load_41.PRefPu.value) = 0;
  der(load_41.QRefPu.value) = 0;
  load_42.switchOffSignal1.value = false;
  load_42.switchOffSignal2.value = false;
  der(load_42.PRefPu.value) = 0;
  der(load_42.QRefPu.value) = 0;
  load_43.switchOffSignal1.value = false;
  load_43.switchOffSignal2.value = false;
  der(load_43.PRefPu.value) = 0;
  der(load_43.QRefPu.value) = 0;
  load_46.switchOffSignal1.value = false;
  load_46.switchOffSignal2.value = false;
  der(load_46.PRefPu.value) = 0;
  der(load_46.QRefPu.value) = 0;
  load_47.switchOffSignal1.value = false;
  load_47.switchOffSignal2.value = false;
  der(load_47.PRefPu.value) = 0;
  der(load_47.QRefPu.value) = 0;
  load_51.switchOffSignal1.value = false;
  load_51.switchOffSignal2.value = false;
  der(load_51.PRefPu.value) = 0;
  der(load_51.QRefPu.value) = 0;
  load_61.switchOffSignal1.value = false;
  load_61.switchOffSignal2.value = false;
  der(load_61.PRefPu.value) = 0;
  der(load_61.QRefPu.value) = 0;
  load_62.switchOffSignal1.value = false;
  load_62.switchOffSignal2.value = false;
  der(load_62.PRefPu.value) = 0;
  der(load_62.QRefPu.value) = 0;
  load_63.switchOffSignal1.value = false;
  load_63.switchOffSignal2.value = false;
  der(load_63.PRefPu.value) = 0;
  der(load_63.QRefPu.value) = 0;
  load_71.switchOffSignal1.value = false;
  load_71.switchOffSignal2.value = false;
  der(load_71.PRefPu.value) = 0;
  der(load_71.QRefPu.value) = 0;
  load_72.switchOffSignal1.value = false;
  load_72.switchOffSignal2.value = false;
  der(load_72.PRefPu.value) = 0;
  der(load_72.QRefPu.value) = 0;
  shunt_1022.switchOffSignal1.value = false;
  shunt_1022.switchOffSignal2.value = false;
  shunt_1041.switchOffSignal1.value = false;
  shunt_1041.switchOffSignal2.value = false;
  shunt_1043.switchOffSignal1.value = false;
  shunt_1043.switchOffSignal2.value = false;
  shunt_1044.switchOffSignal1.value = false;
  shunt_1044.switchOffSignal2.value = false;
  shunt_1045.switchOffSignal1.value = false;
  shunt_1045.switchOffSignal2.value = false;
  shunt_4012.switchOffSignal1.value = false;
  shunt_4012.switchOffSignal2.value = false;
  shunt_4041.switchOffSignal1.value = false;
  shunt_4041.switchOffSignal2.value = false;
  shunt_4043.switchOffSignal1.value = false;
  shunt_4043.switchOffSignal2.value = false;
  shunt_4046.switchOffSignal1.value = false;
  shunt_4046.switchOffSignal2.value = false;
  shunt_4051.switchOffSignal1.value = false;
  shunt_4051.switchOffSignal2.value = false;
  shunt_4071.switchOffSignal1.value = false;
  shunt_4071.switchOffSignal2.value = false;
  Check_g20_P= Electrical.SystemBase.SnRef*ComplexMath.real(slackbus_g20.terminal.V*ComplexMath.conj(slackbus_g20.terminal.i));
  Check_g20_Q= Electrical.SystemBase.SnRef*ComplexMath.imag(slackbus_g20.terminal.V*ComplexMath.conj(slackbus_g20.terminal.i));


end Loadflow;