
-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-30

with AVR.AT90CAN128.CALENDAR;
with CAN_Handler;
with Interfaces;

package Pneumatics_Controller is

   PIN_TORPEDO_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_TORPEDO_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_GRAB	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_ROTATE	: Constant Interfaces.Unsigned_8 := 0;

   T_TORPEDO_ACTUATION : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;
   T_MARKER_ACTUATION : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;

   procedure Init;
   procedure ISR(canMsg : in CAN_Handler.CAN_Message);

end Pneumatics_Controller;
