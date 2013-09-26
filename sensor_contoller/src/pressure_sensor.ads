

-- Pressure sensor
-- This code handles the U5100 Pressure sensor.
-- One ADC pin is used to measure the analog output from the sensor.
-- The value is then converted to a pressure value.

-- TODO: Write the conversion from ADC-value to a pressure value in u16GetPressure.
-- TODO: Test everything...

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-25


with Interfaces; 	use Interfaces;
with ADC; 		--use ADC;


package Pressure_Sensor is

   function u16GetPressure(u8Pin : Unsigned_8) return Unsigned_16;

end Pressure_Sensor;
