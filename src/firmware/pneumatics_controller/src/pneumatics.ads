-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-18 by Konstantinos Konstantopoulos

with AVR.AT90CAN128.CAN;
with Interfaces;
with AVR.AT90CAN128.CLOCK;

package Pneumatics is

   PIN_TORPEDO_LEFT	: Constant Interfaces.Unsigned_8 := 1;
   PIN_TORPEDO_RIGHT	: Constant Interfaces.Unsigned_8 := 2;
   PIN_MARKER_LEFT	: Constant Interfaces.Unsigned_8 := 3;
   PIN_MARKER_RIGHT	: Constant Interfaces.Unsigned_8 := 4;
   PIN_GRIPPER_GRAB	: Constant Interfaces.Unsigned_8 := 5;
   PIN_GRIPPER_ROTATE	: Constant Interfaces.Unsigned_8 := 6;

   DURATION_ACTUATE_TORPEDO : Constant AVR.AT90CAN128.CLOCK.Time_Duration := 1000;
   DURATION_ACTUATE_MARKER : Constant AVR.AT90CAN128.CLOCK.Time_Duration := 1000;

   type Controller_Response is record
      success	: Boolean;
      canMsgOut	: AVR.AT90CAN128.CAN.CAN_Message;
   end record;

   procedure Dispatch_Actuation_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response);
   procedure Dispatch_Kill_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response);
   procedure Dispatch_Sim_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response);
   procedure Init_Pins;

   bKillSwitchFlag	: Boolean := False;
   bSimModeFlag		: Boolean := False;

end pneumatics;
