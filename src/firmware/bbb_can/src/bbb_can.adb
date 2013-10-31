
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link.
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-28

-- TODO: hardware testing

---------------------------------------------------------------------------

with Ada.Text_IO;
with UartWrapper;
with GNAT.Serial_Communications;
with CAN_Link_Utils;

package body BBB_CAN is
   pragma Suppress (All_Checks);


   --if only a part of a message header has arrived, it will be saved here
   sTempBuffer : String(1..CAN_Link_Utils.HEADLEN);
   iNumTempBytes : Integer := 0; -- number of bytes in sTempBuffer

   pxUart : UartWrapper.pCUartHandler;

   procedure Init(sPort : String; baud : GNAT.Serial_Communications.Data_Rate) is
   begin
      --initiates UART commiunication:
      Ada.Text_IO.Put_Line("Opening " & "/dev/" & sPort & ", baudrate: " & baud'Img);
      pxUart := UartWrapper.pxCreate("/dev/ttyACM1", Gnat.Serial_Communications.B9600, 1.0, 100);
   end Init;

--     function Handshake return Boolean is
--        sSend : String(1..5);
--        sReceive : String(1..6);
--        iBytesRead : Integer := 0;
--     begin
--        -- handshake message:
--        sSend(1) := Character'Val(3);
--        sSend(2) := Character'Val(0);
--        sSend(3) := Character'Val(0);
--        sSend(4) := Character'Val(0);
--        sSend(5) := Character'Val(0);
--
--        --send handshake message and wait for reply while keeping a look at the clock
--        sReceive := pxUart.sUartEcho(5, iBytesRead, sSend, Duration(iHANDSHAKE_WAIT_TIME_MS) / 1000);
--
--        if iBytesRead >= 5 then
--           if sReceive(1) = Character'Val(3) and
--             	sReceive(2) = Character'Val(0) and
--             	sReceive(3) = Character'Val(0) and
--             	sReceive(4) = Character'Val(0) and
--             	sReceive(5) = Character'Val(0) then
--              return true;
--           end if;
--        end if;
--        return false;
--     end Handshake;

   procedure Send(msg : AVR.AT90CAN128.CAN.CAN_Message) is
      sBuffer : String(1 .. (Integer(msg.Len) + CAN_Link_Utils.HEADLEN));
   begin
      CAN_Link_Utils.Message_To_Bytes(sBuffer, msg);
      Usart_Write(sBuffer, Integer(msg.Len) + CAN_Link_Utils.HEADLEN);
   end Send;

   procedure Get(msg : out AVR.AT90CAN128.CAN.CAN_Message; bMsgReceived : out Boolean; bUARTChecksumOK : out Boolean) is

      use Interfaces;

      procedure ReadFromUART(sBuffer : out String; bReadComplete : out Boolean) is
         iBytesRead : Integer;
      begin

         if iNumTempBytes = 0 then

            Usart_Read(sTempBuffer, CAN_Link_Utils.HEADLEN, iBytesRead);

            if iBytesRead = CAN_Link_Utils.HEADLEN then
               sBuffer := sTempBuffer;
               bReadComplete := true;
               return;
            else
               iNumTempBytes := iBytesRead;
               bReadComplete := false;
               return;
            end if;
         else
            declare
               sTemp : String(1..CAN_Link_Utils.HEADLEN - iNumTempBytes);
            begin
               Usart_Read(sTemp, CAN_Link_Utils.HEADLEN - iNumTempBytes, iBytesRead);

               for i in 1..iBytesRead loop
                  sTempBuffer(i + iNumTempBytes) := sTemp(i);
               end loop;
               iNumTempBytes := iNumTempBytes + iBytesRead;
            end;
            if iNumTempBytes = CAN_Link_Utils.HEADLEN then
               iNumTempBytes := 0;
               sBuffer := sTempBuffer;
               bReadComplete := true;
               return;
            else
               bReadComplete := false;
               return;
            end if;
         end if;
      end ReadFromUART;

      sHeadBuf     : String(1..CAN_Link_Utils.HEADLEN);
      u8ActualChecksum    : Interfaces.Unsigned_8;
      u8ReceivedChecksum  : Interfaces.Unsigned_8;
      bReadComplete : Boolean;
   begin

      ReadFromUART(sHeadBuf, bReadComplete);
      if not bReadComplete then
         bMsgReceived 	 := false;
         bUARTChecksumOK := false;
         return;
      end if;

      bMsgReceived := true;
      CAN_Link_Utils.Bytes_To_Message_Header(sHeadBuf, msg, u8ReceivedChecksum);

      if Integer(msg.Len) /= 0 then
         declare
            sData : String(1..Integer(msg.Len));
         begin
            Usart_Read_Inf_Block(sData, Integer(msg.Len));

            CAN_Link_Utils.Bytes_To_Message_Data(sData, msg, u8ActualChecksum);
         end;
         bUARTChecksumOK := (u8ActualChecksum = u8ReceivedChecksum);
      else
         bUARTChecksumOK := true; --if there is no data in the message, the checksum is defined as ok
      end if;
   end Get;

   --------- private functions ------------------------------------

   procedure Usart_Write(sBuffer : String; iSize : Integer) is
   begin
      pxUart.Uart_Write(sBuffer, iSize);
   end Usart_Write;

   procedure Usart_Read(sBuffer : out String; iSize : Integer; iBytesRead : out Integer) is
   begin
      pxUart.UartReadSpecificAmount(iSize, iBytesRead, sBuffer);
   end Usart_Read;

   procedure Usart_Read_Inf_Block(sBuffer : out String; iSize : Integer) is
      sTemp : String(1..iSize);
      iBytesRead : Integer;
      iTotalBytes : Integer := 0;
   begin
      while iTotalBytes < iSize loop
         pxUart.UartReadSpecificAmount(iSize - iTotalBytes, iBytesRead, sTemp);
         for i in 1 .. iBytesRead loop
            sBuffer(i + iTotalBytes) := sTemp(i);
         end loop;
         iTotalBytes := iTotalBytes + iBytesRead;
      end loop;
   end Usart_Read_Inf_Block;

end BBB_CAN;
