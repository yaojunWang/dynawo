within Dynawo.Electrical.Lines;

model SimpleRLTest
import Dynawo;
import Dynawo.Electrical.SystemBase;

parameter Real X = 0.1;
parameter Real R = 0.01;
parameter Real C = 0.0001;
parameter Real Phi1 = 0.1;
parameter Real Phi2 = 0;


Real V1;
Real V2;
Real iBranch;
Real iC1;
Real iC2;

equation

  V1 - V2 = R * iBranch + X / SystemBase.omegaNom * der(iBranch);
  V1 = cos(SystemBase.omegaNom * time + Phi1);
  V2 = cos(SystemBase.omegaNom * time + Phi2);
  iC1 = C*der(V1);
  iC2 = C*der(V2);

end SimpleRLTest;
