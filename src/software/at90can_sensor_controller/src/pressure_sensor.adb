
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-17

with AVR.AT90CAN128.ADC;
with AVR.AT90CAN128;

package body Pressure_Sensor is

   pragma Suppress (All_Checks);

   u8ChannelPin : Interfaces.Unsigned_8;

   procedure Init(u8Pin : Interfaces.Unsigned_8) is
   begin
      u8ChannelPin := u8Pin;
      AVR.AT90CAN128.ADC.ADC_Init(u8Pin);
   end Init;


   function u16GetPressure return Interfaces.Unsigned_16 is
   begin
      return u16Convert(AVR.AT90CAN128.ADC.Get (AVR.AT90CAN128.Channel_Type (u8ChannelPin)));
   end u16GetPressure;

   function u16Convert(u16In : Interfaces.Unsigned_16) return Interfaces.Unsigned_16 is
   begin
      -- return u16In;
      return 0;
   end u16Convert;

end Pressure_Sensor;
