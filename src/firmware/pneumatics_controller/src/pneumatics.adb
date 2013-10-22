-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-18 by Konstantinos Konstantopoulos

with Valve_Generic;
with Digital_IO;
with CAN_Defs;

package body Pneumatics is

   procedure Init_Pins is
   begin
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_LEFT);
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_LEFT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_GRAB);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_ROTATE);
   end Init_Pins;

   procedure Dispatch_Kill_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response) is
   begin
      if Interfaces."="(canMsgIn.Data(1), 0) then
         bKillSwitchFlag := True;
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_KILL_SWITCH_ACTIVE_CONFIRM;
      elsif Interfaces."="(canMsgIn.Data(1), 255) then
         bKillSwitchFlag := False;
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_KILL_SWITCH_NOT_ACTIVE_CONFIRM;
      else
         --response.success := False;

         -- Debug
         response.success := True;
         response.canMsgOut := (ID =>(ID => 255,isExtended => False), Len => 1, Data => (131, others => 0) );
      end if;
   end Dispatch_Kill_Msg;

   procedure Dispatch_Sim_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response) is
   begin
      if Interfaces."="(canMsgIn.Data(1), 0) then
         bSimModeFlag := True;
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_SIMULATION_MODE_ACTIVE_CONFIRM;
      elsif Interfaces."="(canMsgIn.Data(1), 255) then
         bSimModeFlag := False;
         response.success := True;
         response.canMsgOut := CAN_Defs.MSG_SIMULATION_MODE_NOT_ACTIVE_CONFIRM;
      else
         --response.success := False;

         -- Debug
         response.success := True;
         response.canMsgOut := (ID =>(ID => 255,isExtended => False), Len => 1, Data => (141, others => 0) );
      end if;
   end Dispatch_Sim_Msg;

   procedure Dispatch_Actuation_Msg(canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; response : OUT Controller_Response) is
      use type AVR.AT90CAN128.CAN.CAN_Message;
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
         --response.success := False;

         -- Debug
         response.success := True;
         response.canMsgOut := (ID =>(ID => 255,isExtended => False), Len => 1, Data => (151, others => 0) );
      end if;
   end Dispatch_Actuation_Msg;

end Pneumatics;
