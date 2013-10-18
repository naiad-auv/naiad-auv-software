

-- This code handles the analog Temp sensor.

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-17
-- TODO: Test everything on hardware

with Interfaces;

package Temp_Sensor is

   procedure Init(u8Pin : Interfaces.Unsigned_8);

   --returns the temperature in its original Integer_16 format
   function i16Get_Temp_Int return Interfaces.Integer_16;

   procedure i16ToStr(i16Temperature : Interfaces.Integer_16; sRet : out String);

private
   function i16Convert(u16In : Interfaces.Unsigned_16) return Interfaces.Integer_16;

end Temp_Sensor;
