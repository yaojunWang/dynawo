model Smib
constant Real PI = 3.14;
constant Real Tref = 0.7;
parameter Real Re = 0.0;
parameter Real xdd = 0.336;
parameter Real Tch = 5.0;
parameter Real Td0 = 9.67;
parameter Real xd = 2.38;
parameter Real xq = 1.21;
parameter Real H = 5.0;
parameter Real ws = 1.0;
parameter Real xep = 0.4;
parameter Real Vs = 1.0;
parameter Real Kg = 0.5;
parameter Real Tg = 5.0;
parameter Real Kp = 10.0;
parameter Real Ki = 1.0;
parameter Real Kd = 0.0;
parameter Real Td = 1.0;
parameter Real Ka = 1.0;
parameter Real Ta = 0.1;
parameter Real w0 = 314.1593;
parameter Real To = 3.0;
parameter Real T3 = 0.1;
parameter Real Te = 0.1;
Real U1 (start = 0);
Real U2 (start = 0);
Real delta (start = 1.5);
Real omega (start = 1);
Real eqp (start = 0.6);
Real Pgv (start = 0.7);
Real Pm (start = 0.7);
Real iq;
Real id;
Real Vd;
Real Vq;
Real Vt;
Real UsRefPu;
equation
iq = (Vs*sin(delta))/(xep + xq);
id = (eqp - (Vs*cos(delta)))/(xep + xdd);
Vd = (Re*id) - (xep*iq) + (Vs*sin(delta));
Vq = (Re*iq) + (xep*id) + (Vs*cos(delta));
Vt = sqrt((Vd*Vd) + (Vq*Vq));
der (U1) = (1/Te)*(-U1 + (Kp*(UsRefPu -Vt)));
der (U2) =-U2 + ((1/T3)*(ws-omega)) + Tref;
der (delta) = (omega-ws)*w0;
der (omega) = (1/(2*H))*((Pm/omega) - iq*(eqp + (id*(xq -xdd))));
der (eqp) = (1/Td0)*(-eqp - ((xd-xdd)*id) + U1);
der (Pgv) = (1/Tg)*(U2 - Pgv - (Kg*(omega - ws)));
der (Pm) = (1/Tch)*((-Pm/omega) + Pgv);
end Smib;