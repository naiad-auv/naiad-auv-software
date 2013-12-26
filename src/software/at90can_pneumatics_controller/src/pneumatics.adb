-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-20 by Konstantinos Konstantopoulos

with Valve_Generic;
with AVR.AT90CAN128.Digital_IO;

package body Pneumatics is

   procedure Init_Pins is
   begin
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_TORPEDO_LEFT);
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_TORPEDO_RIGHT);
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_MARKER_LEFT);
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_MARKER_RIGHT);
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_GRIPPER_GRAB);
      AVR.AT90CAN128.Digital_IO.Make_Output_Pin(PIN_GRIPPER_ROTATE);
   end Init_Pins;

   procedure Dispatch_Kill_Msg(canMsgIn : IN CAN_Defs.CAN_Message) is
   begin
      if Interfaces."="(canMsgIn.Data(1), CAN_Defs.MSG_KILL_SWITCH_ACTIVE.Data(1)) then
         bKillSwitchFlag := True;
      else
         bKillSwitchFlag := False;
      end if;
   end Dispatch_Kill_Msg;

   procedure Dispatch_Sim_Msg(canMsgIn : IN CAN_Defs.CAN_Message) is
   begin
      if Interfaces."="(canMsgIn.Data(1), CAN_Defs.SIMULATION_MODE) then
         bSimModeFlag := True;
      else
         bSimModeFlag := False;
      end if;
   end Dispatch_Sim_Msg;

   procedure Dispatch_Actuation_Msg(canMsgIn : IN CAN_Defs.CAN_Message; response : OUT Controller_Response) is
      use type CAN_Defs.CAN_Message;
      use Interfaces;
   begin
      if canMsgIn.Data(1) = CAN_Defs.MSG_TORPEDO_LEFT.Data(1) then
         Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_LEFT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_TORPEDO_LEFT_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_TORPEDO_RIGHT.Data(1) then
         Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_RIGHT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_TORPEDO_RIGHT_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_MARKER_LEFT.Data(1) then
         Valve_Generic.Actuate_For_Duration(PIN_MARKER_LEFT, DURATION_ACTUATE_MARKER, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_MARKER_LEFT_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_MARKER_RIGHT.Data(1) then
         Valve_Generic.Actuate_For_Duration(PIN_MARKER_RIGHT, DURATION_ACTUATE_MARKER, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_MARKER_RIGHT_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_GRIPPER_GRAB.Data(1) then
         Valve_Generic.Actuate(PIN_GRIPPER_GRAB, True, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_GRIPPER_GRAB_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_GRIPPER_RELEASE.Data(1) then
         Valve_Generic.Actuate(PIN_GRIPPER_GRAB, False, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_GRIPPER_RELEASE_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_GRIPPER_ROTATE_CW.Data(1) then
         Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, True, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_GRIPPER_ROTATE_CW_CONFIRM;
      elsif canMsgIn.Data(1) = CAN_Defs.MSG_GRIPPER_ROTATE_ACW.Data(1) then
         Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, False, bSimModeFlag);
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_GRIPPER_ROTATE_ACW_CONFIRM;
      else
         response.success := False;
      end if;
   end Dispatch_Actuation_Msg;

end Pneumatics;
