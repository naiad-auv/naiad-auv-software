
-- This file contains functions for ins_controller in order to reduce its number of lines of code.

--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-06

--  TODO: Hardware testing....

with AVR.AT90CAN128.INTERRUPT;
with AVR.AT90CAN128.CLOCK;
with AVR.AT90CAN128.CAN;

with CAN_Defs;
with Interfaces;

package body AT90CAN_Ins_Controller_Utils is

   pragma Suppress (All_Checks);

   procedure Write(sData : String; iSize : Integer; port : AVR.AT90CAN128.USART.USARTID) is
      iTemp : Integer;
   begin
      while AVR.AT90CAN128.USART.Space_Available(port) < iSize loop
         null;
      end loop;

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
      sNewLine : String(1..2);
   begin
      sNewLine(1) := '*';
      sNewLine(2) := Character'Val(10);

      Write("$", 1, port);
      Write(sCommand, sCommand'Length, port);
      Write(sNewLine, 2, port);

      AVR.AT90CAN128.CLOCK.Delay_ms(100);
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
      sNewLine : String(1..1);
      sCommand : String(1..26) := "$VNWRG,30,0,0,0,0,0,0,1*68";
   begin
      sNewLine(1) := Character'Val(10);
      -- 7.31 Communication Protocol Control:
      -- SerialCount = off
      -- SerialStatus  = off
      -- SPICount = off
      -- SerialChecksum = 0 (off)
      -- spi checksum = off
      --ErrorMode = off
      Write(sCommand, 26, port);
      Write(sNewLine, 1, port);
      AVR.AT90CAN128.CLOCK.Delay_ms(100);
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
      Send_Command("VNWRG,07,1", port);
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
     -- Send_Command("VNWRG,05,9600", port);
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
   end Async_Data_Output_Type_Register;

   procedure Start_Message(sMsgStr : String; port : AVR.AT90CAN128.USART.USARTID) is
      sTemp : String(1..sMsgStr'Length);
      iCharsTotal : Integer;
      iRet : Integer;
      sRead : String(1..sMsgStr'Length);
      bExit : Boolean;

      tempMSG : CAN_Defs.CAN_Message;

   begin
      sTemp(1) := ' ';

      tempMSG.ID := (40, false);
      tempMSG.Len := 6;
      tempMSG.Data := (1, 1, 1, 1, 1, 1, 1, 1);
      AVR.AT90CAN128.CAN.Can_Send(tempMSG);

      loop

         --goes to the start of the message:
         while sTemp(1) /= '$' loop
            Read(sTemp, 1, iRet, port);
         end loop;

         tempMSG.ID := (411, false);
         tempMSG.Len := 1;
         tempMSG.Data(1) := 0;
         AVR.AT90CAN128.CAN.Can_Send(tempMSG);

         return;

         --           tempMSG.ID := (411, false);
--           tempMSG.Len := 8;
--
--          for i in 1..8 loop
--              Read(sTemp, 1, iRet, port);
--              tempMSG.Data(CAN_Defs.DLC_Type(i)) := Interfaces.Unsigned_8(iRet);
--       --       tempMSG.Data(CAN_Defs.DLC_Type((2*i))) := Interfaces.Unsigned_8(Character'pos(sTemp(1)));
--
--           end loop;
--
--           AVR.AT90CAN128.CAN.Can_Send(tempMSG);


         tempMSG.ID := (41, false);
         AVR.AT90CAN128.CAN.Can_Send(tempMSG);


         -- read the "VNYBA,":
         iCharsTotal := 0;

         while iCharsTotal < sMsgStr'Length loop
            Read(sTemp, 6 - iCharsTotal, iRet, port);

            for i in 1..iRet loop
               sRead(i + iCharsTotal) := sTemp(i);
            end loop;

            iCharsTotal := iCharsTotal + iRet;
         end loop;

         tempMSG.ID := (42, false);
         AVR.AT90CAN128.CAN.Can_Send(tempMSG);

         --check sRead = sMsgStr:
         bExit := true;
         for i in 1..sMsgStr'Length loop
            if sMsgStr(i) /= sRead(i) then
               bExit := false;
               exit;
            end if;
         end loop;
         exit when bExit;

         tempMSG.ID := (43, false);
         AVR.AT90CAN128.CAN.Can_Send(tempMSG);
      end loop;

      tempMSG.ID := (44, false);
   AVR.AT90CAN128.CAN.Can_Send(tempMSG);
   end Start_Message;

end AT90CAN_Ins_Controller_Utils;
