
--  This tests IMU firmware code by communicating with the imu via comport.
--  This file in particular is a modified copy of that one in the ins_controller project.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-02

--  TODO: Hardware testing done successfully.

with UartWrapper;
with Ada.Text_IO;

package body Ins_Controller_Utils is

   wrapper : UartWrapper.pCUartHandler;

   procedure Init is

      sTemp : String(1..1000);
      iRet : Integer;
      iCharsTotal : Integer := 0;

   begin
      wrapper := UartWrapper.pxCreate("/dev/ttyUSB0", UartWrapper.B115200, 0.0, 1000, 0);

      Communication_Protocol_Control;
      Async_Data_Output_Type_Register_Off;
      Async_Data_Output_Frequency_Register;

      Synchronization_Control;
      VPE_Basic_Control;

      Ada.Text_IO.Put_Line("Flushes buffer");
      wrapper.UartRead(sTemp, iRet);

      Async_Data_Output_Type_Register;

      Serial_Baud_Rate_Register;




--        Ada.Text_IO.Put_Line("Done");
--        Ada.Text_IO.New_Line;


--        wrapper := UartWrapper.pxCreate("/dev/ttyUSB0", UartWrapper.B9600, 0.0, 1000, 0);


   --   Async_Data_Output_Frequency_Register;
--        Synchronization_Control;
--        VPE_Basic_Control;
--        Async_Data_Output_Type_Register;


--        Ada.Text_IO.Put_Line("Starts flushing inbuffer");
--        Ada.Text_IO.New_Line;

      -- reads everything that might be in the buffer to make sure the next message is what we want:
    --  wrapper.UartRead(sTemp, iRet);

--        Ada.Text_IO.Put_Line("Done");
--        Ada.Text_IO.New_Line;

      wrapper := UartWrapper.pxCreate("/dev/ttyUSB0", UartWrapper.B9600, 2.0, 1000, 1);
      Ada.Text_IO.Put_Line("Baudrate changed");
   end Init;


   pragma Suppress (All_Checks);

   procedure Write(sData : String; iSize : Integer) is
   begin
      wrapper.Uart_Write(sData, iSize, false);
   end Write;

   procedure Read(sData : out String; iSize : Integer; iCharsRead : out Integer) is
   begin
      wrapper.UartReadSpecificAmount(sData, iSize, iCharsRead);
   end Read;

   procedure Send_Command(sCommand : String) is
   begin
      Write("$" & sCommand & "*" & Character'Val(10), sCommand'Length + 3);
      delay(0.8);
   end Send_Command;


   procedure Communication_Protocol_Control is
   begin
      -- 7.31 Communication Protocol Control:
      -- SerialCount = off
      -- SerialStatus  = off
      -- SPICount = off
      -- SerialChecksum = 0 (off)
      -- spi checksum = off
      --ErrorMode = off
      --    Send_Command("VNWRG,30,0,0,0,0,0,0,1", port);
      Write("$VNWRG,30,0,0,0,0,0,0,1*68" & Character'Val(10), 27);
      delay(0.2);
   end Communication_Protocol_Control;

   procedure Async_Data_Output_Type_Register_Off is
   begin
      --Async Data Output Type Register
      --  Asynchronous output turned off
      Send_Command("VNWRG,06,0");
   end Async_Data_Output_Type_Register_Off;

   procedure Serial_Baud_Rate_Register is
   begin
      -- set Baud rate:
--        Send_Command("VNWRG,05,9600");
      Send_Command("VNWRG,05,115200");

     -- Write("$VNWRG,05,9600*" & Character'Val(10), 16);

   end Serial_Baud_Rate_Register;

   procedure Async_Data_Output_Frequency_Register is
   begin
      --Async Data Output Frequency Register
      Send_Command("VNWRG,07,1");
   end Async_Data_Output_Frequency_Register;

   procedure Synchronization_Control is
   begin
      -- SyncInMode = COUNT  (not used, irrelevant)
      --SyncInEdge = 0 rising edge (not used, irrelevant)
      --SyncInSkipFactor = 1 (not used, irrelevant)
      --RESERVED
      --Set SyncOutMode to AHRS = "Trigger when attitude measurements are available"
      --Set SyncOutPolarity to IMU = Positive pulse
      --SyncOutSkipFactor = 1
      --
      Send_Command("VNWRG,32,3,0,1,0,3,1,1,500000,0");
   end Synchronization_Control;


   procedure VPE_Basic_Control is
   begin
      -- Enable the Vector Processing Engine (VPE).
      -- Indoor Heading
      -- Filtering Mode off
      -- Tuning Mode off
      Send_Command("VNWRG,35,1,2,1,1");
   end VPE_Basic_Control;

   procedure Async_Data_Output_Type_Register is
   begin
      --Async Data Output Type Register

      --Asynchronous output: Yaw, Pitch, Roll, Body True Acceleration, and Angular Rates
      Send_Command("VNWRG,06,16");

      -- Asynchronous output turned off
--        Send_Command("VNWRG,06,0", port);
   end Async_Data_Output_Type_Register;

   procedure Start_Message(sMsgStr : String) is
      sTemp : String(1..sMsgStr'Length);
      iCharsTotal : Integer;
      iRet : Integer;
      sRead : String(1..sMsgStr'Length);
   begin
      sTemp(1) := ' ';

      loop
         Ada.Text_IO.Put_Line("Goes to the start of the message.");
         Ada.Text_IO.New_Line;

         --goes to the start of the message:
         while sTemp(1) /= '$' loop
            Read(sTemp, 1, iRet);
            Ada.Text_IO.Put(sTemp(1));
         end loop;

         Ada.Text_IO.Put_Line("Done. Reading the '" & sMsgStr & "'");

         -- read the "VNYBA,":
         iCharsTotal := 0;

         while iCharsTotal < sMsgStr'Length loop
            Read(sTemp, 6 - iCharsTotal, iRet);

            for i in 1..iRet loop
               sRead(i + iCharsTotal) := sTemp(i);
            end loop;

            iCharsTotal := iCharsTotal + iRet;
         end loop;

         Ada.Text_IO.Put_Line("Has read " & sRead);
         Ada.Text_IO.New_Line;

         exit when sRead = sMsgStr;

      end loop;
   end Start_Message;

end Ins_Controller_Utils;
