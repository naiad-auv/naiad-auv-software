
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
      fYawInternal 	: float := Float'Max(Float'Min(fYaw,   fYAW_MAX),   -fYAW_MAX);
      fPitchInternal 	: float := Float'Max(Float'Min(fPitch, fPITCH_MAX), -fPITCH_MAX);
      fRollInternal 	: float := Float'Max(Float'Min(fRoll,  fROLL_MAX),  -fROLL_MAX);
   begin

      Data.i21Yaw   := Integer_21(fYawInternal   / fYAW_RESOLUTION);
      Data.i21Pitch := Integer_21(fPitchInternal / fPITCH_RESOLUTION);
      Data.i21Roll  := Integer_21(fRollInternal  / fROLL_RESOLUTION);

      b8Message :=  b8OrientationToMessage(Data);
   end Orientation_To_Message;

   procedure Message_To_Orientation(fYaw : out float; fPitch : out float; fRoll : out float; b8Message : AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      Data :=  TMessageToOrientation(b8Message);
      fYaw   := Float(Data.i21Yaw)   * fYAW_RESOLUTION;
      fPitch := Float(Data.i21Pitch) * fPITCH_RESOLUTION;
      fRoll  := Float(Data.i21Roll)  * fROLL_RESOLUTION;
   end Message_To_Orientation;


   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure Acceleration_To_Message(fAccX : float; fAccY : float; fAccZ : float; b8Message : out AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;

      fAccXInternal 	: float := Float'Max(Float'Min(fAccX, fACCELERATION_MAX - 1.0E-05), -fACCELERATION_MAX); -- if these lines are doing anything to the values, then the robot is doing things it shouldn't be doing (crashing into stuff etc...)
      fAccYInternal 	: float := Float'Max(Float'Min(fAccY, fACCELERATION_MAX - 1.0E-05), -fACCELERATION_MAX);
      fAccZInternal 	: float := Float'Max(Float'Min(fAccZ, fACCELERATION_MAX - 1.0E-05), -fACCELERATION_MAX);

      fTemp : float;
   begin

      Ada.Text_IO.Put_Line("fAccYInternal=" & fAccYInternal'Img);
      Ada.Text_IO.Put_Line("fACCELERATION_RESOLUTION=" & fACCELERATION_RESOLUTION'Img);

      fTemp := fAccYInternal / fACCELERATION_RESOLUTION;
      Ada.Text_IO.Put_Line("fAccYInternal / fACCELERATION_RESOLUTION=" &fTemp'Img);

      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
--        Data.i21Yaw   := Integer_21(fAccXInternal / fACCELERATION_RESOLUTION);
--        Data.i21Pitch := Integer_21(fAccYInternal / fACCELERATION_RESOLUTION);
--        Data.i21Roll  := Integer_21(fAccZInternal / fACCELERATION_RESOLUTION);

      Data.i21Yaw   := Integer_21(Float'Min(fAccXInternal / fACCELERATION_RESOLUTION, fACCELERATION_MAX - 2.0E-04));
      Data.i21Pitch := Integer_21(Float'Min(fAccYInternal / fACCELERATION_RESOLUTION, fACCELERATION_MAX - 2.0E-04));
      Data.i21Roll  := Integer_21(Float'Min(fAccZInternal / fACCELERATION_RESOLUTION, fACCELERATION_MAX - 2.0E-04));

      b8Message :=  b8OrientationToMessage(Data);

      Ada.Text_IO.Put_Line("Data.i21Pitch=" & Data.i21Pitch'Img);
      Ada.Text_IO.Put_Line("Integer_21'Last=" & Integer_21'Last'img);

      fTemp := Float'Min(fAccXInternal / fACCELERATION_RESOLUTION, fACCELERATION_MAX - 2.0E-04);

      Ada.Text_IO.Put_Line("fTemp=" & fTemp'Img);

   end Acceleration_To_Message;



   procedure Message_To_Acceleration(fAccX : out float; fAccY : out float; fAccZ : out float; b8Message : AVR.AT90CAN128.CAN.Byte8) is
      Data : TOrientation;
   begin
      -- We are using the same conversion technique as for orientation simply
      -- because there is no need to do differently...
      Data  := TMessageToOrientation(b8Message);
      fAccX := Float(Data.i21Yaw)   * fACCELERATION_RESOLUTION;
      fAccY := Float(Data.i21Pitch) * fACCELERATION_RESOLUTION;
      fAccZ := Float(Data.i21Roll)  * fACCELERATION_RESOLUTION;
   end Message_To_Acceleration;

   -----------------------------------------------------------------------------------------------------------------------------------------------------------

   procedure GyroReading_To_Message(fGyroReading : float; b8Message : out AVR.AT90CAN128.CAN.Byte8) is
      i24Reading : Integer_24;
      ReadingArr : TGyroReadingArray;
      fReading 	: float := Float'Max(Float'Min(fGyroReading, fGYRO_MAX), -fGYRO_MAX); --something is wrong if this value is needed...
   begin

      i24Reading   := Integer_24(fReading / fGYRO_RESOLUTION);
      ReadingArr := i24ToGyroReading(i24Reading);

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

      i24Reading := GyroReadingToi24(ReadingArr);

      fGyroReading := Float(i24Reading) * fGYRO_RESOLUTION;
   end Message_To_GyroReading;

end Can_Float_Conversions;

