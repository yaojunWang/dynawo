within Dynawo.Examples.Nordic.Network;

model Loadflow_CheckResult_Slackbus

  extends Loadflow;
  
  import Modelica.ComplexMath;
  import Dynawo.Types;
  import Dynawo.Electrical.SystemBase;
  
  Types.ActivePower Check_g20_P;
  Types.ReactivePower Check_g20_Q;
  
equation

  Check_g20_P = SystemBase.SnRef * ComplexMath.real(slackbus_g20.terminal.V * ComplexMath.conj(slackbus_g20.terminal.i));
  Check_g20_Q = SystemBase.SnRef * ComplexMath.imag(slackbus_g20.terminal.V * ComplexMath.conj(slackbus_g20.terminal.i));

end Loadflow_CheckResult_Slackbus;
