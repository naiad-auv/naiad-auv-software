
-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-30

with AVR.AT90CAN128.CALENDAR;
with AT90CAN.CAN;
with CAN_Handler;
with Digital_IO;
with Interfaces;

package body Pneumatics_Controller is

   procedure Init is
   begin
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_LEFT);
      Digital_IO.Make_Output_Pin(PIN_TORPEDO_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_LEFT);
      Digital_IO.Make_Output_Pin(PIN_MARKER_RIGHT);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_GRAB);
      Digital_IO.Make_Output_Pin(PIN_GRIPPER_ROTATE);
   end Init;

   procedure Actuate (u8Pin : in Interfaces.Unsigned_8; dT : in AVR.AT90CAN128.CALENDAR.Duration; bSimModeFlag : in Boolean) is
   begin
      if not bSimModeFlag then
         Digital_IO.Set_Pin(u8Pin);
         AVR.AT90CAN128.CALENDAR.Delay_ms(dT);
         Digital_IO.Clear_Pin(u8Pin);
      else -- Simulate actuation duration.
         AVR.AT90CAN128.CALENDAR.Delay_ms(dT);
      end if;
   end;

   procedure Actuate (u8Pin : in Interfaces.Unsigned_8; bSetPin : in Boolean; bSimModeFlag : in Boolean) is
   begin
      if not bSimModeFlag then
         if bSetPin then
            Digital_IO.Set_Pin(u8Pin);
         else
            Digital_IO.Clear_Pin(u8Pin);
         end if;
      else
         null;
      end if;
   end;

   procedure ISR (canMsg : in CAN_Handler.CAN_Message) is
      bKillSwitchFlag	: Boolean := False;
      bSimModeFlag	: Boolean := False;
   begin

      -- TODO: Read bKillSwitch
      -- TODO: Read bSimSwitch

      if bKillSwitchFlag = False then
         case 0 is -- TODO: Msg.Data(0) is
            when 1 =>
               Actuate(PIN_TORPEDO_LEFT, T_TORPEDO_ACTUATION, bSimModeFlag);
            when 2 =>
               Actuate(PIN_TORPEDO_RIGHT, T_TORPEDO_ACTUATION, bSimModeFlag);
            when 3 =>
               Actuate(PIN_MARKER_LEFT, T_MARKER_ACTUATION, bSimModeFlag);
            when 4 =>
               Actuate(PIN_MARKER_RIGHT, T_MARKER_ACTUATION, bSimModeFlag);
            when 5 =>
               Actuate(PIN_GRIPPER_GRAB, True, bSimModeFlag);
            when 6 =>
               Actuate(PIN_GRIPPER_GRAB, False, bSimModeFlag);
            when 7 =>
               Actuate(PIN_GRIPPER_ROTATE, True, bSimModeFlag);
            when 8 =>
               Actuate(PIN_GRIPPER_ROTATE, False, bSimModeFlag);
            when others =>
               null;
            end case;

         -- TODO: SEND MSG 'COMPLETED'
      else
         null; -- TODO: SEND MSG 'KILLED'
      end if;
   end ISR;

end Pneumatics_Controller;
