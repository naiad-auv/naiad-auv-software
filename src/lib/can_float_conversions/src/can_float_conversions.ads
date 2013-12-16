
---------------------------------------------------------------------------
-- This code implements functions to put INS-data (float values) into can messages.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-16

-- All angles are expressed in degrees.
--------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with Interfaces;

with Can_Defs;

package Can_Float_Conversions is

--     pragma Suppress(All_Checks);

   fACCELERATION_MAX 		: float := 20.0; --acceleration in m/s^2

    --all 8 bytes of b8Message need to be sent
   procedure Orientation_To_Message(fYaw : float; fPitch : float; fRoll : float; b8Message : out Can_Defs.Byte8);
   procedure Message_To_Orientation(fYaw : out float; fPitch : out float; fRoll : out float; b8Message : Can_Defs.Byte8);

   --all 8 bytes of b8Message need to be sent
   procedure Acceleration_To_Message(fAccX : float; fAccY : float; fAccZ : float;
                                     b8Message : out Can_Defs.Byte8;
                                     fAccelerationMax : float := fACCELERATION_MAX);
   procedure Message_To_Acceleration(fAccX : out float; fAccY : out float; fAccZ : out float;
                                     b8Message : Can_Defs.Byte8;
                                     fAccelerationMax : float := fACCELERATION_MAX);

   --only the 3 first bytes of b8Message need to be sent
   procedure GyroReading_To_Message(fGyroReading : float; b8Message : out Can_Defs.Byte8);
   procedure Message_To_GyroReading(fGyroReading : out float; b8Message : Can_Defs.Byte8);


   --only the 7 first bytes of b8Message need to be sent
   procedure PID_Scalings_To_Message(u8ID :     Interfaces.Unsigned_8; fProportional : float;
                                     fIntegral : float;     fDerivative : float;
                                     fScaleRange : float; b8Message : out Can_Defs.Byte8);

   procedure Message_To_PID_Scalings(u8ID : out Interfaces.Unsigned_8; fProportional : out float;
                                     fIntegral : out float; fDerivative : out float;
                                     fScaleRange : float; b8Message :     Can_Defs.Byte8);

private

   fYAW_MAX 	: constant float := 180.0;
   fPITCH_MAX   : constant float := 90.0;
   fROLL_MAX 	: constant float := 180.0;


   fYAW_RESOLUTION   : constant float  := 2.0 * fYAW_MAX   / Float(2 ** 21);
   fPITCH_RESOLUTION : constant float  := 2.0 * fPITCH_MAX / Float(2 ** 21);
   fROLL_RESOLUTION  : constant float  := 2.0 * fROLL_MAX   / Float(2 ** 21);

   fGYRO_MAX 		: float := 180.0; --angle in degrees
   fGYRO_RESOLUTION 	: float := 2.0 * fGYRO_MAX / Float(2 ** 24);


   type Integer_21 is range -2 ** 20 .. 2 ** 20 - 1;
   for Integer_21'Size use  21;

   type TThree_i21s is
      record
         i21One   : Integer_21;
         i21Two   : Integer_21;
         i21Three : Integer_21;
         bPadding : Boolean;
      end record;

   for TThree_i21s use record
      i21One 	at 0 range 0  .. 20;
      i21Two 	at 0 range 21 .. 41;
      i21Three 	at 0 range 42 .. 62;
      bPadding 	at 0 range 63 .. 63;
   end record;
   for TThree_i21s'Size use 64;

   function b8Orientation_To_Message is new Ada.Unchecked_Conversion(TThree_i21s, Can_Defs.Byte8);
   function TMessage_To_Orientation  is new Ada.Unchecked_Conversion(Can_Defs.Byte8, TThree_i21s);

   type TPID_Scalings is
      record
         u8ID : Interfaces.Unsigned_8;
         i16P  : Interfaces.Integer_16;
         i16I  : Interfaces.Integer_16;
         i16D  : Interfaces.Integer_16;
      end record;

   for TPID_Scalings use record
      u8ID 	at 0 range 0  .. 7;
      i16P 	at 0 range 8  .. 23;
      i16I 	at 0 range 24 .. 39;
      i16D 	at 0 range 40 .. 55;
   end record;
   for TPID_Scalings'Size use 56;

   type TPID_ScalingsArray is array(1..7) of Interfaces.Unsigned_8;
   for TPID_ScalingsArray'Size use  56;

   function PID_Scalings_To_Array is new Ada.Unchecked_Conversion(TPID_Scalings, TPID_ScalingsArray);
   function Array_To_PID_Scalings is new Ada.Unchecked_Conversion(TPID_ScalingsArray, TPID_Scalings);

   type Integer_24 is range -2 ** 23 .. 2 ** 23 - 1;
   for Integer_24'Size use 24;

   type TGyroReadingArray is array(1..3) of Interfaces.Unsigned_8;
   for TGyroReadingArray'Size use  24;


   function i24To_Gyro_Reading  is new Ada.Unchecked_Conversion(Integer_24, TGyroReadingArray);
   function Gyro_Reading_To_i24 is new Ada.Unchecked_Conversion(TGyroReadingArray, Integer_24);

   function i21_Get_Integer(fValue : float; fResolution : float) return Integer_21;
   function i16_Get_Integer(fValue : float; fResolution : float) return Interfaces.Integer_16;
   function fMod(fValue : float; fRange : float) return float;


end Can_Float_Conversions;

