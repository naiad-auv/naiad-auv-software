
-- This file contains functions for ins_controller in order to reduce its number of lines of code.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-02

--  TODO: Hardware testing....

with AVR.AT90CAN128.INTERRUPT;
with AVR.AT90CAN128.CLOCK;

package body Ins_Controller_Utils is

   pragma Suppress (All_Checks);

   procedure Write(sData : String; iSize : Integer; port : AVR.AT90CAN128.USART.USARTID) is
      iTemp : Integer;
   begin
      iTemp := AVR.AT90CAN128.USART.Write(Buffer => sData,Port => port, Size => iSize);
   end Write;

   procedure Read(sData : out String; iSize : Integer; iCharsRead : out Integer; port : AVR.AT90CAN128.USART.USARTID) is
   begin
      AVR.AT90CAN128.USART.Read(sData, port, iSize, iCharsRead);
   end Read;

--     procedure sChecksum(sData : String; iSize : Integer; sStr : out String) is
--        u8Xor : Interfaces.Unsigned_8 := 0;
--        use Interfaces;
--     begin
--        for i in 1..iSize loop
--           u8Xor := u8Xor xor Interfaces.Unsigned_8(Character'Pos(sData(i)));
--        end loop;
--        sStr(1) := Character'Val(Integer(u8Xor));
--     end sChecksum;

   procedure Send_Command(sCommand : String; port : AVR.AT90CAN128.USART.USARTID) is
      --sCheckSumStr : String(1..1);
   begin
    --  sChecksum(sCommand, sCommand'Length, sCheckSumStr);
    --  Write("$" & sCommand & "*" & sCheckSumStr & Character'Val(10), sCommand'Length + 3, port);
      Write("$" & sCommand & "*" & Character'Val(10), sCommand'Length + 3, port);
      AVR.AT90CAN128.CLOCK.Delay_ms(40);
   end Send_Command;

   procedure Init_Uart(port : AVR.AT90CAN128.USART.USARTID; baud_rate :  AVR.AT90CAN128.USART.BAUDTYPE) is
   begin
      AVR.AT90CAN128.USART.Init(port, baud_rate);
   end Init_Uart;

   procedure Init_Interrupts is
   begin
      AVR.AT90CAN128.DDRD.Bit_2 := False;
      AVR.AT90CAN128.INTERRUPT.disableInterrupt;

      AVR.AT90CAN128.EIMSK := (others => False);

      AVR.AT90CAN128.EICRA.Bit_5 := False;
      AVR.AT90CAN128.EICRA.Bit_4 := True;

      AVR.AT90CAN128.EIFR := (others => False);
      AVR.AT90CAN128.EIMSK.Bit_2 := True;
      AVR.AT90CAN128.INTERRUPT.enableInterrupt;

   end Init_Interrupts;

   procedure Communication_Protocol_Control(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      -- 7.31 Communication Protocol Control:
      -- SerialCount = off
      -- SerialStatus  = off
      -- SPICount = off
      -- SerialChecksum = 0 (off)
      -- spi checksum = off
      --ErrorMode = off
      --    Send_Command("VNWRG,30,0,0,0,0,0,0,1", port);
      Write("$VNWRG,30,0,0,0,0,0,0,1*68" & Character'Val(10), 27, port);

      AVR.AT90CAN128.CLOCK.Delay_ms(20);
   end Communication_Protocol_Control;

   procedure Async_Data_Output_Type_Register_Off(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      --Async Data Output Type Register
      --  Asynchronous output turned off
      Send_Command("VNWRG,06,0", port);
   end Async_Data_Output_Type_Register_Off;

   procedure Async_Data_Output_Frequency_Register(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      --Async Data Output Frequency Register
      Send_Command("VNWRG,07,200", port);
   end Async_Data_Output_Frequency_Register;

   procedure Synchronization_Control(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      -- SyncInMode = COUNT  (not used, irrelevant)
      --SyncInEdge = 0 rising edge (not used, irrelevant)
      --SyncInSkipFactor = 1 (not used, irrelevant)
      --RESERVED
      --Set SyncOutMode to AHRS = "Trigger when attitude measurements are available"
      --Set SyncOutPolarity to IMU = Positive pulse
      --SyncOutSkipFactor = 1
      -- Async Data Output Frequency = 200 Hz
      Send_Command("VNWRG,32,3,0,1,0,3,1,1,500000,0", port);
   end Synchronization_Control;

   procedure Serial_Baud_Rate_Register(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      -- set Baud rate:
      Send_Command("VNWRG,05,230400", port);
   end Serial_Baud_Rate_Register;


   procedure VPE_Basic_Control(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      -- Enable the Vector Processing Engine (VPE).
      -- Indoor Heading
      -- Filtering Mode off
      -- Tuning Mode off
      Send_Command("VNWRG,35,1,2,1,1", port);
   end VPE_Basic_Control;

   procedure Async_Data_Output_Type_Register(port : AVR.AT90CAN128.USART.USARTID) is
   begin
      --Async Data Output Type Register

      --Asynchronous output: Yaw, Pitch, Roll, Body True Acceleration, and Angular Rates
      Send_Command("VNWRG,06,16", port);

      -- Asynchronous output turned off
--        Send_Command("VNWRG,06,0", port);
   end Async_Data_Output_Type_Register;

   procedure Start_Message(sMsgStr : String; port : AVR.AT90CAN128.USART.USARTID) is
      sTemp : String(1..sMsgStr'Length);
      iCharsTotal : Integer;
      iRet : Integer;
      sRead : String(1..sMsgStr'Length);
   begin
      sTemp(1) := ' ';

      loop

         --goes to the start of the message:
         while sTemp(1) /= '$' loop
            Read(sTemp, 1, iRet, port);
         end loop;

         -- read the "VNYBA,":
         iCharsTotal := 0;

         while iCharsTotal < sMsgStr'Length loop
            Read(sTemp, 6 - iCharsTotal, iRet, port);

            for i in 1..iRet loop
               sRead(i + iCharsTotal) := sTemp(i);
            end loop;

            iCharsTotal := iCharsTotal + iRet;
         end loop;

         exit when sRead = sMsgStr;

      end loop;
   end Start_Message;

end Ins_Controller_Utils;
