
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project.
-- As of now it is not using any handshake at all.
-- It has been tested in hardware and it works.

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-12

-- To do: Hardware testing.

---------------------------------------------------------------------------

with Interfaces;
with CAN_Defs;
with CAN_Utils;
with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;
--with Board_and_Mode_Defs;

package body AT90CAN_Usart_To_Can is
   pragma Suppress (All_Checks);


   procedure Init_Transmission_LED is
   begin
      AVR.AT90CAN128.DDRE.Bit_4 := true;
   end Init_Transmission_LED;

   procedure Init_Alive_LED is
   begin
      AVR.AT90CAN128.DDRD.Bit_7 := true;
   end Init_Alive_LED;


   procedure Flip_Transmission_LED is
   begin
      bTransmissionLED := not bTransmissionLED;
      AVR.AT90CAN128.PORTD.Bit_7 := bTransmissionLED;
   end Flip_Transmission_LED;

   procedure Flip_Alive_LED is
   begin
      bAliveLED := not bAliveLED;
      AVR.AT90CAN128.PORTE.Bit_4 := bAliveLED;
   end Flip_Alive_LED;

   procedure Usart_Write(sBuffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         iSize   : Positive) is
      iLeft  : Integer;
      iPos   : Integer;
      sTemp  : String(1..iSize);
      iNum   : Integer;
   begin
      iPos  := 0;
      iLeft := iSize;
      -- This procedure will not return until it has sent all data
      while iLeft > 0 loop
         for I in 1..iLeft loop
            sTemp(I) := sBuffer(iPos + I);
         end loop;
         iNum := AVR.AT90CAN128.USART.Write(sTemp, Port, iLeft);

         --Flip_Transmission_LED;

         iLeft := iLeft - iNum;
         iPos  := iPos + iNum;
      end loop;
   end  Usart_Write;


   procedure Usart_Read(sBuffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        iSize   : Positive; iNumber : out integer) is
      iPos      : Integer;
      iLeft     : Integer;
      iTemp     : String(1..iSize);
      iNum      : Integer;
   begin
      iLeft := iSize;
      iPos  := 0;
      while iLeft > 0 loop
         AVR.AT90CAN128.USART.Read(iTemp, Port, iLeft, iNum);
         if iNum /= 0 then

            --Flip_Transmission_LED;

            for I in 1..iNum loop
               sBuffer(iPos + I) := iTemp(I);
            end loop;
            iLeft := iLeft - iNum;
            iPos  := iPos + iNum;
         else
            --This procedure will return if it got nothning
            if iPos = 0 then
               iNumber := 0;
               return;
            end if;
         end if;
      end loop;
      iNumber := iPos;
   end  Usart_Read;


   procedure Handle_Can is
      Msg_In : Can_Defs.CAN_Message;
      Ret    : Boolean;
   begin
      -- This function only handles one message at a time, giving
      -- higher priority to receiving messages on the uart than on the can bus
      -- An overflow in the can bus buffer causes a missed message.
      -- An overflow in the uart receive buffer causes the protocal to .
      AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      if Ret then

         --Flip_Transmission_LED;

         declare
            Can_Buf   : String(1..Integer(Msg_In.Len) + CAN_Utils.HEADLEN);
         begin
            CAN_Utils.Message_To_Bytes(Can_Buf, Msg_In);
            Usart_Write(Can_Buf(CAN_Utils.HEADLEN + 1 .. Integer(Msg_In.Len) + CAN_Utils.HEADLEN), USART_PORT, Integer(Msg_In.Len));
         end;
      end if;
      --        while Ret loop
      --           Send_CanData_To_BBB(Msg_In);
      --
      --           AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      --        end loop;
   end Handle_Can;

   procedure Handle_Uart is

      use AVR.AT90CAN128.CAN;
      use Interfaces;

      procedure Handle_Uart_Data(iBytesToRead : in integer) is
         function iGet_Message_Last_Index(sData : in string; iStart : in integer) return integer is
            iPos : integer := iStart;
            iState : integer := 0;
         begin

            while iPos < sData'First + iBytes_In_Buffer loop

               case iState is

                  when 0 =>
                     if sData(iPos) = '$' then
                        iState := iState + 1;
                        iPos := iPos + 1;
                     else
                        return -2;
                     end if;

                  when 1 =>
                     if sData(iPos) = '*' then
                        iState := iState + 1;
                     end if;
                     iPos := iPos + 1;

                  when 2 =>
                     iState := iState + 1;
                     iPos := iPos + 1;

                  when 3 =>
                     return iPos;

                  when others =>
                     return -3;

               end case;

            end loop;

            return -1;
         end iGet_Message_Last_Index;


         procedure Send_CAN_String_Message(sData : in string; iFirst : in integer; iLast : in integer) is
            xCANMessage : CAN_Defs.CAN_Message;
            iEndIndex : integer := 0;
            u8Checksum : Interfaces.Unsigned_8 := 0;
            sSendStr : string(1 .. 8);
            iLength : integer;
            iPos : integer := iFirst;
         begin
            xCANMessage.ID := CAN_Defs.MSG_STRING_ID;

            while iPos <= iLast loop
               iLength := (iLast + 1) - iPos;
               if iLength > 8 then
                  iEndIndex := iPos + 7;
               else
                  iEndIndex := iLast;
               end if;

               iLength := (iEndIndex + 1) - iPos;
               xCANMessage.Data := (others => 0);
               xCANMessage.Len := CAN_Defs.DLC_Type(iLength);

               sSendStr := (others => ' ');
               for i in iPos .. iEndIndex loop
                  sSendStr((i+1) - iPos) := sData(i);
               end loop;

               CAN_Utils.Bytes_To_Message_Data(sBuffer          => sSendStr,
                                               msg              => xCANMessage,
                                               u8ActualChecksum => u8Checksum);


               AVR.AT90CAN128.CAN.Can_Send(xCANMessage);

               Flip_Transmission_LED;
               iPos := iPos + iLength;
            end loop;

         end Send_CAN_String_Message;


         sRecvData : string(1 .. iBytesToRead);
         iFirstPos : integer := sBuffer'First;
         iLastPos : integer := iFirstPos;
         iRnum : integer := 0;
         iNew_Bytes_In_Buffer : integer := 0;
         --sStr : string := "ABCDEFGHIJKLMNOPQRSTUVXYZ";
      begin
         --AVR.AT90CAN128.PORTE.Bit_4 := false;
         Usart_Read(sRecvData, USART_PORT, iBytesToRead, iRnum);

         if iRnum <= 0 then
            return;
         end if;

         -- Flush buffer to prevent overflow
         if iBytes_In_Buffer > 470 then
            iBytes_In_Buffer := 0;
         end if;


         for i in 1 .. iRnum loop
            sBuffer(sBuffer'First + iBytes_In_Buffer) := sRecvData(sRecvData'First + (i-1));
            iBytes_In_Buffer := iBytes_In_Buffer + 1;
         end loop;



         while iLastPos < sBuffer'First + iBytes_In_Buffer loop
            while iGet_Message_Last_Index(sBuffer, iLastPos) = -2 loop
               iLastPos := iLastPos + 1;
            end loop;
            iFirstPos := iLastPos;
            -- Now either on '$' or end of buffer

            if iGet_Message_Last_Index(sBuffer, iFirstPos) /= -1 then
               iLastPos := iGet_Message_Last_Index(sBuffer, iFirstPos);
               Send_CAN_String_Message(sBuffer, iFirstPos, iLastPos);
               iLastPos := iLastPos + 1;
            else
               exit;
            end if;
         end loop;

         if iFirstPos < sBuffer'First + iBytes_In_Buffer then
            for i in iFirstPos .. (sBuffer'First - 1) + iBytes_In_Buffer loop
               sBuffer((i+1) - iFirstPos) := sBuffer(i);
               iNew_Bytes_In_Buffer := iNew_Bytes_In_Buffer + 1;
            end loop;
            iBytes_In_Buffer := iNew_Bytes_In_Buffer;
         else
            iBytes_In_Buffer := 0;
         end if;


      end Handle_Uart_Data;


      iDataAvailable	  : integer := 0;
   begin

      iDataAvailable := AVR.AT90CAN128.USART.Data_Available(USART_PORT);

      if iDataAvailable > 0 then
         Handle_Uart_Data(iBytesToRead => iDataAvailable);
      end if;

   end Handle_Uart;

   procedure Main_Loop is
      use AVR.AT90CAN128.CLOCK;

      xDelayTimeMS : constant AVR.AT90CAN128.CLOCK.Time_Duration := 500;
      xDeltaTimeMS : AVR.AT90CAN128.CLOCK.Time_Duration := 0;
      xTimeStart : AVR.AT90CAN128.CLOCK.Time := AVR.AT90CAN128.CLOCK.getClockTime;
      xTimeStop : AVR.AT90CAN128.CLOCK.Time;
   begin

      loop

         xTimeStop := AVR.AT90CAN128.CLOCK.getClockTime;
         xDeltaTimeMS := xDeltaTimeMS + (xTimeStop - xTimeStart);

         if xDeltaTimeMS >= xDelayTimeMS then
            xDeltaTimeMS := xDeltaTimeMS - xDelayTimeMS;
            Flip_Alive_LED;
         end if;

         xTimeStart := xTimeStop;

         -- Handle the messages from the BBB
         Handle_Uart;
         -- Deal with the messages from the CAN bus.
         Handle_Can;
      end loop;
   end Main_Loop;

   procedure Hardware_Init is
   begin
      -- init LEDs
      Init_Transmission_LED;
      Init_Alive_LED;

      -- init usart
      AVR.AT90CAN128.USART.Init(USART_PORT,  AVR.AT90CAN128.USART.BAUD115200);

      -- init clock
      AVR.AT90CAN128.CLOCK.Init;

      -- init CAN
      AVR.AT90CAN128.CAN.Can_Init(Can_Defs.K250, INS_BOARD );

      -- set masks for CAN in
      AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK(CAN_Defs.MSG_STRING_ID,
                                                 CAN_Defs.MSG_STRING_ID);
   end Hardware_Init;

end AT90CAN_Usart_To_Can;
