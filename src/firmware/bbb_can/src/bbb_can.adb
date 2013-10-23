
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link.
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-23

-- TODO: Add a function to the UartWrapper code so that one get the number of
-- bytes that are to be read from the USART receive buffer.

-- TODO: Hardware testing
---------------------------------------------------------------------------

with UartWrapper;
with GNAT.Serial_Communications;
with CAN_Link_Utils;

package body BBB_CAN is
   pragma Suppress (All_Checks);

   pxUart : UartWrapper.pCUartHandler;

   procedure Init is
   begin
      --initiates UART commiunication:
      pxUart := UartWrapper.pxCreate("/dev/ttyACM1", GNAT.Serial_Communications.B38400, 0.001, 100);
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

      sHeadBuf     : String(1..CAN_Link_Utils.HEADLEN);
      iRnum 	   : Integer;
      u8SpecifiedChecksum   : Interfaces.Unsigned_8;
      u8ActualChecksum   : Interfaces.Unsigned_8;
   begin
      Usart_Read(sHeadBuf, CAN_Link_Utils.HEADLEN, iRnum);

      if iRnum = CAN_Link_Utils.HEADLEN then

         bMsgReceived := true;
         CAN_Link_Utils.Bytes_To_Message_Header(sHeadBuf, msg, u8SpecifiedChecksum);

         if Integer(msg.Len) /= 0 then
            declare
               sDataBuf : String(1..Integer(msg.Len));
            begin
               Usart_Read(sDataBuf, Integer(msg.Len), iRnum); --iRnum not used

              CAN_Link_Utils.Bytes_To_Message_Data(sDataBuf, msg, u8ActualChecksum);
            end;
            bUARTChecksumOK := (u8SpecifiedChecksum = u8ActualChecksum);
         else
            bUARTChecksumOK := true; --if there is no data in the message, the checksum is defined as ok
         end if;

      else
         bMsgReceived 	 := false;
         bUARTChecksumOK := false;
      end if;
   end Get;

   --------- private functions ------------------------------------

   procedure Usart_Write(sBuffer : String; iSize : Integer) is
   begin
      pxUart.Uart_Write(sBuffer, iSize);
   end Usart_Write;

   procedure Usart_Read(sBuffer : out String; iSize : Integer; iBytesRead : out Integer) is
   begin
      sBuffer := pxUart.sUartReadSpecificAmount(iSize, iBytesRead);
   end Usart_Read;

end BBB_CAN;
