
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2014-01-07

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

   -- This function might need to be calibrated
   function u16Convert(u16In : Interfaces.Unsigned_16) return Interfaces.Unsigned_16 is
      HALF_VOLT : constant Interfaces.Unsigned_16 := 102; -- equals 0.5 Volts
      PRESSURE_RANGE : constant Interfaces.Unsigned_16 := 3000; --milibars
      ADC_RANGE : constant Interfaces.Unsigned_16 := 1024;

      fValue : float := float(PRESSURE_RANGE) * float(u16In) / float(ADC_RANGE);
   begin
      return  Interfaces.Unsigned_16(fValue);
   end u16Convert;

end Pressure_Sensor;
