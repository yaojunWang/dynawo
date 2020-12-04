within Dynawo.Examples.Nordic.Components.ControlledTfo.Util;

model InitialisedTransformerVariableTap
  import Dynawo.Electrical;
  import Dynawo.Types;
  extends Electrical.Transformers.TransformerVariableTap(Tap0(fixed=false),rTfo0Pu(fixed=false), rTfoPu(fixed=true), rTfoMinPu=ControlledTfoParamRecord.rTfoMinPu, rTfoMaxPu=ControlledTfoParamRecord.rTfoMaxPu, NbTap=ControlledTfoParamRecord.NbTap, U20Pu(fixed=false), u10Pu.re(fixed=false), u10Pu.im(fixed=false), i10Pu.re(fixed=false), i10Pu.im(fixed=false), u20Pu.re(fixed=false), u20Pu.im(fixed=false), i20Pu.re(fixed=false), i20Pu.im(fixed=false));
     
  Electrical.Transformers.TransformerVariableTapPQ_INIT init(
  rTfoMinPu=ControlledTfoParamRecord.rTfoMinPu, rTfoMaxPu=ControlledTfoParamRecord.rTfoMaxPu, NbTap=ControlledTfoParamRecord.NbTap,
  SNom=SNom, R=R, X=X, G=G, B=B,
  P10Pu=P10Pu, Q10Pu=Q10Pu, U10Pu=U10Pu, U1Phase0=U1Phase0,
  Uc20Pu=Uc20Pu
  );
  
protected
  parameter Types.VoltageModulePu Uc20Pu; //Voltage setpoint on side 2
  parameter Types.Angle U1Phase0;
  
initial algorithm  

  Tap0 := init.Tap0;
  rTfo0Pu := init.rTfo0Pu;
  u10Pu := init.u10Pu;
  i10Pu := init.i10Pu;
  u20Pu := init.u20Pu;
  i20Pu := init.i20Pu;
  U20Pu := init.U20Pu;
equation

end InitialisedTransformerVariableTap;
