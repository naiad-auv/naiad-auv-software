
---------------------------------------------------------------------------
-- This code implements functions to put INS-data (float values) into can messages.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-23

-- TODO: Unit testing
---------------------------------------------------------------------------

with Ada.Text_IO;

package body Can_Float_Conversions is

   pragma Suppress(All_Checks);


   procedure Orientation_To_Message(fYaw : float; fPitch : float; fRoll : float; b8Message : out AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data.i21Yaw   := i21_Get_Integer(fMod(fYaw, fYAW_MAX),   fYAW_RESOLUTION);
      Data.i21Pitch := i21_Get_Integer(fPitch, fPITCH_RESOLUTION);
      Data.i21Roll  := i21_Get_Integer(fMod(fRoll, fROLL_MAX),  fROLL_RESOLUTION);

      b8Message :=  b8Orientation_To_Message(Data);
   end Orientation_To_Message;

   procedure Message_To_Orientation(fYaw : out float; fPitch : out float; fRoll : out float; b8Message : AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      Data :=  TMessage_To_Orientation(b8Message);
      fYaw   := Float(Data.i21Yaw)   * fYAW_RESOLUTION;
      fPitch := Float(Data.i21Pitch) * fPITCH_RESOLUTION;
      fRoll  := Float(Data.i21Roll)  * fROLL_RESOLUTION;
   end Message_To_Orientation;


   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure Acceleration_To_Message(fAccX : float; fAccY : float; fAccZ : float; b8Message : out AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data.i21Yaw   := i21_Get_Integer(fAccX, fACCELERATION_RESOLUTION);
      Data.i21Pitch := i21_Get_Integer(fAccY, fACCELERATION_RESOLUTION);
      Data.i21Roll  := i21_Get_Integer(fAccZ, fACCELERATION_RESOLUTION);

      b8Message :=  b8Orientation_To_Message(Data);
   end Acceleration_To_Message;



   procedure Message_To_Acceleration(fAccX : out float; fAccY : out float; fAccZ : out float; b8Message : AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data  := TMessage_To_Orientation(b8Message);
      fAccX := Float(Data.i21Yaw)   * fACCELERATION_RESOLUTION;
      fAccY := Float(Data.i21Pitch) * fACCELERATION_RESOLUTION;
      fAccZ := Float(Data.i21Roll)  * fACCELERATION_RESOLUTION;
   end Message_To_Acceleration;

   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure GyroReading_To_Message(fGyroReading : float; b8Message : out AVR.AT90CAN128.CAN.Byte8) is

      function i24Get_Integer(fValue : float; fResolution : float) return Integer_24 is
         fInternal : float;
      begin
         fInternal := fValue / fResolution;
         return Integer_24(fMod(fInternal, Float(Integer_24'Last)));
      end i24Get_Integer;


      i24Reading : Integer_24;
      ReadingArr : TGyroReadingArray;
   begin

      i24Reading   := i24Get_Integer(fGyroReading, fGYRO_RESOLUTION);
      ReadingArr := i24To_Gyro_Reading(i24Reading);

      b8Message(1) := ReadingArr(1);
      b8Message(2) := ReadingArr(2);
      b8Message(3) := ReadingArr(3);
   end GyroReading_To_Message;


   procedure Message_To_GyroReading(fGyroReading : out float; b8Message : AVR.AT90CAN128.CAN.Byte8) is
      i24Reading : Integer_24;
      ReadingArr : TGyroReadingArray;
   begin
      ReadingArr(1) := b8Message(1);
      ReadingArr(2) := b8Message(2);
      ReadingArr(3) := b8Message(3);

      i24Reading := Gyro_Reading_To_i24(ReadingArr);

      fGyroReading := Float(i24Reading) * fGYRO_RESOLUTION;
   end Message_To_GyroReading;

   function i21_Get_Integer(fValue : float; fResolution : float) return Integer_21 is
      fInternal : float;
   begin
      fInternal := fValue / fResolution;

      if fInternal >= Float(Integer_21'Last) then
         return Integer_21'Last;
      elsif fInternal <= Float(Integer_21'First) then
         return Integer_21'First;
      else
         return Integer_21(fInternal);
      end if;
   end i21_Get_Integer;

   function fMod(fValue : float; fRange : float) return float is
   begin
      if fValue >= fRange then
         return fMod(fValue - 2.0 * fRange, fRange);
      elsif  fValue <= -fRange then
         return fMod(fValue + 2.0 * fRange, fRange);
      end if;
      return  fValue;
   end fMod;

end Can_Float_Conversions;

