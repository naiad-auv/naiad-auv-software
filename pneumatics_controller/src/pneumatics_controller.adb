-- kks

with Digital_IO;
with Interfaces;
with AVR.AT90CAN128.CALENDAR;
with CAN_Handler;
with AT90CAN.CAN;

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

   procedure Actuate (u8Pin : in Interfaces.Unsigned_8; dDuration : in AVR.AT90CAN128.CALENDAR.Duration; bSimModeActive : in Boolean) is
   begin
      if not bSimModeActive then
         Digital_IO.Set_Pin(u8Pin);
         AVR.AT90CAN128.CALENDAR.Delay_ms(dDuration);
         Digital_IO.Clear_Pin(u8Pin);
      else -- Simulate actuation duration.
         AVR.AT90CAN128.CALENDAR.Delay_ms(dDuration);
      end if;
   end;

   procedure Actuate (u8Pin : in Interfaces.Unsigned_8; bSetPin : in Boolean; bSimModeActive : in Boolean) is
   begin
      if not bSimModeActive then
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
      bKillSwitch	: Boolean			:= False;
      bSimModeActive		: Boolean			:= False;
   begin

      -- TODO: Read bKillSwitch
      -- TODO: Read bSimSwitch

      if bKillSwitch = False then
         case 0 is -- TODO: Msg.Data(0) is
            when 1 =>
               Actuate(PIN_TORPEDO_LEFT, TORPEDO_ACTUATION_T, bSimModeActive);
            when 2 =>
               Actuate(PIN_TORPEDO_RIGHT, TORPEDO_ACTUATION_T, bSimModeActive);
            when 3 =>
               Actuate(PIN_MARKER_LEFT, MARKER_ACTUATION_T, bSimModeActive);
            when 4 =>
               Actuate(PIN_MARKER_RIGHT, MARKER_ACTUATION_T, bSimModeActive);
            when 5 =>
               Actuate(PIN_GRIPPER_GRAB, True, bSimModeActive);
            when 6 =>
               Actuate(PIN_GRIPPER_GRAB, False, bSimModeActive);
            when 7 =>
               Actuate(PIN_GRIPPER_ROTATE, True, bSimModeActive);
            when 8 =>
               Actuate(PIN_GRIPPER_ROTATE, False, bSimModeActive);
            when others =>
               null;
            end case;

         -- TODO: SEND MSG 'COMPLETED'
      else
         null; -- TODO: SEND MSG 'KILLED'
      end if;
   end ISR;
end Pneumatics_Controller;
