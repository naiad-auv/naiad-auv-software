
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link.
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-18

-- TODO: hardware testing
---------------------------------------------------------------------------

with UartWrapper;
with GNAT.Serial_Communications;

package body BBB_CAN is
   pragma Suppress (All_Checks);

   pxUart : UartWrapper.pCUartHandler;

   procedure Init is
   begin
      --initiates UART commiunication:
      pxUart := UartWrapper.pxCreate("/dev/ttyACM1", GNAT.Serial_Communications.B38400, 0.001, 100);
   end Init;

   function Handshake return Boolean is
      sSend : String(1..5);
      sReceive : String(1..6);
      iBytesRead : Integer := 0;
   begin
      -- handshake message:
      sSend(1) := Character'Val(3);
      sSend(2) := Character'Val(0);
      sSend(3) := Character'Val(0);
      sSend(4) := Character'Val(0);
      sSend(5) := Character'Val(0);

      --send handshake message and wait for reply while keeping a look at the clock
      sReceive := pxUart.sUartEcho(5, iBytesRead, sSend, Duration(iHANDSHAKE_WAIT_TIME_MS) / 1000);

      if iBytesRead >= 5 then
         if sReceive(1) = Character'Val(3) and
           	sReceive(2) = Character'Val(0) and
           	sReceive(3) = Character'Val(0) and
           	sReceive(4) = Character'Val(0) and
           	sReceive(5) = Character'Val(0) then
            return true;
         end if;
      end if;
      return false;
   end Handshake;

   procedure Send(msg : CAN_Message) is
      sBuffer : String(1..Integer(msg.Len)+HEADLEN);
   begin
      Message_To_Bytes(sBuffer, msg);
      Usart_Write(sBuffer, Integer(msg.Len));
   end Send;

   procedure Get(msg : out CAN_Message; bMsgReceived : out Boolean; bUARTChecksumOK : out Boolean) is

      use Interfaces;

      sHeadBuf     : String(1..HEADLEN);
      iRnum 	   : Integer;
      iDataLen     : Integer;
      iID	   : Integer;
      u8Checksum   : Interfaces.Unsigned_8;
   begin
      Usart_Read(sHeadBuf, HEADLEN, iRnum);

      if iRnum = HEADLEN then
         iDataLen := Character'Pos(sHeadBuf(LEN_POS));
         iID := Character'Pos(sHeadBuf(IDHIGH_POS)) * 256 + Character'Pos(sHeadBuf(IDLOW_POS));

         msg.ID  := CAN_ID(iID);
         msg.Len := DLC_Type(iDataLen);
         bMsgReceived := true;

         if iDataLen /= 0 then
            declare
               sData : String(1..iDataLen);
               sBuffer : String(1..1);
               iLeft : Integer := iDataLen;
               iBytesRead : Integer;
               iTotalBytes : Integer := 0;
            begin
               while iTotalBytes < iDataLen loop
                  Usart_Read(sBuffer, 1, iBytesRead);
                  iTotalBytes := iTotalBytes + 1;
                  if iBytesRead = 1 then
                     sData(iTotalBytes) := sBuffer(1);
                  end if;
               end loop;

               for i in 1..iDataLen loop
                  msg.Data(DLC_Type(i)) := Character'Pos(sData(i));
               end loop;

               u8Checksum := Calculate_Checksum(msg.Data, msg.Len);
            end;
            bUARTChecksumOK := (u8Checksum = Character'Pos(sHeadBuf(Checksum_POS)));
         else
            bUARTChecksumOK := true; --if there is no data in the message, the checksum is defined as ok
         end if;


      else
         bMsgReceived 	 := false;
         bUARTChecksumOK := false;
      end if;
   end Get;

   --------- private functions -------------------------------------

   procedure Bytes_To_Message(sBuffer : String; msg : out CAN_Message; bCheckSumCorrect : out Boolean) is
   begin
      msg.ID := CAN_ID(
                       (Character'Pos(sBuffer(IDHIGH_POS)) * 256)
                       + Character'Pos(sBuffer(IDLOW_POS)));

      msg.Len := Character'Pos(sBuffer(LEN_POS));

      for I in 1..msg.Len loop
         Msg.Data(I) := Interfaces.Unsigned_8(
                                              Character'Pos(
                                                sBuffer(HEADLEN + Integer(I))));
      end loop;

      bCheckSumCorrect :=  Character'Pos(sBuffer(CHECKSUM_POS)) = Integer(Calculate_Checksum(msg.Data, msg.Len));

   end Bytes_To_Message;

   procedure Message_To_Bytes(sBuffer : out String; msg : CAN_Message) is
      iDataLength : Integer := Integer(msg.Len);
   begin
      sBuffer(BUSTYPE_POS) := Character'Val(0);
      sBuffer(IDHIGH_POS)  := Character'Val(Integer(msg.ID) / 256);
      sBuffer(IDLOW_POS)   := Character'Val(Integer(Msg.ID) Mod 256);
      sBuffer(LEN_POS) 	   := Character'Val(Integer(msg.Len));

      if Integer(msg.Len) > 0 then
         for I in 1..Integer(msg.Len) loop
            sBuffer(HEADLEN + I) := Character'Val(Msg.Data ( DLC_Type(I)));
         end loop;
      end if;

      sBuffer(CHECKSUM_POS) := Character'Val(Integer(Calculate_Checksum(Msg.Data, msg.Len)));

   end Message_To_Bytes;

   procedure Usart_Write(sBuffer : String; iSize : Integer) is
   begin
      pxUart.Uart_Write(sBuffer, iSize);
   end Usart_Write;

   procedure Usart_Read(sBuffer : out String; iSize : Integer; iBytesRead : out Integer) is
   begin
      sBuffer := pxUart.sUartReadSpecificAmount(iSize, iBytesRead);
   end Usart_Read;

   function Calculate_Checksum(b8Data : Byte8; Len : DLC_Type) return Interfaces.Unsigned_8 is
      Checksum : Interfaces.Unsigned_8 := 0;
      use Interfaces;
   begin
      for I in 1..Len loop
         Checksum := Checksum xor b8Data(I);
      end loop;
      return Checksum;
   end Calculate_Checksum;

end BBB_CAN;
