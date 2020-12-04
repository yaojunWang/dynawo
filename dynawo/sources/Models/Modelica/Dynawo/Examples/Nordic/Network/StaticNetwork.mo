within Dynawo.Examples.Nordic.Network;

model StaticNetwork
 
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.SIunits;
  import Dynawo;
  import Dynawo.Electrical;
  import Dynawo.Types;
  import Dynawo.Examples.Nordic;

  Electrical.Buses.Bus bus_1011;
  Electrical.Buses.Bus bus_4011;
  Electrical.Buses.Bus bus_B11;
  Electrical.Buses.Bus bus_BG09;
  Electrical.Buses.Bus bus_1012;
  Electrical.Buses.Bus bus_4012;
  Electrical.Buses.Bus bus_B12;
  Electrical.Buses.Bus bus_BG01;
  Electrical.Buses.Bus bus_BG10;
  Electrical.Buses.Bus bus_1013;
  Electrical.Buses.Bus bus_B13;
  Electrical.Buses.Bus bus_BG02;
  Electrical.Buses.Bus bus_1014;
  Electrical.Buses.Bus bus_BG03;
  Electrical.Buses.Bus bus_1021;
  Electrical.Buses.Bus bus_BG04;
  Electrical.Buses.Bus bus_1022;
  Electrical.Buses.Bus bus_4022;
  Electrical.Buses.Bus bus_B22;
  Electrical.Buses.Bus bus_BG05;
  Electrical.Buses.Bus bus_1041;
  Electrical.Buses.Bus bus_B01;
  Electrical.Buses.Bus bus_1042;
  Electrical.Buses.Bus bus_B02;
  Electrical.Buses.Bus bus_BG06;
  Electrical.Buses.Bus bus_1043;
  Electrical.Buses.Bus bus_B03;
  Electrical.Buses.Bus bus_BG07;
  Electrical.Buses.Bus bus_1044;
  Electrical.Buses.Bus bus_4044;
  Electrical.Buses.Bus bus_B04;
  Electrical.Buses.Bus bus_1045;
  Electrical.Buses.Bus bus_4045;
  Electrical.Buses.Bus bus_B05;
  Electrical.Buses.Bus bus_2031;
  Electrical.Buses.Bus bus_4031;
  Electrical.Buses.Bus bus_B31;
  Electrical.Buses.Bus bus_BG12;
  Electrical.Buses.Bus bus_2032;
  Electrical.Buses.Bus bus_B32;
  Electrical.Buses.Bus bus_BG08;
  Electrical.Buses.Bus bus_4021;
  Electrical.Buses.Bus bus_BG11;
  Electrical.Buses.Bus bus_4032;
  Electrical.Buses.Bus bus_4041;
  Electrical.Buses.Bus bus_B41;
  Electrical.Buses.Bus bus_BG13;
  Electrical.Buses.Bus bus_4042;
  Electrical.Buses.Bus bus_B42;
  Electrical.Buses.Bus bus_BG14;
  Electrical.Buses.Bus bus_4043;
  Electrical.Buses.Bus bus_B43;
  Electrical.Buses.Bus bus_4046;
  Electrical.Buses.Bus bus_B46;
  Electrical.Buses.Bus bus_4047;
  Electrical.Buses.Bus bus_B47;
  Electrical.Buses.Bus bus_BG15;
  Electrical.Buses.Bus bus_4051;
  Electrical.Buses.Bus bus_B51;
  Electrical.Buses.Bus bus_BG16;
  Electrical.Buses.Bus bus_4061;
  Electrical.Buses.Bus bus_B61;
  Electrical.Buses.Bus bus_4062;
  Electrical.Buses.Bus bus_B62;
  Electrical.Buses.Bus bus_BG17;
  Electrical.Buses.Bus bus_4063;
  Electrical.Buses.Bus bus_B63;
  Electrical.Buses.Bus bus_BG18;
  Electrical.Buses.Bus bus_4071;
  Electrical.Buses.Bus bus_B71;
  Electrical.Buses.Bus bus_BG19;
  Electrical.Buses.Bus bus_4072;
  Electrical.Buses.Bus bus_B72;
  Electrical.Buses.Bus bus_BG20;
  Electrical.Loads.LoadAlphaBeta load_11(alpha = 1, beta = 2, s0Pu = s0Pu_Load_11, u0Pu = u0Pu_Load_11, i0Pu = i0Pu_Load_11);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_11(Value0=P0Pu_Load_11);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_11(Value0=Q0Pu_Load_11);
  Electrical.Loads.LoadAlphaBeta load_12(alpha = 1, beta = 2, s0Pu = s0Pu_Load_12, u0Pu = u0Pu_Load_12, i0Pu = i0Pu_Load_12);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_12(Value0=P0Pu_Load_12);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_12(Value0=Q0Pu_Load_12);
  Electrical.Loads.LoadAlphaBeta load_13(alpha = 1, beta = 2, s0Pu = s0Pu_Load_13, u0Pu = u0Pu_Load_13, i0Pu = i0Pu_Load_13);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_13(Value0=P0Pu_Load_13);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_13(Value0=Q0Pu_Load_13);
  Electrical.Loads.LoadAlphaBeta load_22(alpha = 1, beta = 2, s0Pu = s0Pu_Load_22, u0Pu = u0Pu_Load_22, i0Pu = i0Pu_Load_22);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_22(Value0=P0Pu_Load_22);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_22(Value0=Q0Pu_Load_22);
  Electrical.Loads.LoadAlphaBeta load_01(alpha = 1, beta = 2, s0Pu = s0Pu_Load_01, u0Pu = u0Pu_Load_01, i0Pu = i0Pu_Load_01);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_01(Value0=P0Pu_Load_01);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_01(Value0=Q0Pu_Load_01);
  Electrical.Loads.LoadAlphaBeta load_02(alpha = 1, beta = 2, s0Pu = s0Pu_Load_02, u0Pu = u0Pu_Load_02, i0Pu = i0Pu_Load_02);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_02(Value0=P0Pu_Load_02);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_02(Value0=Q0Pu_Load_02);
  Electrical.Loads.LoadAlphaBeta load_03(alpha = 1, beta = 2, s0Pu = s0Pu_Load_03, u0Pu = u0Pu_Load_03, i0Pu = i0Pu_Load_03);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_03(Value0=P0Pu_Load_03);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_03(Value0=Q0Pu_Load_03);
  Electrical.Loads.LoadAlphaBeta load_04(alpha = 1, beta = 2, s0Pu = s0Pu_Load_04, u0Pu = u0Pu_Load_04, i0Pu = i0Pu_Load_04);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_04(Value0=P0Pu_Load_04);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_04(Value0=Q0Pu_Load_04);
  Electrical.Loads.LoadAlphaBeta load_05(alpha = 1, beta = 2, s0Pu = s0Pu_Load_05, u0Pu = u0Pu_Load_05, i0Pu = i0Pu_Load_05);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_05(Value0=P0Pu_Load_05);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_05(Value0=Q0Pu_Load_05);
  Electrical.Loads.LoadAlphaBeta load_31(alpha = 1, beta = 2, s0Pu = s0Pu_Load_31, u0Pu = u0Pu_Load_31, i0Pu = i0Pu_Load_31);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_31(Value0=P0Pu_Load_31);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_31(Value0=Q0Pu_Load_31);
  Electrical.Loads.LoadAlphaBeta load_32(alpha = 1, beta = 2, s0Pu = s0Pu_Load_32, u0Pu = u0Pu_Load_32, i0Pu = i0Pu_Load_32);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_32(Value0=P0Pu_Load_32);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_32(Value0=Q0Pu_Load_32);
  Electrical.Loads.LoadAlphaBeta load_41(alpha = 1, beta = 2, s0Pu = s0Pu_Load_41, u0Pu = u0Pu_Load_41, i0Pu = i0Pu_Load_41);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_41(Value0=P0Pu_Load_41);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_41(Value0=Q0Pu_Load_41);
  Electrical.Loads.LoadAlphaBeta load_42(alpha = 1, beta = 2, s0Pu = s0Pu_Load_42, u0Pu = u0Pu_Load_42, i0Pu = i0Pu_Load_42);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_42(Value0=P0Pu_Load_42);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_42(Value0=Q0Pu_Load_42);
  Electrical.Loads.LoadAlphaBeta load_43(alpha = 1, beta = 2, s0Pu = s0Pu_Load_43, u0Pu = u0Pu_Load_43, i0Pu = i0Pu_Load_43);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_43(Value0=P0Pu_Load_43);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_43(Value0=Q0Pu_Load_43);
  Electrical.Loads.LoadAlphaBeta load_46(alpha = 1, beta = 2, s0Pu = s0Pu_Load_46, u0Pu = u0Pu_Load_46, i0Pu = i0Pu_Load_46);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_46(Value0=P0Pu_Load_46);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_46(Value0=Q0Pu_Load_46);
  Electrical.Loads.LoadAlphaBeta load_47(alpha = 1, beta = 2, s0Pu = s0Pu_Load_47, u0Pu = u0Pu_Load_47, i0Pu = i0Pu_Load_47);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_47(Value0=P0Pu_Load_47);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_47(Value0=Q0Pu_Load_47);
  Electrical.Loads.LoadAlphaBeta load_51(alpha = 1, beta = 2, s0Pu = s0Pu_Load_51, u0Pu = u0Pu_Load_51, i0Pu = i0Pu_Load_51);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_51(Value0=P0Pu_Load_51);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_51(Value0=Q0Pu_Load_51);
  Electrical.Loads.LoadAlphaBeta load_61(alpha = 1, beta = 2, s0Pu = s0Pu_Load_61, u0Pu = u0Pu_Load_61, i0Pu = i0Pu_Load_61);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_61(Value0=P0Pu_Load_61);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_61(Value0=Q0Pu_Load_61);
  Electrical.Loads.LoadAlphaBeta load_62(alpha = 1, beta = 2, s0Pu = s0Pu_Load_62, u0Pu = u0Pu_Load_62, i0Pu = i0Pu_Load_62);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_62(Value0=P0Pu_Load_62);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_62(Value0=Q0Pu_Load_62);
  Electrical.Loads.LoadAlphaBeta load_63(alpha = 1, beta = 2, s0Pu = s0Pu_Load_63, u0Pu = u0Pu_Load_63, i0Pu = i0Pu_Load_63);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_63(Value0=P0Pu_Load_63);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_63(Value0=Q0Pu_Load_63);
  Electrical.Loads.LoadAlphaBeta load_71(alpha = 1, beta = 2, s0Pu = s0Pu_Load_71, u0Pu = u0Pu_Load_71, i0Pu = i0Pu_Load_71);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_71(Value0=P0Pu_Load_71);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_71(Value0=Q0Pu_Load_71);
  Electrical.Loads.LoadAlphaBeta load_72(alpha = 1, beta = 2, s0Pu = s0Pu_Load_72, u0Pu = u0Pu_Load_72, i0Pu = i0Pu_Load_72);
  Dynawo.Electrical.Controls.Basics.SetPoint PrefPu_load_72(Value0=P0Pu_Load_72);
  Dynawo.Electrical.Controls.Basics.SetPoint QrefPu_load_72(Value0=Q0Pu_Load_72);
  Electrical.Lines.Line line_1011_1013a(BPu = 4.0841e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 11.83 / XBase_130);
  Electrical.Lines.Line line_1011_1013b(BPu = 4.0841e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 11.83 / XBase_130);
  Electrical.Lines.Line line_1012_1014a(BPu = 5.3407e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 2.37 / XBase_130, XPu = 15.21 / XBase_130);
  Electrical.Lines.Line line_1012_1014b(BPu = 5.3407e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 2.37 / XBase_130, XPu = 15.21 / XBase_130);
  Electrical.Lines.Line line_1013_1014a(BPu = 2.9845e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.18 / XBase_130, XPu = 8.450 / XBase_130);
  Electrical.Lines.Line line_1013_1014b(BPu = 2.9845e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.18 / XBase_130, XPu = 8.450 / XBase_130);
  Electrical.Lines.Line line_1021_1022a(BPu = 8.9535e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 5.07 / XBase_130, XPu = 33.80 / XBase_130);
  Electrical.Lines.Line line_1021_1022b(BPu = 8.9535e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 5.07 / XBase_130, XPu = 33.80 / XBase_130);
  Electrical.Lines.Line line_1041_1043a(BPu = 3.6128e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 10.14 / XBase_130);
  Electrical.Lines.Line line_1041_1043b(BPu = 3.6128e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 10.14 / XBase_130);
  Electrical.Lines.Line line_1041_1045a(BPu = 7.3827e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 2.53 / XBase_130, XPu = 20.28 / XBase_130);
  Electrical.Lines.Line line_1041_1045b(BPu = 7.3827e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 2.53 / XBase_130, XPu = 20.28 / XBase_130);
  Electrical.Lines.Line line_1042_1044a(BPu = 1.7750e-4 * XBase_130, GPu = 0 * XBase_130, RPu = 6.42 / XBase_130, XPu = 47.32 / XBase_130);
  Electrical.Lines.Line line_1042_1044b(BPu = 1.7750e-4 * XBase_130, GPu = 0 * XBase_130, RPu = 6.42 / XBase_130, XPu = 47.32 / XBase_130);
  Electrical.Lines.Line line_1042_1045(BPu = 1.7750e-4 * XBase_130, GPu = 0 * XBase_130, RPu = 8.45 / XBase_130, XPu = 50.70 / XBase_130);
  Electrical.Lines.Line line_1043_1044a(BPu = 4.7124e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 13.52 / XBase_130);
  Electrical.Lines.Line line_1043_1044b(BPu = 4.7124e-5 * XBase_130, GPu = 0 * XBase_130, RPu = 1.69 / XBase_130, XPu = 13.52 / XBase_130);
  Electrical.Lines.Line line_2031_2032a(BPu = 1.5708e-5 * XBase_220, GPu = 0 * XBase_220, RPu = 5.81 / XBase_220, XPu = 43.56 / XBase_220);
  Electrical.Lines.Line line_2031_2032b(BPu = 1.5708e-5 * XBase_220, GPu = 0 * XBase_220, RPu = 5.81 / XBase_220, XPu = 43.56 / XBase_220);
  Electrical.Lines.Line line_4011_4012(BPu = 6.2832e-5 * XBase_400, GPu = 0 * XBase_400, RPu = 1.60 / XBase_400, XPu = 12.80 / XBase_400);
  Electrical.Lines.Line line_4011_4021(BPu = 5.6234e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 9.60 / XBase_400, XPu = 96.00 / XBase_400);
  Electrical.Lines.Line line_4011_4022(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4011_4071(BPu = 4.3825e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 8.00 / XBase_400, XPu = 72.00 / XBase_400);
  Electrical.Lines.Line line_4012_4022(BPu = 3.2830e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 56.00 / XBase_400);
  Electrical.Lines.Line line_4012_4071(BPu = 4.6810e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 8.00 / XBase_400, XPu = 80.00 / XBase_400);
  Electrical.Lines.Line line_4021_4032(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4021_4042(BPu = 9.3777e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 16.0 / XBase_400, XPu = 96.0 / XBase_400);
  Electrical.Lines.Line line_4022_4031a(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4022_4031b(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4031_4032(BPu = 9.4248e-5 * XBase_400, GPu = 0 * XBase_400, RPu = 1.60 / XBase_400, XPu = 16.00 / XBase_400);
  Electrical.Lines.Line line_4031_4041a(BPu = 7.4927e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 9.60 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4031_4041b(BPu = 7.4927e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 9.60 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4032_4042(BPu = 6.2518e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 16.0 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4032_4044(BPu = 7.4927e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 9.60 / XBase_400, XPu = 80.00 / XBase_400);
  Electrical.Lines.Line line_4041_4044(BPu = 2.8117e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 4.80 / XBase_400, XPu = 48.00 / XBase_400);
  Electrical.Lines.Line line_4041_4061(BPu = 4.0684e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 9.60 / XBase_400, XPu = 72.00 / XBase_400);
  Electrical.Lines.Line line_4042_4043(BPu = 1.5551e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 24.00 / XBase_400);
  Electrical.Lines.Line line_4042_4044(BPu = 1.8693e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 32.00 / XBase_400);
  Electrical.Lines.Line line_4043_4044(BPu = 9.4248e-5 * XBase_400, GPu = 0 * XBase_400, RPu = 1.60 / XBase_400, XPu = 16.00 / XBase_400);
  Electrical.Lines.Line line_4043_4046(BPu = 9.4248e-5 * XBase_400, GPu = 0 * XBase_400, RPu = 1.60 / XBase_400, XPu = 16.00 / XBase_400);
  Electrical.Lines.Line line_4043_4047(BPu = 1.8693e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 32.00 / XBase_400);
  Electrical.Lines.Line line_4044_4045a(BPu = 1.8693e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 32.00 / XBase_400);
  Electrical.Lines.Line line_4044_4045b(BPu = 1.8693e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 32.00 / XBase_400);
  Electrical.Lines.Line line_4045_4051a(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4045_4051b(BPu = 3.7542e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 6.40 / XBase_400, XPu = 64.00 / XBase_400);
  Electrical.Lines.Line line_4045_4062(BPu = 7.4927e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 17.6 / XBase_400, XPu = 128.00 / XBase_400);
  Electrical.Lines.Line line_4046_4047(BPu = 1.5551e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 1.60 / XBase_400, XPu = 24.00 / XBase_400);
  Electrical.Lines.Line line_4061_4062(BPu = 1.8693e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 3.20 / XBase_400, XPu = 32.00 / XBase_400);
  Electrical.Lines.Line line_4062_4063a(BPu = 2.8117e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 4.80 / XBase_400, XPu = 48.00 / XBase_400);
  Electrical.Lines.Line line_4062_4063b(BPu = 2.8117e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 4.80 / XBase_400, XPu = 48.00 / XBase_400);
  Electrical.Lines.Line line_4071_4072a(BPu = 9.3777e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 4.80 / XBase_400, XPu = 48.00 / XBase_400);
  Electrical.Lines.Line line_4071_4072b(BPu = 9.3777e-4 * XBase_400, GPu = 0 * XBase_400, RPu = 4.80 / XBase_400, XPu = 48.00 / XBase_400);
  Dynawo.Electrical.Shunts.ShuntB shunt_1022(BPu = BPu_shunt_1022, u0Pu = u0Pu_shunt_1022, s0Pu = s0Pu_shunt_1022, i0Pu = i0Pu_shunt_1022);
  Dynawo.Electrical.Shunts.ShuntB shunt_1041(BPu = BPu_shunt_1041, u0Pu = u0Pu_shunt_1041, s0Pu = s0Pu_shunt_1041, i0Pu = i0Pu_shunt_1041);
  Dynawo.Electrical.Shunts.ShuntB shunt_1043(BPu = BPu_shunt_1043, u0Pu = u0Pu_shunt_1043, s0Pu = s0Pu_shunt_1043, i0Pu = i0Pu_shunt_1043);
  Dynawo.Electrical.Shunts.ShuntB shunt_1044(BPu = BPu_shunt_1044, u0Pu = u0Pu_shunt_1044, s0Pu = s0Pu_shunt_1044, i0Pu = i0Pu_shunt_1044);
  Dynawo.Electrical.Shunts.ShuntB shunt_1045(BPu = BPu_shunt_1045, u0Pu = u0Pu_shunt_1045, s0Pu = s0Pu_shunt_1045, i0Pu = i0Pu_shunt_1045);
  Dynawo.Electrical.Shunts.ShuntB shunt_4012(BPu = BPu_shunt_4012, u0Pu = u0Pu_shunt_4012, s0Pu = s0Pu_shunt_4012, i0Pu = i0Pu_shunt_4012);
  Dynawo.Electrical.Shunts.ShuntB shunt_4041(BPu = BPu_shunt_4041, u0Pu = u0Pu_shunt_4041, s0Pu = s0Pu_shunt_4041, i0Pu = i0Pu_shunt_4041);
  Dynawo.Electrical.Shunts.ShuntB shunt_4043(BPu = BPu_shunt_4043, u0Pu = u0Pu_shunt_4043, s0Pu = s0Pu_shunt_4043, i0Pu = i0Pu_shunt_4043);
  Dynawo.Electrical.Shunts.ShuntB shunt_4046(BPu = BPu_shunt_4046, u0Pu = u0Pu_shunt_4046, s0Pu = s0Pu_shunt_4046, i0Pu = i0Pu_shunt_4046);
  Dynawo.Electrical.Shunts.ShuntB shunt_4051(BPu = BPu_shunt_4051, u0Pu = u0Pu_shunt_4051, s0Pu = s0Pu_shunt_4051, i0Pu = i0Pu_shunt_4051);
  Dynawo.Electrical.Shunts.ShuntB shunt_4071(BPu = BPu_shunt_4071, u0Pu = u0Pu_shunt_4071, s0Pu = s0Pu_shunt_4071, i0Pu = i0Pu_shunt_4071);

protected
  // Load_11 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_11 = 200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_11 = 68.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_11 = Complex(P0Pu_Load_11, Q0Pu_Load_11);
  final parameter Types.Angle UPhase0_Load_11 = SIunits.Conversions.from_deg(-9.45);
  final parameter Types.VoltageModule U0Pu_Load_11 = 1.0026;
  final parameter Types.ComplexPerUnit u0Pu_Load_11 = ComplexMath.fromPolar(U0Pu_Load_11, UPhase0_Load_11);
  final parameter Types.ComplexPerUnit i0Pu_Load_11 = ComplexMath.conj(s0Pu_Load_11 / u0Pu_Load_11);

  // Load_12 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_12 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_12 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_12 = Complex(P0Pu_Load_12, Q0Pu_Load_12);
  final parameter Types.Angle UPhase0_Load_12 = SIunits.Conversions.from_deg(-5.93);
  final parameter Types.VoltageModule U0Pu_Load_12 = 0.9975;
  final parameter Types.ComplexPerUnit u0Pu_Load_12 = ComplexMath.fromPolar(U0Pu_Load_12, UPhase0_Load_12);
  final parameter Types.ComplexPerUnit i0Pu_Load_12 = ComplexMath.conj(s0Pu_Load_12 / u0Pu_Load_12);

  // Load_13 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_13 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_13 = 34.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_13 = Complex(P0Pu_Load_13, Q0Pu_Load_13);
  final parameter Types.Angle UPhase0_Load_13 = SIunits.Conversions.from_deg(-1.58);
  final parameter Types.VoltageModule U0Pu_Load_13 = 0.9957;
  final parameter Types.ComplexPerUnit u0Pu_Load_13 = ComplexMath.fromPolar(U0Pu_Load_13, UPhase0_Load_13);
  final parameter Types.ComplexPerUnit i0Pu_Load_13 = ComplexMath.conj(s0Pu_Load_13 / u0Pu_Load_13);

  // Load_22 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_22 = 280.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_22 = 79.9 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_22 = Complex(P0Pu_Load_22, Q0Pu_Load_22);
  final parameter Types.Angle UPhase0_Load_22 = SIunits.Conversions.from_deg(-21.89);
  final parameter Types.VoltageModule U0Pu_Load_22 = 0.9952;
  final parameter Types.ComplexPerUnit u0Pu_Load_22 = ComplexMath.fromPolar(U0Pu_Load_22, UPhase0_Load_22);
  final parameter Types.ComplexPerUnit i0Pu_Load_22 = ComplexMath.conj(s0Pu_Load_22 / u0Pu_Load_22);

  // Load_01 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_01 = 600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_01 = 148.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_01 = Complex(P0Pu_Load_01, Q0Pu_Load_01);
  final parameter Types.Angle UPhase0_Load_01 = SIunits.Conversions.from_deg(-84.71);
  final parameter Types.VoltageModule U0Pu_Load_01 = 0.9988;
  final parameter Types.ComplexPerUnit u0Pu_Load_01 = ComplexMath.fromPolar(U0Pu_Load_01, UPhase0_Load_01);
  final parameter Types.ComplexPerUnit i0Pu_Load_01 = ComplexMath.conj(s0Pu_Load_01 / u0Pu_Load_01);

  // Load_02 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_02 = 330.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_02 = 71 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_02 = Complex(P0Pu_Load_02, Q0Pu_Load_02);
  final parameter Types.Angle UPhase0_Load_02 = SIunits.Conversions.from_deg(-70.49);
  final parameter Types.VoltageModule U0Pu_Load_02 = 1.0012;
  final parameter Types.ComplexPerUnit u0Pu_Load_02 = ComplexMath.fromPolar(U0Pu_Load_02, UPhase0_Load_02);
  final parameter Types.ComplexPerUnit i0Pu_Load_02 = ComplexMath.conj(s0Pu_Load_02 / u0Pu_Load_02);

  // Load_03 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_03 = 260.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_03 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_03 = Complex(P0Pu_Load_03, Q0Pu_Load_03);
  final parameter Types.Angle UPhase0_Load_03 = SIunits.Conversions.from_deg(-79.97);
  final parameter Types.VoltageModule U0Pu_Load_03 = 0.9974;
  final parameter Types.ComplexPerUnit u0Pu_Load_03 = ComplexMath.fromPolar(U0Pu_Load_03, UPhase0_Load_03);
  final parameter Types.ComplexPerUnit i0Pu_Load_03 = ComplexMath.conj(s0Pu_Load_03 / u0Pu_Load_03);

  // Load_04 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_04 = 840.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_04 = 252.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_04 = Complex(P0Pu_Load_04, Q0Pu_Load_04);
  final parameter Types.Angle UPhase0_Load_04 = SIunits.Conversions.from_deg(-70.67);
  final parameter Types.VoltageModule U0Pu_Load_04 = 0.9996;
  final parameter Types.ComplexPerUnit u0Pu_Load_04 = ComplexMath.fromPolar(U0Pu_Load_04, UPhase0_Load_04);
  final parameter Types.ComplexPerUnit i0Pu_Load_04 = ComplexMath.conj(s0Pu_Load_04 / u0Pu_Load_04);

  // Load_05 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_05 = 720.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_05 = 190.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_05 = Complex(P0Pu_Load_05, Q0Pu_Load_05);
  final parameter Types.Angle UPhase0_Load_05 = SIunits.Conversions.from_deg(-74.59);
  final parameter Types.VoltageModule U0Pu_Load_05 = 0.9961;
  final parameter Types.ComplexPerUnit u0Pu_Load_05 = ComplexMath.fromPolar(U0Pu_Load_05, UPhase0_Load_05);
  final parameter Types.ComplexPerUnit i0Pu_Load_05 = ComplexMath.conj(s0Pu_Load_05 / u0Pu_Load_05);

  // Load_31 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_31 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_31 = 24.7 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_31 = Complex(P0Pu_Load_31, Q0Pu_Load_31);
  final parameter Types.Angle UPhase0_Load_31 = SIunits.Conversions.from_deg(-39.47);
  final parameter Types.VoltageModule U0Pu_Load_31 = 1.0042;
  final parameter Types.ComplexPerUnit u0Pu_Load_31 = ComplexMath.fromPolar(U0Pu_Load_31, UPhase0_Load_31);
  final parameter Types.ComplexPerUnit i0Pu_Load_31 = ComplexMath.conj(s0Pu_Load_31 / u0Pu_Load_31);

  // Load_32 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_32 = 200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_32 = 39.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_32 = Complex(P0Pu_Load_32, Q0Pu_Load_32);
  final parameter Types.Angle UPhase0_Load_32 = SIunits.Conversions.from_deg(-26.77);
  final parameter Types.VoltageModule U0Pu_Load_32 = 0.9978;
  final parameter Types.ComplexPerUnit u0Pu_Load_32 = ComplexMath.fromPolar(U0Pu_Load_32, UPhase0_Load_32);
  final parameter Types.ComplexPerUnit i0Pu_Load_32 = ComplexMath.conj(s0Pu_Load_32 / u0Pu_Load_32);

  // Load_41 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_41 = 540.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_41 = 131.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_41 = Complex(P0Pu_Load_41, Q0Pu_Load_41);
  final parameter Types.Angle UPhase0_Load_41 = SIunits.Conversions.from_deg(-57.14);
  final parameter Types.VoltageModule U0Pu_Load_41 = 0.9967;
  final parameter Types.ComplexPerUnit u0Pu_Load_41 = ComplexMath.fromPolar(U0Pu_Load_41, UPhase0_Load_41);
  final parameter Types.ComplexPerUnit i0Pu_Load_41 = ComplexMath.conj(s0Pu_Load_41 / u0Pu_Load_41);

  // Load_42 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_42 = 400.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_42 = 127.4 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_42 = Complex(P0Pu_Load_42, Q0Pu_Load_42);
  final parameter Types.Angle UPhase0_Load_42 = SIunits.Conversions.from_deg(-60.22);
  final parameter Types.VoltageModule U0Pu_Load_42 = 0.9952;
  final parameter Types.ComplexPerUnit u0Pu_Load_42 = ComplexMath.fromPolar(U0Pu_Load_42, UPhase0_Load_42);
  final parameter Types.ComplexPerUnit i0Pu_Load_42 = ComplexMath.conj(s0Pu_Load_42 / u0Pu_Load_42);

  // Load_43 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_43 = 900.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_43 = 254.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_43 = Complex(P0Pu_Load_43, Q0Pu_Load_43);
  final parameter Types.Angle UPhase0_Load_43 = SIunits.Conversions.from_deg(-66.33);
  final parameter Types.VoltageModule U0Pu_Load_43 = 1.0013;
  final parameter Types.ComplexPerUnit u0Pu_Load_43 = ComplexMath.fromPolar(U0Pu_Load_43, UPhase0_Load_43);
  final parameter Types.ComplexPerUnit i0Pu_Load_43 = ComplexMath.conj(s0Pu_Load_43 / u0Pu_Load_43);

  // Load_46 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_46 = 700.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_46 = 211.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_46 = Complex(P0Pu_Load_46, Q0Pu_Load_46);
  final parameter Types.Angle UPhase0_Load_46 = SIunits.Conversions.from_deg(-66.93);
  final parameter Types.VoltageModule U0Pu_Load_46 = 0.999;
  final parameter Types.ComplexPerUnit u0Pu_Load_46 = ComplexMath.fromPolar(U0Pu_Load_46, UPhase0_Load_46);
  final parameter Types.ComplexPerUnit i0Pu_Load_46 = ComplexMath.conj(s0Pu_Load_46 / u0Pu_Load_46);

  // Load_47 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_47 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_47 = 44.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_47 = Complex(P0Pu_Load_47, Q0Pu_Load_47);
  final parameter Types.Angle UPhase0_Load_47 = SIunits.Conversions.from_deg(-62.38);
  final parameter Types.VoltageModule U0Pu_Load_47 = 0.995;
  final parameter Types.ComplexPerUnit u0Pu_Load_47 = ComplexMath.fromPolar(U0Pu_Load_47, UPhase0_Load_47);
  final parameter Types.ComplexPerUnit i0Pu_Load_47 = ComplexMath.conj(s0Pu_Load_47 / u0Pu_Load_47);

  // Load_51 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_51 = 800.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_51 = 258.2 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_51 = Complex(P0Pu_Load_51, Q0Pu_Load_51);
  final parameter Types.Angle UPhase0_Load_51 = SIunits.Conversions.from_deg(-73.84);
  final parameter Types.VoltageModule U0Pu_Load_51 = 0.9978;
  final parameter Types.ComplexPerUnit u0Pu_Load_51 = ComplexMath.fromPolar(U0Pu_Load_51, UPhase0_Load_51);
  final parameter Types.ComplexPerUnit i0Pu_Load_51 = ComplexMath.conj(s0Pu_Load_51 / u0Pu_Load_51);

  // Load_61 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_61 = 500.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_61 = 122.5 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_61 = Complex(P0Pu_Load_61, Q0Pu_Load_61);
  final parameter Types.Angle UPhase0_Load_61 = SIunits.Conversions.from_deg(-60.78);
  final parameter Types.VoltageModule U0Pu_Load_61 = 0.9949;
  final parameter Types.ComplexPerUnit u0Pu_Load_61 = ComplexMath.fromPolar(U0Pu_Load_61, UPhase0_Load_61);
  final parameter Types.ComplexPerUnit i0Pu_Load_61 = ComplexMath.conj(s0Pu_Load_61 / u0Pu_Load_61);

  // Load_62 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_62 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_62 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_62 = Complex(P0Pu_Load_62, Q0Pu_Load_62);
  final parameter Types.Angle UPhase0_Load_62 = SIunits.Conversions.from_deg(-57.18);
  final parameter Types.VoltageModule U0Pu_Load_62 = 1.0002;
  final parameter Types.ComplexPerUnit u0Pu_Load_62 = ComplexMath.fromPolar(U0Pu_Load_62, UPhase0_Load_62);
  final parameter Types.ComplexPerUnit i0Pu_Load_62 = ComplexMath.conj(s0Pu_Load_62 / u0Pu_Load_62);

  // Load_63 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_63 = 590.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_63 = 264.6 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_63 = Complex(P0Pu_Load_63, Q0Pu_Load_63);
  final parameter Types.Angle UPhase0_Load_63 = SIunits.Conversions.from_deg(-53.49);
  final parameter Types.VoltageModule U0Pu_Load_63 = 0.9992;
  final parameter Types.ComplexPerUnit u0Pu_Load_63 = ComplexMath.fromPolar(U0Pu_Load_63, UPhase0_Load_63);
  final parameter Types.ComplexPerUnit i0Pu_Load_63 = ComplexMath.conj(s0Pu_Load_63 / u0Pu_Load_63);

  // Load_71 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_71 = 300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_71 = 83.8 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_71 = Complex(P0Pu_Load_71, Q0Pu_Load_71);
  final parameter Types.Angle UPhase0_Load_71 = SIunits.Conversions.from_deg(-7.8);
  final parameter Types.VoltageModule U0Pu_Load_71 = 1.0028;
  final parameter Types.ComplexPerUnit u0Pu_Load_71 = ComplexMath.fromPolar(U0Pu_Load_71, UPhase0_Load_71);
  final parameter Types.ComplexPerUnit i0Pu_Load_71 = ComplexMath.conj(s0Pu_Load_71 / u0Pu_Load_71);

  // Load_72 init values:
  //s0Pu, i0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_Load_72 = 2000.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_Load_72 = 396.1 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit s0Pu_Load_72 = Complex(P0Pu_Load_72, Q0Pu_Load_72);
  final parameter Types.Angle UPhase0_Load_72 = SIunits.Conversions.from_deg(-6.83);
  final parameter Types.VoltageModule U0Pu_Load_72 = 0.9974;
  final parameter Types.ComplexPerUnit u0Pu_Load_72 = ComplexMath.fromPolar(U0Pu_Load_72, UPhase0_Load_72);
  final parameter Types.ComplexPerUnit i0Pu_Load_72 = ComplexMath.conj(s0Pu_Load_72 / u0Pu_Load_72);

  final parameter SIunits.Impedance XBase_130 = 130 ^ 2 / Electrical.SystemBase.SnRef;
  final parameter SIunits.Impedance XBase_220 = 220 ^ 2 / Electrical.SystemBase.SnRef;
  final parameter SIunits.Impedance XBase_400 = 400 ^ 2 / Electrical.SystemBase.SnRef;
  // shunt_1022 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_1022 = -50.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_1022 = ComplexMath.fromPolar(1.0512, SIunits.Conversions.from_deg(-19.05));
  final parameter Types.PerUnit U0Pu_shunt_1022 = ComplexMath.'abs'(u0Pu_shunt_1022);
  final parameter Types.PerUnit Q0Pu_shunt_1022 =  BPu_shunt_1022*U0Pu_shunt_1022^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_1022 = Complex(0, Q0Pu_shunt_1022);
  final parameter Types.ComplexPerUnit i0Pu_shunt_1022 = ComplexMath.conj(s0Pu_shunt_1022/ u0Pu_shunt_1022);

  // shunt_1041 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_1041 = -250.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_1041 = ComplexMath.fromPolar(1.0124, SIunits.Conversions.from_deg(-81.87));
  final parameter Types.PerUnit U0Pu_shunt_1041 = ComplexMath.'abs'(u0Pu_shunt_1041);
  final parameter Types.PerUnit Q0Pu_shunt_1041 =  BPu_shunt_1041*U0Pu_shunt_1041^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_1041 = Complex(0, Q0Pu_shunt_1041);
  final parameter Types.ComplexPerUnit i0Pu_shunt_1041 = ComplexMath.conj(s0Pu_shunt_1041/ u0Pu_shunt_1041);

  // shunt_1043 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_1043 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_1043 = ComplexMath.fromPolar(1.0274, SIunits.Conversions.from_deg(-76.77));
  final parameter Types.PerUnit U0Pu_shunt_1043 = ComplexMath.'abs'(u0Pu_shunt_1043);
  final parameter Types.PerUnit Q0Pu_shunt_1043 =  BPu_shunt_1043*U0Pu_shunt_1043^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_1043 = Complex(0, Q0Pu_shunt_1043);
  final parameter Types.ComplexPerUnit i0Pu_shunt_1043 = ComplexMath.conj(s0Pu_shunt_1043/ u0Pu_shunt_1043);

  // shunt_1044 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_1044 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_1044 = ComplexMath.fromPolar(1.0066, SIunits.Conversions.from_deg(-67.71));
  final parameter Types.PerUnit U0Pu_shunt_1044 = ComplexMath.'abs'(u0Pu_shunt_1044);
  final parameter Types.PerUnit Q0Pu_shunt_1044 =  BPu_shunt_1044*U0Pu_shunt_1044^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_1044 = Complex(0, Q0Pu_shunt_1044);
  final parameter Types.ComplexPerUnit i0Pu_shunt_1044 = ComplexMath.conj(s0Pu_shunt_1044/ u0Pu_shunt_1044);

  // shunt_1045 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_1045 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_1045 = ComplexMath.fromPolar(1.0111, SIunits.Conversions.from_deg(-71.66));
  final parameter Types.PerUnit U0Pu_shunt_1045 = ComplexMath.'abs'(u0Pu_shunt_1045);
  final parameter Types.PerUnit Q0Pu_shunt_1045 =  BPu_shunt_1045*U0Pu_shunt_1045^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_1045 = Complex(0, Q0Pu_shunt_1045);
  final parameter Types.ComplexPerUnit i0Pu_shunt_1045 = ComplexMath.conj(s0Pu_shunt_1045/ u0Pu_shunt_1045);

  // shunt_4012 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4012 = 100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4012 = ComplexMath.fromPolar(1.0235, SIunits.Conversions.from_deg(-5.54));
  final parameter Types.PerUnit U0Pu_shunt_4012 = ComplexMath.'abs'(u0Pu_shunt_4012);
  final parameter Types.PerUnit Q0Pu_shunt_4012 =  BPu_shunt_4012*U0Pu_shunt_4012^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4012 = Complex(0, Q0Pu_shunt_4012);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4012 = ComplexMath.conj(s0Pu_shunt_4012/ u0Pu_shunt_4012);

  // shunt_4041 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4041 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4041 = ComplexMath.fromPolar(1.0506, SIunits.Conversions.from_deg(-54.30));
  final parameter Types.PerUnit U0Pu_shunt_4041 = ComplexMath.'abs'(u0Pu_shunt_4041);
  final parameter Types.PerUnit Q0Pu_shunt_4041 =  BPu_shunt_4041*U0Pu_shunt_4041^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4041 = Complex(0, Q0Pu_shunt_4041);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4041 = ComplexMath.conj(s0Pu_shunt_4041/ u0Pu_shunt_4041);

  // shunt_4043 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4043 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4043 = ComplexMath.fromPolar(1.0370, SIunits.Conversions.from_deg(-63.51));
  final parameter Types.PerUnit U0Pu_shunt_4043 = ComplexMath.'abs'(u0Pu_shunt_4043);
  final parameter Types.PerUnit Q0Pu_shunt_4043 =  BPu_shunt_4043*U0Pu_shunt_4043^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4043 = Complex(0, Q0Pu_shunt_4043);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4043 = ComplexMath.conj(s0Pu_shunt_4043/ u0Pu_shunt_4043);

  // shunt_4046 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4046 = -100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4046 = ComplexMath.fromPolar(1.0357, SIunits.Conversions.from_deg(-64.11));
  final parameter Types.PerUnit U0Pu_shunt_4046 = ComplexMath.'abs'(u0Pu_shunt_4046);
  final parameter Types.PerUnit Q0Pu_shunt_4046 =  BPu_shunt_4046*U0Pu_shunt_4046^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4046 = Complex(0, Q0Pu_shunt_4046);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4046 = ComplexMath.conj(s0Pu_shunt_4046/ u0Pu_shunt_4046);

  // shunt_4051 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4051 = -100.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4051 = ComplexMath.fromPolar(1.0659, SIunits.Conversions.from_deg(-71.01));
  final parameter Types.PerUnit U0Pu_shunt_4051 = ComplexMath.'abs'(u0Pu_shunt_4051);
  final parameter Types.PerUnit Q0Pu_shunt_4051 =  BPu_shunt_4051*U0Pu_shunt_4051^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4051 = Complex(0, Q0Pu_shunt_4051);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4051 = ComplexMath.conj(s0Pu_shunt_4051/ u0Pu_shunt_4051);

  // shunt_4071 init values:
  // negative values for capacitors, positive values for inductors (reversed in PESTR)
  final parameter Types.PerUnit BPu_shunt_4071 = 400.0 / Electrical.SystemBase.SnRef;
  final parameter Types.ComplexPerUnit u0Pu_shunt_4071 = ComplexMath.fromPolar(1.0484, SIunits.Conversions.from_deg(-4.99));
  final parameter Types.PerUnit U0Pu_shunt_4071 = ComplexMath.'abs'(u0Pu_shunt_4071);
  final parameter Types.PerUnit Q0Pu_shunt_4071 =  BPu_shunt_4071*U0Pu_shunt_4071^2;
  final parameter Types.ComplexPerUnit s0Pu_shunt_4071 = Complex(0, Q0Pu_shunt_4071);
  final parameter Types.ComplexPerUnit i0Pu_shunt_4071 = ComplexMath.conj(s0Pu_shunt_4071/ u0Pu_shunt_4071);


equation

  connect(PrefPu_load_11.setPoint, load_11.PRefPu);
  connect(QrefPu_load_11.setPoint, load_11.QRefPu);
  connect(load_11.terminal, bus_B11.terminal);
  connect(PrefPu_load_12.setPoint, load_12.PRefPu);
  connect(QrefPu_load_12.setPoint, load_12.QRefPu);
  connect(load_12.terminal, bus_B12.terminal);
  connect(PrefPu_load_13.setPoint, load_13.PRefPu);
  connect(QrefPu_load_13.setPoint, load_13.QRefPu);
  connect(load_13.terminal, bus_B13.terminal);
  connect(PrefPu_load_22.setPoint, load_22.PRefPu);
  connect(QrefPu_load_22.setPoint, load_22.QRefPu);
  connect(load_22.terminal, bus_B22.terminal);
  connect(PrefPu_load_01.setPoint, load_01.PRefPu);
  connect(QrefPu_load_01.setPoint, load_01.QRefPu);
  connect(load_01.terminal, bus_B01.terminal);
  connect(PrefPu_load_02.setPoint, load_02.PRefPu);
  connect(QrefPu_load_02.setPoint, load_02.QRefPu);
  connect(load_02.terminal, bus_B02.terminal);
  connect(PrefPu_load_03.setPoint, load_03.PRefPu);
  connect(QrefPu_load_03.setPoint, load_03.QRefPu);
  connect(load_03.terminal, bus_B03.terminal);
  connect(PrefPu_load_04.setPoint, load_04.PRefPu);
  connect(QrefPu_load_04.setPoint, load_04.QRefPu);
  connect(load_04.terminal, bus_B04.terminal);
  connect(PrefPu_load_05.setPoint, load_05.PRefPu);
  connect(QrefPu_load_05.setPoint, load_05.QRefPu);
  connect(load_05.terminal, bus_B05.terminal);
  connect(PrefPu_load_31.setPoint, load_31.PRefPu);
  connect(QrefPu_load_31.setPoint, load_31.QRefPu);
  connect(load_31.terminal, bus_B31.terminal);
  connect(PrefPu_load_32.setPoint, load_32.PRefPu);
  connect(QrefPu_load_32.setPoint, load_32.QRefPu);
  connect(load_32.terminal, bus_B32.terminal);
  connect(PrefPu_load_41.setPoint, load_41.PRefPu);
  connect(QrefPu_load_41.setPoint, load_41.QRefPu);
  connect(load_41.terminal, bus_B41.terminal);
  connect(PrefPu_load_42.setPoint, load_42.PRefPu);
  connect(QrefPu_load_42.setPoint, load_42.QRefPu);
  connect(load_42.terminal, bus_B42.terminal);
  connect(PrefPu_load_43.setPoint, load_43.PRefPu);
  connect(QrefPu_load_43.setPoint, load_43.QRefPu);
  connect(load_43.terminal, bus_B43.terminal);
  connect(PrefPu_load_46.setPoint, load_46.PRefPu);
  connect(QrefPu_load_46.setPoint, load_46.QRefPu);
  connect(load_46.terminal, bus_B46.terminal);
  connect(PrefPu_load_47.setPoint, load_47.PRefPu);
  connect(QrefPu_load_47.setPoint, load_47.QRefPu);
  connect(load_47.terminal, bus_B47.terminal);
  connect(PrefPu_load_51.setPoint, load_51.PRefPu);
  connect(QrefPu_load_51.setPoint, load_51.QRefPu);
  connect(load_51.terminal, bus_B51.terminal);
  connect(PrefPu_load_61.setPoint, load_61.PRefPu);
  connect(QrefPu_load_61.setPoint, load_61.QRefPu);
  connect(load_61.terminal, bus_B61.terminal);
  connect(PrefPu_load_62.setPoint, load_62.PRefPu);
  connect(QrefPu_load_62.setPoint, load_62.QRefPu);
  connect(load_62.terminal, bus_B62.terminal);
  connect(PrefPu_load_63.setPoint, load_63.PRefPu);
  connect(QrefPu_load_63.setPoint, load_63.QRefPu);
  connect(load_63.terminal, bus_B63.terminal);
  connect(PrefPu_load_71.setPoint, load_71.PRefPu);
  connect(QrefPu_load_71.setPoint, load_71.QRefPu);
  connect(load_71.terminal, bus_B71.terminal);
  connect(PrefPu_load_72.setPoint, load_72.PRefPu);
  connect(QrefPu_load_72.setPoint, load_72.QRefPu);
  connect(load_72.terminal, bus_B72.terminal);
  connect(line_1011_1013a.terminal1, bus_1011.terminal);
  connect(line_1011_1013a.terminal2, bus_1013.terminal);
  connect(line_1011_1013b.terminal1, bus_1011.terminal);
  connect(line_1011_1013b.terminal2, bus_1013.terminal);
  connect(line_1012_1014a.terminal1, bus_1014.terminal);
  connect(line_1012_1014a.terminal2, bus_1012.terminal);
  connect(line_1012_1014b.terminal1, bus_1014.terminal);
  connect(line_1012_1014b.terminal2, bus_1012.terminal);
  connect(line_1013_1014a.terminal1, bus_1013.terminal);
  connect(line_1013_1014a.terminal2, bus_1014.terminal);
  connect(line_1013_1014b.terminal1, bus_1013.terminal);
  connect(line_1013_1014b.terminal2, bus_1014.terminal);
  connect(line_1021_1022a.terminal1, bus_1022.terminal);
  connect(line_1021_1022a.terminal2, bus_1021.terminal);
  connect(line_1021_1022b.terminal1, bus_1022.terminal);
  connect(line_1021_1022b.terminal2, bus_1021.terminal);
  connect(line_1041_1043a.terminal1, bus_1041.terminal);
  connect(line_1041_1043a.terminal2, bus_1043.terminal);
  connect(line_1041_1043b.terminal1, bus_1041.terminal);
  connect(line_1041_1043b.terminal2, bus_1043.terminal);
  connect(line_1041_1045a.terminal1, bus_1041.terminal);
  connect(line_1041_1045a.terminal2, bus_1045.terminal);
  connect(line_1041_1045b.terminal1, bus_1045.terminal);
  connect(line_1041_1045b.terminal2, bus_1041.terminal);
  connect(line_1042_1044a.terminal1, bus_1044.terminal);
  connect(line_1042_1044a.terminal2, bus_1042.terminal);
  connect(line_1042_1044b.terminal1, bus_1044.terminal);
  connect(line_1042_1044b.terminal2, bus_1042.terminal);
  connect(line_1042_1045.terminal1, bus_1042.terminal);
  connect(line_1042_1045.terminal2, bus_1045.terminal);
  connect(line_1043_1044a.terminal1, bus_1043.terminal);
  connect(line_1043_1044a.terminal2, bus_1044.terminal);
  connect(line_1043_1044b.terminal1, bus_1043.terminal);
  connect(line_1043_1044b.terminal2, bus_1044.terminal);
  connect(line_2031_2032a.terminal1, bus_2031.terminal);
  connect(line_2031_2032a.terminal2, bus_2032.terminal);
  connect(line_2031_2032b.terminal1, bus_2032.terminal);
  connect(line_2031_2032b.terminal2, bus_2031.terminal);
  connect(line_4011_4012.terminal1, bus_4011.terminal);
  connect(line_4011_4012.terminal2, bus_4012.terminal);
  connect(line_4011_4021.terminal1, bus_4021.terminal);
  connect(line_4011_4021.terminal2, bus_4011.terminal);
  connect(line_4011_4022.terminal1, bus_4011.terminal);
  connect(line_4011_4022.terminal2, bus_4022.terminal);
  connect(line_4011_4071.terminal1, bus_4071.terminal);
  connect(line_4011_4071.terminal2, bus_4011.terminal);
  connect(line_4012_4022.terminal1, bus_4012.terminal);
  connect(line_4012_4022.terminal2, bus_4022.terminal);
  connect(line_4012_4071.terminal1, bus_4071.terminal);
  connect(line_4012_4071.terminal2, bus_4012.terminal);
  connect(line_4021_4032.terminal1, bus_4032.terminal);
  connect(line_4021_4032.terminal2, bus_4021.terminal);
  connect(line_4021_4042.terminal1, bus_4042.terminal);
  connect(line_4021_4042.terminal2, bus_4021.terminal);
  connect(line_4022_4031a.terminal1, bus_4031.terminal);
  connect(line_4022_4031a.terminal2, bus_4022.terminal);
  connect(line_4022_4031b.terminal1, bus_4031.terminal);
  connect(line_4022_4031b.terminal2, bus_4022.terminal);
  connect(line_4031_4032.terminal1, bus_4032.terminal);
  connect(line_4031_4032.terminal2, bus_4031.terminal);
  connect(line_4031_4041a.terminal1, bus_4031.terminal);
  connect(line_4031_4041a.terminal2, bus_4041.terminal);
  connect(line_4031_4041b.terminal1, bus_4031.terminal);
  connect(line_4031_4041b.terminal2, bus_4041.terminal);
  connect(line_4032_4042.terminal1, bus_4032.terminal);
  connect(line_4032_4042.terminal2, bus_4042.terminal);
  connect(line_4032_4044.terminal1, bus_4032.terminal);
  connect(line_4032_4044.terminal2, bus_4044.terminal);
  connect(line_4041_4044.terminal1, bus_4041.terminal);
  connect(line_4041_4044.terminal2, bus_4044.terminal);
  connect(line_4041_4061.terminal1, bus_4041.terminal);
  connect(line_4041_4061.terminal2, bus_4061.terminal);
  connect(line_4042_4043.terminal1, bus_4042.terminal);
  connect(line_4042_4043.terminal2, bus_4043.terminal);
  connect(line_4042_4044.terminal1, bus_4042.terminal);
  connect(line_4042_4044.terminal2, bus_4044.terminal);
  connect(line_4043_4044.terminal1, bus_4043.terminal);
  connect(line_4043_4044.terminal2, bus_4044.terminal);
  connect(line_4043_4046.terminal1, bus_4046.terminal);
  connect(line_4043_4046.terminal2, bus_4043.terminal);
  connect(line_4043_4047.terminal1, bus_4043.terminal);
  connect(line_4043_4047.terminal2, bus_4047.terminal);
  connect(line_4044_4045a.terminal1, bus_4045.terminal);
  connect(line_4044_4045a.terminal2, bus_4044.terminal);
  connect(line_4044_4045b.terminal1, bus_4045.terminal);
  connect(line_4044_4045b.terminal2, bus_4044.terminal);
  connect(line_4045_4051a.terminal1, bus_4045.terminal);
  connect(line_4045_4051a.terminal2, bus_4051.terminal);
  connect(line_4045_4051b.terminal1, bus_4051.terminal);
  connect(line_4045_4051b.terminal2, bus_4045.terminal);
  connect(line_4045_4062.terminal1, bus_4045.terminal);
  connect(line_4045_4062.terminal2, bus_4062.terminal);
  connect(line_4046_4047.terminal1, bus_4046.terminal);
  connect(line_4046_4047.terminal2, bus_4047.terminal);
  connect(line_4061_4062.terminal1, bus_4061.terminal);
  connect(line_4061_4062.terminal2, bus_4062.terminal);
  connect(line_4062_4063a.terminal1, bus_4063.terminal);
  connect(line_4062_4063a.terminal2, bus_4062.terminal);
  connect(line_4062_4063b.terminal1, bus_4063.terminal);
  connect(line_4062_4063b.terminal2, bus_4062.terminal);
  connect(line_4071_4072a.terminal1, bus_4071.terminal);
  connect(line_4071_4072a.terminal2, bus_4072.terminal);
  connect(line_4071_4072b.terminal1, bus_4071.terminal);
  connect(line_4071_4072b.terminal2, bus_4072.terminal);
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

  load_11.switchOffSignal1.value = false;
  load_11.switchOffSignal2.value = false;
  load_12.switchOffSignal1.value = false;
  load_12.switchOffSignal2.value = false;
  load_13.switchOffSignal1.value = false;
  load_13.switchOffSignal2.value = false;
  load_22.switchOffSignal1.value = false;
  load_22.switchOffSignal2.value = false;
  load_01.switchOffSignal1.value = false;
  load_01.switchOffSignal2.value = false;
  load_02.switchOffSignal1.value = false;
  load_02.switchOffSignal2.value = false;
  load_03.switchOffSignal1.value = false;
  load_03.switchOffSignal2.value = false;
  load_04.switchOffSignal1.value = false;
  load_04.switchOffSignal2.value = false;
  load_05.switchOffSignal1.value = false;
  load_05.switchOffSignal2.value = false;
  load_31.switchOffSignal1.value = false;
  load_31.switchOffSignal2.value = false;
  load_32.switchOffSignal1.value = false;
  load_32.switchOffSignal2.value = false;
  load_41.switchOffSignal1.value = false;
  load_41.switchOffSignal2.value = false;
  load_42.switchOffSignal1.value = false;
  load_42.switchOffSignal2.value = false;
  load_43.switchOffSignal1.value = false;
  load_43.switchOffSignal2.value = false;
  load_46.switchOffSignal1.value = false;
  load_46.switchOffSignal2.value = false;
  load_47.switchOffSignal1.value = false;
  load_47.switchOffSignal2.value = false;
  load_51.switchOffSignal1.value = false;
  load_51.switchOffSignal2.value = false;
  load_61.switchOffSignal1.value = false;
  load_61.switchOffSignal2.value = false;
  load_62.switchOffSignal1.value = false;
  load_62.switchOffSignal2.value = false;
  load_63.switchOffSignal1.value = false;
  load_63.switchOffSignal2.value = false;
  load_71.switchOffSignal1.value = false;
  load_71.switchOffSignal2.value = false;
  load_72.switchOffSignal1.value = false;
  load_72.switchOffSignal2.value = false;
  line_1011_1013a.switchOffSignal1.value = false;
  line_1011_1013a.switchOffSignal2.value = false;
  line_1011_1013b.switchOffSignal1.value = false;
  line_1011_1013b.switchOffSignal2.value = false;
  line_1012_1014a.switchOffSignal1.value = false;
  line_1012_1014a.switchOffSignal2.value = false;
  line_1012_1014b.switchOffSignal1.value = false;
  line_1012_1014b.switchOffSignal2.value = false;
  line_1013_1014a.switchOffSignal1.value = false;
  line_1013_1014a.switchOffSignal2.value = false;
  line_1013_1014b.switchOffSignal1.value = false;
  line_1013_1014b.switchOffSignal2.value = false;
  line_1021_1022a.switchOffSignal1.value = false;
  line_1021_1022a.switchOffSignal2.value = false;
  line_1021_1022b.switchOffSignal1.value = false;
  line_1021_1022b.switchOffSignal2.value = false;
  line_1041_1043a.switchOffSignal1.value = false;
  line_1041_1043a.switchOffSignal2.value = false;
  line_1041_1043b.switchOffSignal1.value = false;
  line_1041_1043b.switchOffSignal2.value = false;
  line_1041_1045a.switchOffSignal1.value = false;
  line_1041_1045a.switchOffSignal2.value = false;
  line_1041_1045b.switchOffSignal1.value = false;
  line_1041_1045b.switchOffSignal2.value = false;
  line_1042_1044a.switchOffSignal1.value = false;
  line_1042_1044a.switchOffSignal2.value = false;
  line_1042_1044b.switchOffSignal1.value = false;
  line_1042_1044b.switchOffSignal2.value = false;
  line_1042_1045.switchOffSignal1.value = false;
  line_1042_1045.switchOffSignal2.value = false;
  line_1043_1044a.switchOffSignal1.value = false;
  line_1043_1044a.switchOffSignal2.value = false;
  line_1043_1044b.switchOffSignal1.value = false;
  line_1043_1044b.switchOffSignal2.value = false;
  line_2031_2032a.switchOffSignal1.value = false;
  line_2031_2032a.switchOffSignal2.value = false;
  line_2031_2032b.switchOffSignal1.value = false;
  line_2031_2032b.switchOffSignal2.value = false;
  line_4011_4012.switchOffSignal1.value = false;
  line_4011_4012.switchOffSignal2.value = false;
  line_4011_4021.switchOffSignal1.value = false;
  line_4011_4021.switchOffSignal2.value = false;
  line_4011_4022.switchOffSignal1.value = false;
  line_4011_4022.switchOffSignal2.value = false;
  line_4011_4071.switchOffSignal1.value = false;
  line_4011_4071.switchOffSignal2.value = false;
  line_4012_4022.switchOffSignal1.value = false;
  line_4012_4022.switchOffSignal2.value = false;
  line_4012_4071.switchOffSignal1.value = false;
  line_4012_4071.switchOffSignal2.value = false;
  line_4021_4032.switchOffSignal1.value = false;
  line_4021_4032.switchOffSignal2.value = false;
  line_4021_4042.switchOffSignal1.value = false;
  line_4021_4042.switchOffSignal2.value = false;
  line_4022_4031a.switchOffSignal1.value = false;
  line_4022_4031a.switchOffSignal2.value = false;
  line_4022_4031b.switchOffSignal1.value = false;
  line_4022_4031b.switchOffSignal2.value = false;
  line_4031_4032.switchOffSignal1.value = false;
  line_4031_4032.switchOffSignal2.value = false;
  line_4031_4041a.switchOffSignal1.value = false;
  line_4031_4041a.switchOffSignal2.value = false;
  line_4031_4041b.switchOffSignal1.value = false;
  line_4031_4041b.switchOffSignal2.value = false;
  line_4032_4042.switchOffSignal1.value = false;
  line_4032_4042.switchOffSignal2.value = false;
  line_4032_4044.switchOffSignal1.value = false;
  line_4032_4044.switchOffSignal2.value = false;
  line_4041_4044.switchOffSignal1.value = false;
  line_4041_4044.switchOffSignal2.value = false;
  line_4041_4061.switchOffSignal1.value = false;
  line_4041_4061.switchOffSignal2.value = false;
  line_4042_4043.switchOffSignal1.value = false;
  line_4042_4043.switchOffSignal2.value = false;
  line_4042_4044.switchOffSignal1.value = false;
  line_4042_4044.switchOffSignal2.value = false;
  line_4043_4044.switchOffSignal1.value = false;
  line_4043_4044.switchOffSignal2.value = false;
  line_4043_4046.switchOffSignal1.value = false;
  line_4043_4046.switchOffSignal2.value = false;
  line_4043_4047.switchOffSignal1.value = false;
  line_4043_4047.switchOffSignal2.value = false;
  line_4044_4045a.switchOffSignal1.value = false;
  line_4044_4045a.switchOffSignal2.value = false;
  line_4044_4045b.switchOffSignal1.value = false;
  line_4044_4045b.switchOffSignal2.value = false;
  line_4045_4051a.switchOffSignal1.value = false;
  line_4045_4051a.switchOffSignal2.value = false;
  line_4045_4051b.switchOffSignal1.value = false;
  line_4045_4051b.switchOffSignal2.value = false;
  line_4045_4062.switchOffSignal1.value = false;
  line_4045_4062.switchOffSignal2.value = false;
  line_4046_4047.switchOffSignal1.value = false;
  line_4046_4047.switchOffSignal2.value = false;
  line_4061_4062.switchOffSignal1.value = false;
  line_4061_4062.switchOffSignal2.value = false;
  line_4062_4063a.switchOffSignal1.value = false;
  line_4062_4063a.switchOffSignal2.value = false;
  line_4062_4063b.switchOffSignal1.value = false;
  line_4062_4063b.switchOffSignal2.value = false;
  line_4071_4072a.switchOffSignal1.value = false;
  line_4071_4072a.switchOffSignal2.value = false;
  line_4071_4072b.switchOffSignal1.value = false;
  line_4071_4072b.switchOffSignal2.value = false;
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


end StaticNetwork;
