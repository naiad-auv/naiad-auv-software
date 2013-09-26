
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-25

with AVR.AT90CAN128;
--use  AVR.AT90CAN128;

package body Pressure_Sensor is

   function u16GetPressure(u8Pin : Unsigned_8) return Unsigned_16 is
      u16ADCValue : Unsigned_16;
      u16Pressure : Unsigned_16;
   begin
      u16ADCValue := ADC.Get(AVR.AT90CAN128.Channel_type(u8Pin));

      -- conversion:
      u16Pressure := u16ADCValue;
      return u16Pressure;
   end u16GetPressure;

end Pressure_Sensor;
