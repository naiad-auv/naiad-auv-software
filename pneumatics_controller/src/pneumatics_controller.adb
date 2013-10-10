pragma Profile (Ravenscar);

with Interfaces;
with Digital_IO;
with Valve_Generic;
with AVR.AT90CAN128.CALENDAR;

package body Pneumatics_Controller is

procedure Main(canMsg : IN CAN_Handler.CAN_Message) is

   use type CAN_Handler.CAN_ID;
   use type Interfaces.Unsigned_8;

   -- TODO: Should be moved to a CAN ID def file.
   CAN_ID_KILL_SWITCH	: Constant CAN_Handler.CAN_ID := 111;
   CAN_ID_SIM_MODE	: Constant CAN_Handler.CAN_ID := 222;

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
   --canMsg		: CAN_Handler.CAN_Message;

   procedure Init_Pins is
   begin
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_LEFT);
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_LEFT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_GRAB);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_ROTATE);
   end Init_Pins;

   procedure Dispatch_Kill_Msg(canMsg : CAN_Handler.CAN_Message) is
   begin
      if canMsg.Data(1) = 0 then
         bKillSwitchFlag := True;
      elsif canMsg.Data(1) = 255 then
        bKillSwitchFlag := False;
      else
         null;
      end if;
   end Dispatch_Kill_Msg;

   procedure Dispatch_Sim_Msg(canMsg : CAN_Handler.CAN_Message) is
   begin
      if canMsg.Data(1) = 0 then
         bSimModeFlag := True;
      elsif canMsg.Data(1) = 255 then
         bSimModeFlag := False;
      else
         null;
      end if;
   end Dispatch_Sim_Msg;

   procedure Dispatch_Actuation_Msg(canMsg : CAN_Handler.CAN_Message) is
   begin
      case canMsg.Data(1) is
         when 1 =>
            Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_LEFT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
         when 2 =>
            Valve_Generic.Actuate_For_Duration(PIN_TORPEDO_RIGHT, DURATION_ACTUATE_TORPEDO, bSimModeFlag);
         when 3 =>
            Valve_Generic.Actuate_For_Duration(PIN_MARKER_LEFT, DURATION_ACTUATE_MARKER, bSimModeFlag);
         when 4 =>
            Valve_Generic.Actuate_For_Duration(PIN_MARKER_RIGHT, DURATION_ACTUATE_MARKER, bSimModeFlag);
         when 5 =>
            Valve_Generic.Actuate(PIN_GRIPPER_GRAB, True, bSimModeFlag);
         when 6 =>
            Valve_Generic.Actuate(PIN_GRIPPER_GRAB, False, bSimModeFlag);
         when 7 =>
            Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, True, bSimModeFlag);
         when 8 =>
            Valve_Generic.Actuate(PIN_GRIPPER_ROTATE, False, bSimModeFlag);
         when others =>
            null;
      end case;
   end Dispatch_Actuation_Msg;

begin

   Init_Pins;

   if canMsg.ID = CAN_ID_KILL_SWITCH then
      Dispatch_Kill_Msg(canMsg);
   elsif canMsg.ID = CAN_ID_SIM_MODE then
      Dispatch_Sim_Msg(canMsg);
   else
      if bKillSwitchFlag = False then
         Dispatch_Actuation_msg(canMsg);
      end if;
   end if;

   -- TODO: Send MSG 'COMPLETED'

end Main;

   end Pneumatics_Controller;
