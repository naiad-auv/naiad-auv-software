
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-05

with ADC;
with AVR.AT90CAN128;

package body Pressure_Sensor is

   pragma Suppress (All_Checks);

   function u16GetPressure (u8Pin : Unsigned_8) return Unsigned_16 is
   begin
      return ADC.Get (AVR.AT90CAN128.Channel_Type (u8Pin));
   end u16GetPressure;

end Pressure_Sensor;
