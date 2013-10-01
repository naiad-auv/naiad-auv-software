-- kks

with Interfaces;
with CAN_Handler;
with AVR.AT90CAN128.CALENDAR;

package Pneumatics_Controller is
   PIN_TORPEDO_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_TORPEDO_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_GRAB	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_ROTATE	: Constant Interfaces.Unsigned_8 := 0;

   TORPEDO_ACTUATION_T : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;
   MARKER_ACTUATION_T : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;

   procedure Init;
   procedure ISR(canMsg : in CAN_Handler.CAN_Message);
end Pneumatics_Controller;
