

--  Pressure sensor
--  This code handles the U5100 Pressure sensor.
--  One ADC pin is used to measure the analog output from the sensor.
--  The value is then converted to a pressure value.

--  TODO: Write the conversion from ADC-value to a pressure value in u16GetPressure.
--  Right now the value 0 is simply returned
--  TODO: Test everything...

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-10-17


with Interfaces;



package Pressure_Sensor is

   procedure Init(u8Pin : Interfaces.Unsigned_8);

   function u16GetPressure return Interfaces.Unsigned_16;

private
   function u16Convert(u16In : Interfaces.Unsigned_16) return Interfaces.Unsigned_16;

end Pressure_Sensor;
