with Navigation.Motion_Component;
with Navigation.Dispatcher;
with Math.Vectors;
with Math.Rotators;

package Navigation.Motion_Controller is

   type CMotion_Controller is tagged private;
   type pCMotion_Controller is access CMotion_Controller;

   function pxCreate return pCMotion_Controller;

   procedure Update(this : in out CMotion_Controller; fDeltaTime : float);

private
   procedure Reset(this : in out CMotion_Controller);

   procedure Handle_Incomming_CAN_Message(this : in out CMotion_Controller);

   procedure Transmit_Control_Values(this : in CMotion_Controller; xNewThrusterControlValues : Navigation.Motion_Component.TThruster_Control_Values);

   type CMotion_Controller is tagged
      record
         fTimeSinceLastControlUpdate : float;

         pxDispatcher : Navigation.Dispatcher.pCDispatcher;
         -- Canmodul ospecat atm
      end record;
end Navigation.Motion_Controller;
