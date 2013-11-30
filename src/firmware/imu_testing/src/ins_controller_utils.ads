
--  This tests IMU firmware code by communicating with the imu via comport.
--  This file in particular is a modified copy of that one in the ins_controller project.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-28

--  TODO: Hardware testing....


package Ins_Controller_Utils is

   procedure Write(sData : String; iSize : Integer);
   procedure Read(sData : out String; iSize : Integer; iCharsRead : out Integer);
   procedure Send_Command(sCommand : String);
   procedure Init;
   procedure Communication_Protocol_Control;
   procedure Async_Data_Output_Frequency_Register;
   procedure Synchronization_Control;
   procedure VPE_Basic_Control;
   procedure Async_Data_Output_Type_Register;

end Ins_Controller_Utils;
