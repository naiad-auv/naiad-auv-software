with Simulator_Motio_Control_Test;
with simulator.Motion_Control_Wrapper;
with Simulator.Comunication_Prot_Obj;
with Simulator.submarine;
with ada.Text_IO;
procedure Main is
   pxMotionControlWrapper : simulator.Motion_Control_Wrapper.pCWrapDispatcher;
   tMotorForce : simulator.submarine.TMotorForce;
   xScaling : simulator.Motion_Control_Wrapper.TPIDComponentScalings;

begin
   Simulator_Motio_Control_Test.Intialize_And_Reset(sIPAdress => "127.0.0.1",
                                                    iPort     => 1337);
   pxMotionControlWrapper := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;

   loop
      delay(0.25);
      for i in simulator.Motion_Control_Wrapper.PositionX .. simulator.Motion_Control_Wrapper.RotationZ loop
      pxMotionControlWrapper.Update_Pid_Scaling(xComponentScaling => simulator.Motion_Control_Wrapper.TPIDComponentScalings(Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(i))),
                                                eComponentToScale => i);
         xScaling := simulator.Motion_Control_Wrapper.TPIDComponentScalings(Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Pid_Scaling(simulator.Comunication_Prot_Obj.EMotionComponent(i)));
         --Ada.Text_IO.Put_Line("Component: " & simulator.Motion_Control_Wrapper.EMotionComponent'pos(i)'img & " Scaling is P: " & xScaling.fProportionalScale'img & "I: " & xScaling.fIntegralScale'img & "D: " & xScaling .fDerivativeScale'img);

      end loop;
      pxMotionControlWrapper.Update_Wanted_Position(xWantedPosition    => Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Wanted_Position,
                                                    xWantedOrientation => Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Wanted_Orientation);
      pxMotionControlWrapper.Update_Values(xNewCurrentAbsolutePosition => Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Current_Position,
                                           xNewCurrentOrientation      => Simulator_Motio_Control_Test.xProtected_Read_Info.xGet_Current_Orientation,
                                           tfMotorValuesSubmarine      => tMotorForce,
                                           fDeltaTime                  => 0.25);
      Simulator_Motio_Control_Test.xProtected_Send_Info.Set_Motor_Power(tMotorForce);
   end loop;



end Main;
