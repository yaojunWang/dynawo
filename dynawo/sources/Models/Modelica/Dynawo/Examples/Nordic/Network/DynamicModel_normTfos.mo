within Dynawo.Examples.Nordic.Network;

model DynamicModel_normTfos

  extends StaticNetwork;
  
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.SIunits;
  import Dynawo;
  import Dynawo.Electrical;
  import Dynawo.Types;
  import Dynawo.Examples.Nordic;

  Electrical.Buses.InfiniteBus slackbus_g20(UPu = 1.0185, UPhase = SIunits.Conversions.from_deg(0));
  
  Electrical.Transformers.TransformerFixedRatio trafo_1011_4011(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 0.95 ^ 2 * (100 / 1250.0), rTfoPu = 0.95);
  Electrical.Transformers.TransformerFixedRatio trafo_11_1011(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 400.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_g9_4011(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 1000.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_1012_4012(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 0.95 ^ 2 * (100 / 1250.0), rTfoPu = 0.95);
  Electrical.Transformers.TransformerFixedRatio trafo_g1_1012(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.0 ^ 2 * (100 / 800.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_12_1012(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.05 ^ 2 * (100 / 600.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_g10_4012(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 800.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_g2_1013(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.0 ^ 2 * (100 / 600.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_13_1013(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 200.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_g3_1014(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.0 ^ 2 * (100 / 700.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_g4_1021(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.0 ^ 2 * (100 / 600.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_1022_4022(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 0.93 ^ 2 * (100 / 833.3), rTfoPu = 0.93);
  Electrical.Transformers.TransformerFixedRatio trafo_g5_1022(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 250.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_22_1022(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 560.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_1_1041(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.0 ^ 2 * (100 / 1200.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_g6_1042(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 400.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_2_1042(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.0 ^ 2 * (100 / 600.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_g7_1043(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 200.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_3_1043(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.01 ^ 2 * (100 / 460.0), rTfoPu = 1.01);
  Electrical.Transformers.TransformerFixedRatio trafo_1044_4044a(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 1000.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_1044_4044b(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 1000.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_4_1044(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 0.99 ^ 2 * (100 / 1600.0), rTfoPu = 0.99);
  Electrical.Transformers.TransformerFixedRatio trafo_1045_4045a(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 1000.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_1045_4045b(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 1000.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_5_1045(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.0 ^ 2 * (100 / 1400.0), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_2031_4031(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.0 ^ 2 * (100 / 833.3), rTfoPu = 1.0);
  Electrical.Transformers.TransformerFixedRatio trafo_31_2031(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.01 ^ 2 * (100 / 200.0), rTfoPu = 1.01);
  Electrical.Transformers.TransformerFixedRatio trafo_g12_4031(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 350.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_g8_2032(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 850.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_32_2032(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.06 ^ 2 * (100 / 400.0), rTfoPu = 1.06);
  Electrical.Transformers.TransformerFixedRatio trafo_g11_4021(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 300.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_g13_4041(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.05 ^ 2 * (100 / 300.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_41_4041(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 1080.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_g14_4042(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 700.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_42_4042(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 800.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_43_4043(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.02 ^ 2 * (100 / 1800.0), rTfoPu = 1.02);
  Electrical.Transformers.TransformerFixedRatio trafo_46_4046(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.02 ^ 2 * (100 / 1400.0), rTfoPu = 1.02);
  Electrical.Transformers.TransformerFixedRatio trafo_g15_4047(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 1200.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_47_4047(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 200.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_g16_4051(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 700.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_51_4051(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.05 ^ 2 * (100 / 1600.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_61_4061(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 1000.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_g17_4062(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 600.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_62_4062(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.04 ^ 2 * (100 / 600.0), rTfoPu = 1.04);
  Electrical.Transformers.TransformerFixedRatio trafo_g18_4063(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 1200.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_63_4063(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 1180.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_g19_4071(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 500.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_71_4071(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.03 ^ 2 * (100 / 600.0), rTfoPu = 1.03);
  Electrical.Transformers.TransformerFixedRatio trafo_g20_4072(BPu = 0, GPu = 0, RPu = 0, XPu = 0.15 * 1.05 ^ 2 * (100 / 4500.0), rTfoPu = 1.05);
  Electrical.Transformers.TransformerFixedRatio trafo_72_4072(BPu = 0, GPu = 0, RPu = 0, XPu = 0.10 * 1.05 ^ 2 * (100 / 4000.0), rTfoPu = 1.05);
  
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g09(P0Pu = P0Pu_g09, Q0Pu = Q0Pu_g09, U0Pu = 0.9988, UPhase0 = SIunits.Conversions.from_deg(-1.63), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g09);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g01(P0Pu = P0Pu_g01, Q0Pu = Q0Pu_g01, U0Pu = 1.0684, UPhase0 = SIunits.Conversions.from_deg(2.59), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g01);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g10(P0Pu = P0Pu_g10, Q0Pu = Q0Pu_g10, U0Pu = 1.0157, UPhase0 = SIunits.Conversions.from_deg(0.99), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g10);  
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g02(P0Pu = P0Pu_g02, Q0Pu = Q0Pu_g02, U0Pu = 1.0565, UPhase0 = SIunits.Conversions.from_deg(5.12), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g02);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g03(P0Pu = P0Pu_g03, Q0Pu = Q0Pu_g03, U0Pu = 1.0595, UPhase0 = SIunits.Conversions.from_deg(10.27), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g03);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g04(P0Pu = P0Pu_g04, Q0Pu = Q0Pu_g04, U0Pu = 1.0339, UPhase0 = SIunits.Conversions.from_deg(8.03), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g04);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g05(P0Pu = P0Pu_g05, Q0Pu = Q0Pu_g05, U0Pu = 1.0294, UPhase0 = SIunits.Conversions.from_deg(-12.36), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g05);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g06(P0Pu = P0Pu_g06, Q0Pu = Q0Pu_g06, U0Pu = 1.0084, UPhase0 = SIunits.Conversions.from_deg(-59.42), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g06);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g07(P0Pu = P0Pu_g07, Q0Pu = Q0Pu_g07, U0Pu = 1.0141, UPhase0 = SIunits.Conversions.from_deg(-68.95), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g07);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g12(P0Pu = P0Pu_g12, Q0Pu = Q0Pu_g12, U0Pu = 1.02, UPhase0 = SIunits.Conversions.from_deg(-31.88), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g12);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g08(P0Pu = P0Pu_g08, Q0Pu = Q0Pu_g08, U0Pu = 1.0498, UPhase0 = SIunits.Conversions.from_deg(-16.81), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g08);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g11(P0Pu = P0Pu_g11, Q0Pu = Q0Pu_g11, U0Pu = 1.0211, UPhase0 = SIunits.Conversions.from_deg(-29.04), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g11);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g13(P0Pu = P0Pu_g13, Q0Pu = Q0Pu_g13, U0Pu = 1.017, UPhase0 = SIunits.Conversions.from_deg(-54.3), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g13);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g14(P0Pu = P0Pu_g14, Q0Pu = Q0Pu_g14, U0Pu = 1.0454, UPhase0 = SIunits.Conversions.from_deg(-49.9), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g14);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g15(P0Pu = P0Pu_g15, Q0Pu = Q0Pu_g15, U0Pu = 1.0455, UPhase0 = SIunits.Conversions.from_deg(-52.19), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g15);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g16(P0Pu = P0Pu_g16, Q0Pu = Q0Pu_g16, U0Pu = 1.0531, UPhase0 = SIunits.Conversions.from_deg(-64.1), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g16);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g17(P0Pu = P0Pu_g17, Q0Pu = Q0Pu_g17, U0Pu = 1.0092, UPhase0 = SIunits.Conversions.from_deg(-46.85), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g17);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g18(P0Pu = P0Pu_g18, Q0Pu = Q0Pu_g18, U0Pu = 1.0307, UPhase0 = SIunits.Conversions.from_deg(-43.32), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g18);
  Nordic.Components.ControlledGen.ControlledGenFrameNordic g19(P0Pu = P0Pu_g19, Q0Pu = Q0Pu_g19, U0Pu = 1.03, UPhase0 = SIunits.Conversions.from_deg(0.03), gen = Nordic.Components.ControlledGen.Util.ControlledGenFrameParams.genFramePreset.g19);

protected
  // Generator g09 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g09 = -668.5 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g09 = -201.3 / Electrical.SystemBase.SnRef;

// Generator g01 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g01 = -600.00 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g01 = -58.3 / Electrical.SystemBase.SnRef;

// Generator g10 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g10 = -600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g10 = -255.7 / Electrical.SystemBase.SnRef;

// Generator g02 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g02 = -300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g02 = -17.2 / Electrical.SystemBase.SnRef;

// Generator g03 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g03 = -550.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g03 = -20.9 / Electrical.SystemBase.SnRef;

// Generator g04 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g04 = -400.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g04 = -30.4 / Electrical.SystemBase.SnRef;

// Generator g05 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g05 = -200.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g05 = -60.1 / Electrical.SystemBase.SnRef;

// Generator g06 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g06 = -360.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g06 = -138.6 / Electrical.SystemBase.SnRef;

// Generator g07 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g07 = -180.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g07 = -60.4 / Electrical.SystemBase.SnRef;

// Generator g12 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g12 = -310.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g12 = -98.3 / Electrical.SystemBase.SnRef;

// Generator g08 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g08 = -750.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g08 = -232.6 / Electrical.SystemBase.SnRef;

// Generator g11 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g11 = -250.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g11 = -60.7 / Electrical.SystemBase.SnRef;

// Generator g13 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g13 = -0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g13 = -50.1 / Electrical.SystemBase.SnRef;

// Generator g14 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g14 = -630.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g14 = -295.9 / Electrical.SystemBase.SnRef;

// Generator g15 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g15 = -1080.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g15 = -377.9 / Electrical.SystemBase.SnRef;

// Generator g16 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g16 = -600.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g16 = -222.6 / Electrical.SystemBase.SnRef;

// Generator g17 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g17 = -530.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g17 = -48.7 / Electrical.SystemBase.SnRef;

// Generator g18 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g18 = -1060.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g18 = -293.4 / Electrical.SystemBase.SnRef;

// Generator g19 init values:
  // P0Pu, Q0Pu in SnRef, receptor convention
  final parameter Types.PerUnit P0Pu_g19 = -300.0 / Electrical.SystemBase.SnRef;
  final parameter Types.PerUnit Q0Pu_g19 = -121.2 / Electrical.SystemBase.SnRef;

equation

  connect(trafo_1011_4011.terminal1, bus_1011.terminal);
  connect(trafo_1011_4011.terminal2, bus_4011.terminal);
  connect(trafo_11_1011.terminal1, bus_B11.terminal);
  connect(trafo_11_1011.terminal2, bus_1011.terminal);
  connect(trafo_g9_4011.terminal1, bus_BG09.terminal);
  connect(trafo_g9_4011.terminal2, bus_4011.terminal);
  connect(trafo_1012_4012.terminal1, bus_1012.terminal);
  connect(trafo_1012_4012.terminal2, bus_4012.terminal);
  connect(trafo_g1_1012.terminal1, bus_BG01.terminal);
  connect(trafo_g1_1012.terminal2, bus_1012.terminal);
  connect(trafo_12_1012.terminal1, bus_B12.terminal);
  connect(trafo_12_1012.terminal2, bus_1012.terminal);
  connect(trafo_g10_4012.terminal1, bus_BG10.terminal);
  connect(trafo_g10_4012.terminal2, bus_4012.terminal);
  connect(trafo_g2_1013.terminal1, bus_BG02.terminal);
  connect(trafo_g2_1013.terminal2, bus_1013.terminal);
  connect(trafo_13_1013.terminal1, bus_B13.terminal);
  connect(trafo_13_1013.terminal2, bus_1013.terminal);
  connect(trafo_g3_1014.terminal1, bus_BG03.terminal);
  connect(trafo_g3_1014.terminal2, bus_1014.terminal);
  connect(trafo_g4_1021.terminal1, bus_BG04.terminal);
  connect(trafo_g4_1021.terminal2, bus_1021.terminal);
  connect(trafo_1022_4022.terminal1, bus_1022.terminal);
  connect(trafo_1022_4022.terminal2, bus_4022.terminal);
  connect(trafo_g5_1022.terminal1, bus_BG05.terminal);
  connect(trafo_g5_1022.terminal2, bus_1022.terminal);
  connect(trafo_22_1022.terminal1, bus_B22.terminal);
  connect(trafo_22_1022.terminal2, bus_1022.terminal);
  connect(trafo_1_1041.terminal1, bus_B01.terminal);
  connect(trafo_1_1041.terminal2, bus_1041.terminal);
  connect(trafo_g6_1042.terminal1, bus_BG06.terminal);
  connect(trafo_g6_1042.terminal2, bus_1042.terminal);
  connect(trafo_2_1042.terminal1, bus_B02.terminal);
  connect(trafo_2_1042.terminal2, bus_1042.terminal);
  connect(trafo_g7_1043.terminal1, bus_BG07.terminal);
  connect(trafo_g7_1043.terminal2, bus_1043.terminal);
  connect(trafo_3_1043.terminal1, bus_B03.terminal);
  connect(trafo_3_1043.terminal2, bus_1043.terminal);
  connect(trafo_1044_4044a.terminal1, bus_1044.terminal);
  connect(trafo_1044_4044a.terminal2, bus_4044.terminal);
  connect(trafo_1044_4044b.terminal1, bus_1044.terminal);
  connect(trafo_1044_4044b.terminal2, bus_4044.terminal);
  connect(trafo_4_1044.terminal1, bus_B04.terminal);
  connect(trafo_4_1044.terminal2, bus_1044.terminal);
  connect(trafo_1045_4045a.terminal1, bus_1045.terminal);
  connect(trafo_1045_4045a.terminal2, bus_4045.terminal);
  connect(trafo_1045_4045b.terminal1, bus_1045.terminal);
  connect(trafo_1045_4045b.terminal2, bus_4045.terminal);
  connect(trafo_5_1045.terminal1, bus_B05.terminal);
  connect(trafo_5_1045.terminal2, bus_1045.terminal);
  connect(trafo_2031_4031.terminal1, bus_2031.terminal);
  connect(trafo_2031_4031.terminal2, bus_4031.terminal);
  connect(trafo_31_2031.terminal1, bus_B31.terminal);
  connect(trafo_31_2031.terminal2, bus_2031.terminal);
  connect(trafo_g12_4031.terminal1, bus_BG12.terminal);
  connect(trafo_g12_4031.terminal2, bus_4031.terminal);
  connect(trafo_g8_2032.terminal1, bus_BG08.terminal);
  connect(trafo_g8_2032.terminal2, bus_2032.terminal);
  connect(trafo_32_2032.terminal1, bus_B32.terminal);
  connect(trafo_32_2032.terminal2, bus_2032.terminal);
  connect(trafo_g11_4021.terminal1, bus_BG11.terminal);
  connect(trafo_g11_4021.terminal2, bus_4021.terminal);
  connect(trafo_g13_4041.terminal1, bus_BG13.terminal);
  connect(trafo_g13_4041.terminal2, bus_4041.terminal);
  connect(trafo_41_4041.terminal1, bus_B41.terminal);
  connect(trafo_41_4041.terminal2, bus_4041.terminal);
  connect(trafo_g14_4042.terminal1, bus_BG14.terminal);
  connect(trafo_g14_4042.terminal2, bus_4042.terminal);
  connect(trafo_42_4042.terminal1, bus_B42.terminal);
  connect(trafo_42_4042.terminal2, bus_4042.terminal);
  connect(trafo_43_4043.terminal1, bus_B43.terminal);
  connect(trafo_43_4043.terminal2, bus_4043.terminal);
  connect(trafo_46_4046.terminal1, bus_B46.terminal);
  connect(trafo_46_4046.terminal2, bus_4046.terminal);
  connect(trafo_g15_4047.terminal1, bus_BG15.terminal);
  connect(trafo_g15_4047.terminal2, bus_4047.terminal);
  connect(trafo_47_4047.terminal1, bus_B47.terminal);
  connect(trafo_47_4047.terminal2, bus_4047.terminal);
  connect(trafo_g16_4051.terminal1, bus_BG16.terminal);
  connect(trafo_g16_4051.terminal2, bus_4051.terminal);
  connect(trafo_51_4051.terminal1, bus_B51.terminal);
  connect(trafo_51_4051.terminal2, bus_4051.terminal);
  connect(trafo_61_4061.terminal1, bus_B61.terminal);
  connect(trafo_61_4061.terminal2, bus_4061.terminal);
  connect(trafo_g17_4062.terminal1, bus_BG17.terminal);
  connect(trafo_g17_4062.terminal2, bus_4062.terminal);
  connect(trafo_62_4062.terminal1, bus_B62.terminal);
  connect(trafo_62_4062.terminal2, bus_4062.terminal);
  connect(trafo_g18_4063.terminal1, bus_BG18.terminal);
  connect(trafo_g18_4063.terminal2, bus_4063.terminal);
  connect(trafo_63_4063.terminal1, bus_B63.terminal);
  connect(trafo_63_4063.terminal2, bus_4063.terminal);
  connect(trafo_g19_4071.terminal1, bus_BG19.terminal);
  connect(trafo_g19_4071.terminal2, bus_4071.terminal);
  connect(trafo_71_4071.terminal1, bus_B71.terminal);
  connect(trafo_71_4071.terminal2, bus_4071.terminal);
  connect(trafo_g20_4072.terminal1, bus_BG20.terminal);
  connect(trafo_g20_4072.terminal2, bus_4072.terminal);
  connect(trafo_72_4072.terminal1, bus_B72.terminal);
  connect(trafo_72_4072.terminal2, bus_4072.terminal);

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
   
  trafo_1011_4011.switchOffSignal1.value = false;
  trafo_1011_4011.switchOffSignal2.value = false;
  trafo_11_1011.switchOffSignal1.value = false;
  trafo_11_1011.switchOffSignal2.value = false;
  trafo_g9_4011.switchOffSignal1.value = false;
  trafo_g9_4011.switchOffSignal2.value = false;
  trafo_1012_4012.switchOffSignal1.value = false;
  trafo_1012_4012.switchOffSignal2.value = false;
  trafo_g1_1012.switchOffSignal1.value = false;
  trafo_g1_1012.switchOffSignal2.value = false;
  trafo_12_1012.switchOffSignal1.value = false;
  trafo_12_1012.switchOffSignal2.value = false;
  trafo_g10_4012.switchOffSignal1.value = false;
  trafo_g10_4012.switchOffSignal2.value = false;
  trafo_g2_1013.switchOffSignal1.value = false;
  trafo_g2_1013.switchOffSignal2.value = false;
  trafo_13_1013.switchOffSignal1.value = false;
  trafo_13_1013.switchOffSignal2.value = false;
  trafo_g3_1014.switchOffSignal1.value = false;
  trafo_g3_1014.switchOffSignal2.value = false;
  trafo_g4_1021.switchOffSignal1.value = false;
  trafo_g4_1021.switchOffSignal2.value = false;
  trafo_1022_4022.switchOffSignal1.value = false;
  trafo_1022_4022.switchOffSignal2.value = false;
  trafo_g5_1022.switchOffSignal1.value = false;
  trafo_g5_1022.switchOffSignal2.value = false;
  trafo_22_1022.switchOffSignal1.value = false;
  trafo_22_1022.switchOffSignal2.value = false;
  trafo_1_1041.switchOffSignal1.value = false;
  trafo_1_1041.switchOffSignal2.value = false;
  trafo_g6_1042.switchOffSignal1.value = false;
  trafo_g6_1042.switchOffSignal2.value = false;
  trafo_2_1042.switchOffSignal1.value = false;
  trafo_2_1042.switchOffSignal2.value = false;
  trafo_g7_1043.switchOffSignal1.value = false;
  trafo_g7_1043.switchOffSignal2.value = false;
  trafo_3_1043.switchOffSignal1.value = false;
  trafo_3_1043.switchOffSignal2.value = false;
  trafo_1044_4044a.switchOffSignal1.value = false;
  trafo_1044_4044a.switchOffSignal2.value = false;
  trafo_1044_4044b.switchOffSignal1.value = false;
  trafo_1044_4044b.switchOffSignal2.value = false;
  trafo_4_1044.switchOffSignal1.value = false;
  trafo_4_1044.switchOffSignal2.value = false;
  trafo_1045_4045a.switchOffSignal1.value = false;
  trafo_1045_4045a.switchOffSignal2.value = false;
  trafo_1045_4045b.switchOffSignal1.value = false;
  trafo_1045_4045b.switchOffSignal2.value = false;
  trafo_5_1045.switchOffSignal1.value = false;
  trafo_5_1045.switchOffSignal2.value = false;
  trafo_2031_4031.switchOffSignal1.value = false;
  trafo_2031_4031.switchOffSignal2.value = false;
  trafo_31_2031.switchOffSignal1.value = false;
  trafo_31_2031.switchOffSignal2.value = false;
  trafo_g12_4031.switchOffSignal1.value = false;
  trafo_g12_4031.switchOffSignal2.value = false;
  trafo_g8_2032.switchOffSignal1.value = false;
  trafo_g8_2032.switchOffSignal2.value = false;
  trafo_32_2032.switchOffSignal1.value = false;
  trafo_32_2032.switchOffSignal2.value = false;
  trafo_g11_4021.switchOffSignal1.value = false;
  trafo_g11_4021.switchOffSignal2.value = false;
  trafo_g13_4041.switchOffSignal1.value = false;
  trafo_g13_4041.switchOffSignal2.value = false;
  trafo_41_4041.switchOffSignal1.value = false;
  trafo_41_4041.switchOffSignal2.value = false;
  trafo_g14_4042.switchOffSignal1.value = false;
  trafo_g14_4042.switchOffSignal2.value = false;
  trafo_42_4042.switchOffSignal1.value = false;
  trafo_42_4042.switchOffSignal2.value = false;
  trafo_43_4043.switchOffSignal1.value = false;
  trafo_43_4043.switchOffSignal2.value = false;
  trafo_46_4046.switchOffSignal1.value = false;
  trafo_46_4046.switchOffSignal2.value = false;
  trafo_g15_4047.switchOffSignal1.value = false;
  trafo_g15_4047.switchOffSignal2.value = false;
  trafo_47_4047.switchOffSignal1.value = false;
  trafo_47_4047.switchOffSignal2.value = false;
  trafo_g16_4051.switchOffSignal1.value = false;
  trafo_g16_4051.switchOffSignal2.value = false;
  trafo_51_4051.switchOffSignal1.value = false;
  trafo_51_4051.switchOffSignal2.value = false;
  trafo_61_4061.switchOffSignal1.value = false;
  trafo_61_4061.switchOffSignal2.value = false;
  trafo_g17_4062.switchOffSignal1.value = false;
  trafo_g17_4062.switchOffSignal2.value = false;
  trafo_62_4062.switchOffSignal1.value = false;
  trafo_62_4062.switchOffSignal2.value = false;
  trafo_g18_4063.switchOffSignal1.value = false;
  trafo_g18_4063.switchOffSignal2.value = false;
  trafo_63_4063.switchOffSignal1.value = false;
  trafo_63_4063.switchOffSignal2.value = false;
  trafo_g19_4071.switchOffSignal1.value = false;
  trafo_g19_4071.switchOffSignal2.value = false;
  trafo_71_4071.switchOffSignal1.value = false;
  trafo_71_4071.switchOffSignal2.value = false;
  trafo_g20_4072.switchOffSignal1.value = false;
  trafo_g20_4072.switchOffSignal2.value = false;
  trafo_72_4072.switchOffSignal1.value = false;
  trafo_72_4072.switchOffSignal2.value = false;


annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));

end DynamicModel_normTfos;
