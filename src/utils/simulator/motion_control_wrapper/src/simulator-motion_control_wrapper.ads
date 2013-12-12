with motioncontrol.Dispatcher;
with math.Vectors;
with Math.Matrices;
with Simulator.submarine;
with motioncontrol.Motion_Component;
with motioncontrol.Thrusters;
with Math.Angles;
with math.Vectors;
with motioncontrol.PID_Controller;

package simulator.Motion_Control_Wrapper is

   type TPIDComponentScalings is new motioncontrol.PID_Controller.TPIDComponentScalings;
   type CWrapDispatcher is tagged private;
   type pCWrapDispatcher is access CWrapDispatcher;
   type EMotionComponent is new motioncontrol.Motion_Component.EMotionComponent;

   function pxCreate_Wrap_Dispatcher return pCWrapDispatcher;



   procedure Update_Pid_Scaling(this : in CWrapDispatcher ; xComponentScaling : TPIDComponentScalings; eComponentToScale : EMotionComponent);

   procedure Update_Values(this : in out CWrapDispatcher;
                           xNewCurrentAbsolutePosition : in math.Vectors.CVector;
                           xNewCurrentOrientation : in math.Matrices.CMatrix ;
                           tfMotorValuesSubmarine : out simulator.submarine.TMotorForce ;
                           fDeltaTime : in float);


   procedure Restart(this : in out CWrapDispatcher);
   procedure Update_Wanted_Position(this : in out CWrapDispatcher;
                                    xWantedPosition : in math.Vectors.CVector ;
                                    xWantedOrientation : in math.Matrices.CMatrix );


private

   type CWrapDispatcher is tagged
      record
         pxDispatcher : motioncontrol.Dispatcher.pCDispatcher;
      end record;


end simulator.Motion_Control_Wrapper;
