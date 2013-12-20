-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-12 by Konstantinos Konstantopoulos


with AVR.AT90CAN128.Digital_IO;

package body Valve_Generic is

   procedure Actuate_For_Duration (u8Pin : in Interfaces.Unsigned_8; dT : in AVR.AT90CAN128.Clock.Time_Duration; bSimModeFlag : in Boolean) is
   begin
      if not bSimModeFlag then
         AVR.AT90CAN128.Digital_IO.Set_Pin(u8Pin);
         AVR.AT90CAN128.Clock.Delay_ms(dT);
         AVR.AT90CAN128.Digital_IO.Clear_Pin(u8Pin);
      else -- Simulate actuation duration.
           AVR.AT90CAN128.Clock.Delay_ms(dT);
           null;
      end if;
   end;

   procedure Actuate (u8Pin : in Interfaces.Unsigned_8; bSetPin : in Boolean; bSimModeFlag : in Boolean) is
   begin
      if not bSimModeFlag then
         if bSetPin then
            AVR.AT90CAN128.Digital_IO.Set_Pin(u8Pin);
         else
            AVR.AT90CAN128.Digital_IO.Clear_Pin(u8Pin);
         end if;
      else
         null;
      end if;
   end;

end;
