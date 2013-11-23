
---------------------------------------------------------------------------
-- This code implements functions to put INS-data (float values) into can messages.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-23

-- TODO: Unit testing
--------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Interfaces;

with AVR.AT90CAN128.CAN;

package Can_Float_Conversions is

    --all 8 bytes of b8Message need to be sent
   procedure Orientation_To_Message(fYaw : float; fPitch : float; fRoll : float; b8Message : out AVR.AT90CAN128.CAN.Byte8);
   procedure Message_To_Orientation(fYaw : out float; fPitch : out float; fRoll : out float; b8Message : AVR.AT90CAN128.CAN.Byte8);

   --all 8 bytes of b8Message need to be sent
   procedure Acceleration_To_Message(fAccX : float; fAccY : float; fAccZ : float; b8Message : out AVR.AT90CAN128.CAN.Byte8);
   procedure Message_To_Acceleration(fAccX : out float; fAccY : out float; fAccZ : out float; b8Message : AVR.AT90CAN128.CAN.Byte8);

   --only the 3 first bytes of b8Message need to be sent
   procedure GyroReading_To_Message(fGyroReading : float; b8Message : out AVR.AT90CAN128.CAN.Byte8);
   procedure Message_To_GyroReading(fGyroReading : out float; b8Message : AVR.AT90CAN128.CAN.Byte8);

private

   fYAW_MAX 	: constant float := 180.0;
   fPITCH_MAX   : constant float := 90.0;
   fROLL_MAX 	: constant float := 180.0;

   fYAW_RESOLUTION   : constant float  := 2.0 * fYAW_MAX   / Float(2 ** 21);  --angles in degrees
   fPITCH_RESOLUTION : constant float  := 2.0 * fPITCH_MAX / Float(2 ** 21);
   fROLL_RESOLUTION  : constant float  := 2.0 * fROLL_MAX   / Float(2 ** 21);

   fACCELERATION_MAX 		: float := 20.0; --acceleration in m/s^2
   fACCELERATION_RESOLUTION 	: float := 2.0 * fACCELERATION_MAX / Float(2 ** 21);

   fGYRO_MAX 		: float := 180.0; --angle in degrees
   fGYRO_RESOLUTION 	: float := 2.0 * fGYRO_MAX / Float(2 ** 24);


   type Integer_21 is range -2 ** 20 .. 2 ** 20 - 1;
   for Integer_21'Size use  21;

   type TOrientation is
      record
         i21Yaw   : Integer_21;
         i21Pitch : Integer_21;
         i21Roll  : Integer_21;
         bPadding : Boolean;
      end record;

   for TOrientation use record
      i21Yaw 	at 0 range 0  .. 20;
      i21Pitch 	at 0 range 21 .. 41;
      i21Roll 	at 0 range 42 .. 62;
      bPadding 	at 0 range 63 .. 63;
   end record;
   for TOrientation'Size use 64;

   function b8OrientationToMessage is new Ada.Unchecked_Conversion(TOrientation, AVR.AT90CAN128.CAN.Byte8);
   function TMessageToOrientation is new Ada.Unchecked_Conversion(AVR.AT90CAN128.CAN.Byte8, TOrientation);

   type Integer_24 is range -2 ** 23 .. 2 ** 23 - 1;
   for Integer_24'Size use 24;

   type TGyroReadingArray is array(1..3) of Interfaces.Unsigned_8;
   for TGyroReadingArray'Size use  24;


   function i24ToGyroReading is new Ada.Unchecked_Conversion(Integer_24, TGyroReadingArray);
   function GyroReadingToi24 is new Ada.Unchecked_Conversion(TGyroReadingArray, Integer_24);


end Can_Float_Conversions;
