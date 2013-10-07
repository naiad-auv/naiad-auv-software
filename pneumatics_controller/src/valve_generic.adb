package body Valve_Generic is
begin
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


end Valve_Generic;
