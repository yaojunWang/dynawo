within Dynawo.Examples.Nordic.Components.ControlledGen.Util;

record ControlledGenFrameParams
  
  import Dynawo.Types;

  type genFramePreset = enumeration(g01, g02, g03, g04, g05, g06, g07, g08, g09, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20);
  type exAvPsOeParams = enumeration(ifLimPu, f, r, L1, G, Ta, Tb, L2, Kp, Tw, T1, T2);
  type genParams = enumeration(SNom, PNom, RaPu, XlPu, XdPu, XqPu, XpdPu, XpqPu, XppdPu, XppqPu, Tpd0, Tpq0, Tppd0, Tppq0, H, nd, nq, md, mq, isHydroPowerPlant);


  // Param Tables
  // SNom, PNom, RaPu, XlPu, XdPu, XqPu, XpdPu, XpqPu, XppdPu, XppqPu, Tpd0, Tpq0, Tppd0, Tppq0, H, nd, nq, md, mq, threeWindings
  final constant Real[genFramePreset,genParams] genParamValues = {
  {800.0, 760.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g01
  {600.0, 570.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g02
  {700.0, 665.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g03
  {600.0, 570.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g04
  {250.0, 237.5, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g05
  {400.0, 360.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g06
  {200.0, 180.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g07
  {850.0, 807.5, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g08
  {1000.0, 950.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g09
  {800.0, 760.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g10
  {300.0, 285.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g11
  {350.0, 332.5, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g12
  {300.0, 285.0, 0.002, 0.15, 1.55, 1.0, 0.3, 0.8, 0.20, 0.20, 7.0, 1, 0.05, 0.10, 2.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g13
  {700.0, 630.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g14
  {1200.0, 1080.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g15
  {700.0, 630.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g16
  {600.0, 540.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g17
  {1200.0, 1080.0, 0.0015, 0.15, 2.20, 2.00, 0.30, 0.40, 0.20, 0.20, 7.0, 1.5, 0.05, 0.05, 6.0, 6.0257, 6.0257, 0.1, 0.1, 0}, // g18
  {500.0, 475.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1}, // g19
  {4500.0, 4275.0, 0.002, 0.15, 1.10, 0.70, 0.25, 1, 0.20, 0.20, 5.0, 1, 0.05, 0.10, 3.0, 6.0257, 6.0257, 0.1, 0.1, 1} // g20
  };// sqrt(2137.4^2 + 377.4^2), 2137.4
  
  final constant Real[genFramePreset] govParamValues = {
  0.04, // g01
  0.04, // g02
  0.04, // g03
  0.04, // g04
  0.04, // g05
  0, // g06
  0, // g07
  0.04, // g08
  0.04, // g09
  0.04, // g10
  0.04, // g11
  0.04, // g12
  0, // g13
  0, // g14
  0, // g15
  0, // g16
  0, // g17
  0, // g18
  0.08, // g19
  0.08 // g20
  };
  
  // IfLimPu, f, r, L1, G, Ta, Tb, L2, Kp, Tw, T1, T2
  final constant Real[genFramePreset, exAvPsOeParams] exAvPsOeParamValues = {
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g01
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g02
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g03
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 150.0, 15.0, 0.20, 0.010}, // g04
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g05
  {3.0618, 1.0, 0.0, -20.0, 120.0, 5.0, 12.5, 5.0, 75.0, 15.0, 0.22, 0.012}, // g06
  {3.0618, 1.0, 0.0, -20.0, 120.0, 5.0, 12.5, 5.0, 75.0, 15.0, 0.22, 0.012}, // g07
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g08
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g09
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g10
  {1.8991, 1.0, 0.0, -20.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g11
  {1.8991, 1.0, 0.0, -20.0, 70.0, 10.0, 20.0, 4.0, 75.0, 15.0, 0.20, 0.010}, // g12
  {2.9579, 0.0, 1.0, -17.0, 50.0, 4.0, 20.0, 4.0, 0.0, 1.0, 1.0, 1.0}, // g13
  {3.0618, 0.0, 1.0, -18.0, 120.0, 5.0, 12.5, 5.0, 75.0, 15.0, 0.22, 0.012}, // g14
  {3.0618, 0.0, 1.0, -18.0, 120.0, 5.0, 12.5, 5.0, 75.0, 15.0, 0.22, 0.012}, // g15
  {3.0618, 0.0, 1.0, -18.0, 120.0, 5.0, 12.5, 5.0, 75.0, 15.0, 0.22, 0.012}, // g16
  {3.0618, 0.0, 1.0, -18.0, 120.0, 5.0, 12.5, 5.0, 150.0, 15.0, 0.22, 0.012}, // g17
  {3.0618, 0.0, 1.0, -18.0, 120.0, 5.0, 12.5, 5.0, 150.0, 15.0, 0.22, 0.012}, // g18
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 0.0, 1.0, 1.0, 1.0}, // g19
  {1.8991, 0.0, 1.0, -11.0, 70.0, 10.0, 20.0, 4.0, 0.0, 1.0, 1.0, 1.0} // g20
  };


end ControlledGenFrameParams;
