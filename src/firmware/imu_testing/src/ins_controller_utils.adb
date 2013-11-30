
--  This tests IMU firmware code by communicating with the imu via comport.
--  This file in particular is a modified copy of that one in the ins_controller project.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--  TODO: Hardware testing....

with UartWrapper;


package body Ins_Controller_Utils is

   wrapper : UartWrapper.pCUartHandler;

   procedure Init is
   begin
      wrapper := UartWrapper.pxCreate("dev/ttyACM1", UartWrapper.B115200, 2.0, 1000, 1);

      Communication_Protocol_Control;
      Async_Data_Output_Frequency_Register;
      Synchronization_Control;
      VPE_Basic_Control;
      Async_Data_Output_Type_Register;
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
      Write("$" & sCommand & "*" & Character'Val(10), sCommand'Length + 2);
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
        Write("$VNWRG,30,0,0,0,0,0,0,1*68", 26);
   end Communication_Protocol_Control;

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
      Send_Command("VNWRG,35,1,2,0,0");
   end VPE_Basic_Control;

   procedure Async_Data_Output_Type_Register is
   begin
      --Async Data Output Type Register

      --Asynchronous output: Yaw, Pitch, Roll, Body True Acceleration, and Angular Rates
      Send_Command("VNWRG,06,16");

      -- Asynchronous output turned off
--        Send_Command("VNWRG,06,0", port);
   end Async_Data_Output_Type_Register;
end Ins_Controller_Utils;
