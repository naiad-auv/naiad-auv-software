--------------------------------------------------------------------------
--  This tests IMU firmware code by communicating with the imu via comport.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--------------------------------------------------------------------------


--pragma Profile (Ravenscar);

with Ada.Text_IO;
with Interfaces;		use Interfaces;
with Ins_Controller_Utils;
with Str2Float;


procedure Imu_Testing_Main is

   pragma Suppress (All_Checks);

   procedure Start_Message is
      sBuffer : String(1..2);
      sTempString : String(1..100);

      iTemp : Integer;
      iCharsTotal : Integer := 0;
      iCharsRead : Integer := 0;
   begin
      sBuffer(1) := ' ';

      --goes to the start of the message:
      while sBuffer(1) /= '$' loop
         Ins_Controller_Utils.Read(sBuffer, 1, iTemp);
      end loop;

      -- read the "VNYBA,":
      while iCharsTotal < 6 loop
         Ins_Controller_Utils.Read(sTempString, 6 - iCharsTotal, iCharsRead);

         --              for i in 1..iCharsRead loop
         --                 sBuffer(iCharsTotal + i) := sTempString(i);
         --              end loop;

         iCharsTotal := iCharsTotal + iCharsRead;
      end loop;
   end Start_Message;

   --this function assumes the format +1235.156
   function Read_Next_Float return float is
      sTemp : String(1..1);
      iCharsRead : Integer;
      sBuffer : String(1..20);
      i : Integer := 0;
   begin
      loop
         Ins_Controller_Utils.Read(sTemp, 1, iCharsRead);

         if iCharsRead = 1 then
            exit when sTemp(1) = ',' or sTemp(1) = '*';

            i := i + 1;
            sBuffer(i) := sTemp(1);
         end if;
      end loop;

      declare
         sValue : String(1..i);
      begin
         for j in sValue'Range loop
            sValue(j) := sBuffer(j);
         end loop;

         return Str2Float.fStr2Float(sValue); --this function assumes the format +1235.156
      end;
   end Read_Next_Float;

   fYaw, fPitch, fRoll : float;
   fXAcceleration : float := 0.0;
   fYAcceleration : float := 0.0;
   fZAcceleration : float := 0.0;
begin
   
   Ada.Text_IO.Put_Line("Starting...");
   Ada.Text_IO.New_Line;

  Ins_Controller_Utils.Init;
--$VNRRG,07,

   
   loop
      Start_Message;
      
      fYaw 	:= Read_Next_Float;
      fPitch 	:= Read_Next_Float;
      fRoll 	:= Read_Next_Float;
      fXAcceleration := Read_Next_Float;
      fYAcceleration := Read_Next_Float;
      fZAcceleration := Read_Next_Float;
      
      Ada.Text_IO.Put_Line("fYaw= " & fYaw'Img & "fPitch= " & fPitch'Img & "fRoll= " & fRoll'Img);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("fXAcceleration= " & fXAcceleration'Img & "fYAcceleration= " & fYAcceleration'Img & "fZAcceleration= " & fZAcceleration'Img);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.New_Line;

      delay(0.001);
   end loop;
end Imu_Testing_Main;

