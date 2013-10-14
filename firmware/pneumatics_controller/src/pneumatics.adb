-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11

with Valve_Generic;
with Digital_IO;
with AVR.AT90CAN128.CALENDAR;
with Interfaces;

package body Pneumatics is

   PIN_TORPEDO_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_TORPEDO_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_GRAB	: Constant Interfaces.Unsigned_8 := 0;
   PIN_GRIPPER_ROTATE	: Constant Interfaces.Unsigned_8 := 0;

   DURATION_ACTUATE_TORPEDO : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;
   DURATION_ACTUATE_MARKER : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;

   bKillSwitchFlag	: Boolean := False;
   bSimModeFlag		: Boolean := False;

   procedure Init_Pins is
   begin
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_LEFT);
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_LEFT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_GRAB);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_ROTATE);
   end Init_Pins;

   procedure Controller (canMsgIn : IN Can.CAN_Message; result : OUT Controller_Response) is

      procedure Dispatch_Kill_Msg(canMsgIn : Can.CAN_Message) is
      begin
         if Interfaces."="(canMsgIn.Data(1), 0) then
            bKillSwitchFlag := True;
            result.success := True;
            result.canMsgOut := Can.MSG_KILL_SWITCH_ACTIVE;
         elsif Interfaces."="(canMsgIn.Data(1), 255) then
            bKillSwitchFlag := False;
            result.success := True;
            result.canMsgOut := Can.MSG_KILL_SWITCH_NOT_ACTIVE;
         else
            result.success := False;
         end if;
      end Dispatch_Kill_Msg;

      procedure Dispatch_Sim_Msg(canMsgIn : Can.CAN_Message) is
      begin
         if Interfaces."="(canMsgIn.Data(1), 0) then
            bSimModeFlag := True;
            result.success := True;
            result.canMsgOut := Can.MSG_SIMULATION_MODE_ACTIVE;
         elsif Interfaces."="(canMsgIn.Data(1), 255) then
            bSimModeFlag := False;
            result.success := True;
            result.canMsgOut := Can.MSG_SIMULATION_MODE_NOT_ACTIVE;
         else
            result.success := False;
         end if;
      end Dispatch_Sim_Msg;

      procedure Dispatch_Actuation_Msg(canMsgIn : Can.CAN_Message) is
         use type Can.CAN_Message;
      begin
         if canMsgIn = Can.MSG_TORPEDO_LEFT then
            --Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_LEFT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
            --canMsgOut := Can.MSG_TORPEDO_LEFT_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_TORPEDO_LEFT_CONFIRM;
         elsif canMsgIn = Can.MSG_TORPEDO_RIGHT then
            --Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_RIGHT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
            --canMsgOut := Can.MSG_TORPEDO_RIGHT_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_TORPEDO_RIGHT_CONFIRM;
         elsif canMsgIn = Can.MSG_MARKER_LEFT then
            --Valve_Generic.Actuate_For_Duration(PIN_MARKER_LEFT, DURATION_ACTUATE_MARKER, bSimModeFlag);
            --canMsgOut := Can.MSG_MARKER_LEFT_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_MARKER_LEFT_CONFIRM;
         elsif canMsgIn = Can.MSG_MARKER_RIGHT then
            --Valve_Generic.Actuate_For_Duration(PIN_MARKER_RIGHT, DURATION_ACTUATE_MARKER, bSimModeFlag);
            --canMsgOut := Can.MSG_MARKER_RIGHT_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_MARKER_RIGHT_CONFIRM;
         elsif canMsgIn = Can.MSG_GRIPPER_GRAB then
            --Valve_Generic.Actuate(PIN_GRIPPER_GRAB, True, bSimModeFlag);
            --canMsgOut := Can.MSG_GRIPPER_GRAB_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_GRIPPER_GRAB_CONFIRM;
         elsif canMsgIn = Can.MSG_GRIPPER_RELEASE then
            --Valve_Generic.Actuate(PIN_GRIPPER_GRAB, False, bSimModeFlag);
            --canMsgOut := Can.MSG_GRIPPER_RELEASE_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_GRIPPER_RELEASE_CONFIRM;
         elsif canMsgIn = Can.MSG_GRIPPER_ROTATE_CW then
            --Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, True, bSimModeFlag);
            --canMsgOut := Can.MSG_GRIPPER_ROTATE_CW_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_GRIPPER_ROTATE_CW_CONFIRM;
         elsif canMsgIn = Can.MSG_GRIPPER_ROTATE_ACW then
            --Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, False, bSimModeFlag);
            --canMsgOut := Can.MSG_GRIPPER_ROTATE_ACW_CONFIRM;
            result.success := True;
            result.canMsgOut := Can.MSG_GRIPPER_ROTATE_ACW_CONFIRM;
         else
            result.success := False;
         end if;
      end Dispatch_Actuation_Msg;

   begin

      result.success := False;

      if Can."="(canMsgIn.ID, Can.MSG_KILL_SWITCH_ID) then
         Dispatch_Kill_Msg(canMsgIn);
      elsif Can."="(canMsgIn.ID, Can.MSG_SIMULATION_MODE_ID) then
         Dispatch_Sim_Msg(canMsgIn);
      elsif Can."="(canMsgIn.ID, Can.MSG_PNEUMATICS_ID) then
         if bKillSwitchFlag = False then
            Dispatch_Actuation_msg(canMsgIn);
         end if;
      else
         result.success := False;
      end if;

   end Controller;

end pneumatics;
