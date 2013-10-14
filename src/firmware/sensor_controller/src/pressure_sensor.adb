
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-10

with ADC;
with AVR.AT90CAN128;

package body Pressure_Sensor is

   pragma Suppress (All_Checks);

   u8ChannelPin : Interfaces.Unsigned_8;

   procedure Init(u8Pin : Interfaces.Unsigned_8) is
      selection : ADC.TChannelSelection := (false, false, false, false, false, false, false, false);
   begin
      u8ChannelPin := u8Pin;
      selection(Integer(u8ChannelPin)) := True;

      ADC.ADC_Init(selection);
   end Init;


   function u16GetPressure return Interfaces.Unsigned_16 is
   begin
      return ADC.Get (AVR.AT90CAN128.Channel_Type (u8ChannelPin));
   end u16GetPressure;

end Pressure_Sensor;
