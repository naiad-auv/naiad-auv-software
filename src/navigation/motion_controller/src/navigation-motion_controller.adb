with Navigation.Motion_Component;
with Navigation.Dispatcher;

package body Navigation.Motion_Controller is

   function pxCreate return pCMotion_Controller is
   begin
      return null;
   end pxCreate;


   procedure Update(this : in out CMotion_Controller; fDeltaTime : float) is
   begin
      null;
   end Update;


   procedure Reset(this : in out CMotion_Controller) is
   begin
      null;
   end Reset;


   procedure Handle_Incomming_CAN_Message(this : in out CMotion_Controller) is
   begin
      null;
   end Handle_Incomming_CAN_Message;


   procedure Transmit_Control_Values(this : in CMotion_Controller; xNewThrusterControlValues : Navigation.Motion_Component.TThruster_Control_Values) is
   begin
      null;
   end Transmit_Control_Values;

end Navigation.Motion_Controller;
