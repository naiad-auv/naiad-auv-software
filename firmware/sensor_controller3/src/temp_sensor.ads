

-- DS18B20 Temp sensor
-- This code handles the 1-Wire communication with the DS18B20 Temp sensor.
-- The code assumes only one sensor is attached to the communication line.
-- The line can be attached to any of the pins on PortA.
-- The code sets the temperature sensor to 10 bits resolution.

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-10-05

-- TODO: The wait_us function needs to be changed so that it waits the correct amount of time
-- TODO: In the i16GetTempInt function: Right now the code does not care whether the sensor responded with a
-- presence pulse or not, this should be changed so that an error is reported if the sensor failed to respond.
-- TODO: In the i16GetTempInt function: The checksum is currently not tested.
-- TODO: Test everything...


pragma Suppress (All_Checks);

with Interfaces;
use Interfaces;

package Temp_Sensor is

   procedure Init(u8Pin : Interfaces.Unsigned_8);

   --returns the temperature in its original Integer_16 format
   function i16Get_Temp_Int(u8Pin : Interfaces.Unsigned_8) return Interfaces.Integer_16;

   function i16ToStr(iTemp : Interfaces.Integer_16) return String;


   --returns the temperature as a string on the form SXXX.X, S being the sign (+/-)
   -- for example +023.4 meaning 23.4 degrees Celsius
   --as well as a 16 bit integer of equalling 16 times the temperature in Celsius
--   procedure sGet_Temp_Str(u8Pin : Interfaces.Unsigned_8; i16Temperature : out Interfaces.Integer_16; sTemperature : out String);

private

   function i16From_Bytes(u8LowByte : Interfaces.Unsigned_8;
                          u8HighByte : Interfaces.Unsigned_8)
                       return Interfaces.Integer_16;

   --sends the reset pulse, returns true if a sensor responded, false if not
   function bReset_Pulse(u8Pin : Interfaces.Unsigned_8) return Boolean;

   procedure Write_Byte(u8Value : Interfaces.Unsigned_8; u8Pin : Interfaces.Unsigned_8);

   function u8Read_Byte(u8Pin : Interfaces.Unsigned_8) return Interfaces.Unsigned_8;

   procedure Wait_Us(u1Time : Interfaces.Unsigned_16); --busy waits for time micro seconds


end Temp_Sensor;
