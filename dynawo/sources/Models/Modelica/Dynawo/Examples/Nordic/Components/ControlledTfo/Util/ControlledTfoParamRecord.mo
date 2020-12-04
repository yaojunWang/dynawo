within Dynawo.Examples.Nordic.Components.ControlledTfo.Util;

record ControlledTfoParamRecord

  import Dynawo.Types;
  import Modelica.SIunits;
  type tfoPreset = enumeration(trafo_11_1011, trafo_12_1012, trafo_13_1013, trafo_22_1022, trafo_1_1041, trafo_2_1042, trafo_3_1043, trafo_4_1044, trafo_5_1045, trafo_31_2031, trafo_32_2032, trafo_41_4041, trafo_42_4042, trafo_43_4043, trafo_46_4046, trafo_47_4047, trafo_51_4051, trafo_61_4061, trafo_62_4062, trafo_63_4063, trafo_71_4071, trafo_72_4072);
  
  type tfoParams = enumeration(SNom, X, t1st, tNext, Uc20Pu);
  
  final constant Integer NbTap = 33;
  final constant Types.PerUnit rTfoMinPu = 0.88;
  final constant Types.PerUnit rTfoMaxPu = 1.20;
  final constant Real[tfoPreset, tfoParams] tfoParamValues = {
    {400.0, 0.10*1.04^2*100, 30, 8, 1.0}, // trafo_11_1011
    {600.0, 0.10*1.05^2*100, 30, 9, 1.0}, // trafo_12_1012
    {200.0, 0.10*1.04^2*100, 30, 10, 1.0}, // trafo_13_1013
    {560.0, 0.10*1.04^2*100, 30, 11, 1.0}, // trafo_22_1022
    {1200.0, 0.10*1.0^2*100, 29, 12, 1.0}, // trafo_1_1041
    {600.0, 0.10*1.0^2*100, 29, 8, 1.0}, // trafo_2_1042
    {460.0, 0.10*1.01^2*100, 29, 9, 1.0}, // trafo_3_1043
    {1600.0, 0.10*0.99^2*100, 29, 10, 1.0}, // trafo_4_1044
    {1400.0, 0.10*1.0^2*100, 29, 11, 1.0}, // trafo_5_1045
    {200.0, 0.10*1.01^2*100, 29, 12, 1.0}, // trafo_31_2031
    {400.0, 0.10*1.06^2*100, 31, 8, 1.0}, // trafo_32_2032
    {1080.0, 0.10*1.04^2*100, 31, 9, 1.0}, // trafo_41_4041
    {800.0, 0.10*1.03^2*100, 31, 10, 1.0}, // trafo_42_4042
    {1800.0, 0.10*1.02^2*100, 31, 11, 1.0}, // trafo_43_4043
    {1400.0, 0.10*1.02^2*100, 31, 12, 1.0}, // trafo_46_4046
    {200.0, 0.10*1.04^2*100, 30, 8, 1.0}, // trafo_47_4047
    {1600.0, 0.10*1.05^2*100, 30, 9, 1.0}, // trafo_51_4051
    {1000.0, 0.10*1.03^2*100, 30, 10, 1.0}, // trafo_61_4061
    {600.0, 0.10*1.04^2*100, 30, 11, 1.0}, // trafo_62_4062
    {1180.0, 0.10*1.03^2*100, 30, 12, 1.0}, // trafo_63_4063
    {600.0, 0.10*1.03^2*100, 31, 9, 1.0}, // trafo_71_4071
    {4000.0, 0.10*1.05^2*100, 31, 11, 1.0} // trafo_72_4072
  };
end ControlledTfoParamRecord;
