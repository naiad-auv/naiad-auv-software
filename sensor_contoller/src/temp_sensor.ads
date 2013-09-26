
-- DS18B20 Temp sensor
-- This code handles the 1-Wire communication with the DS18B20 Temp sensor.
-- The code assumes only one sensor is attached to the communication line.
-- The line can be attached to any of the pins on PortA.

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-26

-- TODO: The wait_us function needs to be changed so that it waits the correct amount of time
-- TODO: In the i16GetTempInt function: Right now the code does not care whether the sensor responded with a
-- presence pulse or not, this should be canged so that an error is reported if the sensor failed to respond.
-- TODO: In the i16GetTempInt function: The checksum is currently not tested.
-- TODO: Test everything...



with Interfaces;
use Interfaces;

with AVR.AT90CAN128;
--use  AVR.AT90CAN128;

with AVR.AT90CAN128.Calendar;
--use AVR.AT90CAN128.Calendar;

with Digital_IO;
--use Digital_IO;

package Temp_Sensor is

   --returns the temperature in its original Integer_16 format
   function i16GetTempInt(u8Pin : Interfaces.Unsigned_8) return Interfaces.Integer_16;


   --returns the temperature as a string on the form SXXX.X, S being the sign (+/-)
   -- for example +023.4 meaning 23.4 degrees Celsius
   --as well as a 16 bit integer of equalling 16 times the temperature in Celsius
   procedure sGetTempStr(u8Pin : Interfaces.Unsigned_8; i16Temperature : out Interfaces.Integer_16; sTemperature : out String);

private


   --sends the reset pulse, returns true if a sensor responded, false if not
   function bReset_Pulse(u8Pin : Interfaces.Unsigned_8) return Boolean;

   procedure Write_Byte(u8Value : Interfaces.Unsigned_8; u8Pin : Interfaces.Unsigned_8);

   function u8Read_Byte(u8Pin : Interfaces.Unsigned_8) return Interfaces.Unsigned_8;

   procedure Wait_Us(u1Time : Interfaces.Unsigned_16); --busy waits for time micro seconds


end Temp_Sensor;
