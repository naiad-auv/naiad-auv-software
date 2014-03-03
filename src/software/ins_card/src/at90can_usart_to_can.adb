with CAN_Defs;
with CAN_Utils;
with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;
--with Board_and_Mode_Defs;

package body AT90CAN_Usart_To_Can is
   pragma Suppress (All_Checks);

   -- Returns the value (0-255) from the hexadecimal number presented in sHex (in format FF).
   function cGet_Char_From_Hex (sHex : in string; iFirst : in integer; iSecond : in integer) return character is
      iLarge : constant integer := Integer(Character'Pos(sHex(iFirst))) - 48;
      iSmall : constant integer := Integer(Character'Pos(sHex(iSecond))) - 48;
   begin
      return Character'Val((16 * (iLarge - ((iLarge / 17) * 7))) + (iSmall - ((iSmall / 17) * 7)));
   end cGet_Char_From_Hex;

   -- Returns the checksum for the string in a character range 0-255.
   function cGet_Checksum(sStr : in string) return character is
      use Interfaces;
      uCRC : Interfaces.Unsigned_8 := 0;
   begin
      for i in sStr'First + 1 .. sStr'Last - 3 loop
         uCRC := uCRC xor Interfaces.Unsigned_8(Character'Pos(sStr(i)));
      end loop;
      return Character'Val(uCRC);
   end cGet_Checksum;

   -- Returns a float number from the string. String is in form "+432.34".
   function fGet_Value_From_String(sMessageData : in string; iStartPos : in integer; iEndPos : in integer) return float is
      fTotalBeforeDot : float := 0.0;
      fTotalAfterDot : float := 0.0;
      fMultiplier : float := 0.0;
      iPosAfterDot : integer := 0;
   begin
      fMultiplier := float(44 - Integer(Character'Pos(sMessageData(iStartPos))));

      for i in iStartPos + 1 .. iEndPos loop
         if sMessageData(i) = '.' then
            iPosAfterDot := i + 1;
            exit;
         end if;
         fTotalBeforeDot := (fTotalBeforeDot * 10.0) + float(Integer(Character'Pos(sMessageData(i))) - 48);
      end loop;

      for i in reverse iPosAfterDot .. iEndPos loop
         fTotalAfterDot := (fTotalAfterDot * 0.1) + float(Integer(Character'Pos(sMessageData(i))) - 48);
      end loop;

      return fMultiplier * (fTotalBeforeDot + (fTotalAfterDot * 0.1));
   end fGet_Value_From_String;

   -- Sends sData over CAN in however many CAN-messages it needs to send the
   -- entire string.
   procedure Send_CAN_String_Message(sData : in string; iFirst : in integer; iLast : in integer) is
      use Interfaces;
      use CAN_Defs;
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
            sSendStr(sSendStr'First + (i - iPos)) := sData(i);
         end loop;

         CAN_Utils.Bytes_To_Message_Data(sBuffer          => sSendStr,
                                         msg              => xCANMessage,
                                         u8ActualChecksum => u8Checksum);

         AVR.AT90CAN128.CAN.Can_Send(xCANMessage);

         iPos := iEndIndex + 1;
      end loop;
   end Send_CAN_String_Message;

   -- Sends faVectors over CAN, which is an array containing the X- and Y-vectors
   -- of the current orientation from the IMU.
   -- The X- and Y-vectors' X- and Y-components are sent along with a bit each describing
   -- if the Z-component of the vector is positive or negative (0 = negative, 1 = positive).
   -- The X- and Y-vectors' Z-components are calculated on the other side with sqrt(1-x²-y²),
   -- and signed by the Z-component bit sent.
   -- The entire Z-vector is given by the X cross Y.
   procedure Send_Vectors is
      xValues : OrientationRecord;
      xData : CANDataRecord;
      fValues : f_array(1 .. 6) := (fmNaiadOrientation(1,1), fmNaiadOrientation(2,1), fmNaiadOrientation(3,1),
                                    fmNaiadOrientation(1,2), fmNaiadOrientation(2,2), fmNaiadOrientation(3,2));
      xCANMessage : CAN_Defs.CAN_Message;

   begin

      fValues(1) := float'Min(((fValues(1) + 1.0) * 16_383.5) + 0.5,16_383.5 * 2.0);
      fValues(2) := float'Min(((fValues(2) + 1.0) * 16_383.5) + 0.5,16_383.5 * 2.0);
      fValues(4) := float'Min(((fValues(4) + 1.0) * 16_383.5) + 0.5,16_383.5 * 2.0);
      fValues(5) := float'Min(((fValues(5) + 1.0) * 16_383.5) + 0.5,16_383.5 * 2.0);

      fValues(3) := float'Min(1.0, (fValues(3) / abs(fValues(3) + fValues(3))) + 0.5); -- makes value 0 (<0) or 1 (>0)
      fValues(6) := float'Min(1.0, (fValues(6) / abs(fValues(6) + fValues(6))) + 0.5); -- makes value 0 (<0) or 1 (>0)

      xValues.XVectorX := uint15(fValues(1));
      xValues.XVectorY := uint15(fValues(2));
      xValues.YVectorX := uint15(fValues(4));
      xValues.YVectorY := uint15(fValues(5));
      xValues.XVectorZ := uint2(fValues(3));
      xValues.YVectorZ := uint2(fValues(6));

      xCANMessage.ID := CAN_Defs.MSG_IMU_ORIENTATION_ID;
      xCANMessage.Len := CAN_Defs.DLC_Type(8);

      xData := OrientationRecord_To_CANDataRecord(xValues);

      xCANMessage.Data(1) := xData.One;
      xCANMessage.Data(2) := xData.Two;
      xCANMessage.Data(3) := xData.Three;
      xCANMessage.Data(4) := xData.Four;
      xCANMessage.Data(5) := xData.Five;
      xCANMessage.Data(6) := xData.Six;
      xCANMessage.Data(7) := xData.Seven;
      xCANMessage.Data(8) := xData.Eight;

      AVR.AT90CAN128.CAN.Can_Send(Msg => xCANMessage);
   end Send_Vectors;

   procedure Init_Transmission_LED is
   begin
      AVR.AT90CAN128.DDRD.Bit_7 := true;
   end Init_Transmission_LED;
   procedure Init_Alive_LED is
   begin
      AVR.AT90CAN128.DDRE.Bit_4 := true; -- alive LED
   end Init_Alive_LED;

   procedure Flip_Alive_LED is
   begin
      bAliveLED := not bAliveLED;
      AVR.AT90CAN128.PORTE.Bit_4 := bAliveLED;
   end Flip_Alive_LED;

   procedure Flip_Transmission_LED is
   begin
      bTransmissionLED := not bTransmissionLED;
      AVR.AT90CAN128.PORTD.Bit_7 := bTransmissionLED;
   end Flip_Transmission_LED;

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
         null;
         --           declare
         --              Can_Buf   : String(1..Integer(Msg_In.Len) + CAN_Utils.HEADLEN);
         --           begin
         --              CAN_Utils.Message_To_Bytes(Can_Buf, Msg_In);
         --              Usart_Write(Can_Buf, USART_PORT, Integer(Msg_In.Len) + CAN_Utils.HEADLEN);
         --           end;

         --           declare
         --              Can_Buf   : String(1..Integer(Msg_In.Len));
         --              iBytesSent : integer := 0;
         --           begin
         --
         --              CAN_Utils.Message_To_Data_Bytes(Can_Buf, Msg_In);
         --              iBytesSent := AVR.AT90CAN128.USART.Write(Buffer => Can_Buf,
         --                                                       Port   => USART_PORT,
         --                                                       Size   => Integer(Msg_In.Len));
         --              while iBytesSent < Integer(Msg_In.Len) loop
         --                 declare
         --                    New_Buf : string(1 .. Integer(Msg_In.Len) - iBytesSent);
         --                 begin
         --                    for i in iBytesSent+1 .. Integer(Msg_In.Len) loop
         --                       New_Buf(i - iBytesSent) := Can_Buf(i);
         --                    end loop;
         --                    iBytesSent := iBytesSent + AVR.AT90CAN128.USART.Write(Buffer => New_Buf,
         --                                                                          Port   => USART_PORT,
         --                                                                          Size   => Integer(Msg_In.Len) - iBytesSent);
         --                 end;
         --
         --              end loop;
         --
         --           end;
      end if;
      --        while Ret loop
      --           Send_CanData_To_BBB(Msg_In);
      --
      --           AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      --        end loop;
   end Handle_Can;


   procedure Handle_Uart is
      use AVR.AT90CAN128.CAN;
      use AVR.AT90CAN128.CLOCK;
      iDataAvailable	  : constant integer := AVR.AT90CAN128.USART.Data_Available(USART_PORT);
      sRecvData : string(1 .. iDataAvailable);
      iReceivedBytes : integer := 0;
   begin

      if iDataAvailable > 0 then
         AVR.AT90CAN128.USART.Read(Buffer => sRecvData,
                                   Port   => USART_PORT,
                                   Size   => iDataAvailable,
                                   Num    => iReceivedBytes);

         if iReceivedBytes > 0 then

            for i in sRecvData'First .. (sRecvData'First - 1) + iReceivedBytes loop

               sMessageBuffer(iMessageBufferPosition) := sRecvData(i);
               iMessageBufferPosition := iMessageBufferPosition + 1;

               case iMessageState is
                  when 0 =>
                     if sRecvData(i) = '$' then
                        iMessageBufferPosition := sMessageBuffer'First;
                        sMessageBuffer(iMessageBufferPosition) := sRecvData(i);
                        iMessageBufferPosition := iMessageBufferPosition + 1;
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 1 =>
                     if sRecvData(i) = 'V' then
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 2 =>
                     if sRecvData(i) = 'N' then
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 3 =>
                     if sRecvData(i) = 'Q' then
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 4 =>
                     if sRecvData(i) = 'T' then
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 5 =>
                     if sRecvData(i) = 'N' then
                        iMessageState := iMessageState + 1;
                     else
                        iMessageState := 0;
                     end if;
                  when 6 =>

                     if iMessageBufferPosition > sMessageBuffer'Last then

                        iMessageBufferPosition := sMessageBuffer'First;
                        iMessageState := 0;

                        if cGet_Checksum(sMessageBuffer) = cGet_Char_From_Hex(sMessageBuffer, sMessageBuffer'Last - 1, sMessageBuffer'Last) then

                           faQuaternion(1) := fGet_Value_From_String(sMessageData => sMessageBuffer,
                                                                     iStartPos    => (sMessageBuffer'First - 1) + FIRST_QUAT_INDEX,
                                                                     iEndPos      => (sMessageBuffer'First - 1) + FIRST_QUAT_INDEX + QUAT_LENGTH);
                           faQuaternion(2) := fGet_Value_From_String(sMessageData => sMessageBuffer,
                                                                     iStartPos    => (sMessageBuffer'First - 1) + SECOND_QUAT_INDEX,
                                                                     iEndPos      => (sMessageBuffer'First - 1) + SECOND_QUAT_INDEX + QUAT_LENGTH);
                           faQuaternion(3) := fGet_Value_From_String(sMessageData => sMessageBuffer,
                                                                     iStartPos    => (sMessageBuffer'First - 1) + THIRD_QUAT_INDEX,
                                                                     iEndPos      => (sMessageBuffer'First - 1) + THIRD_QUAT_INDEX + QUAT_LENGTH);
                           faQuaternion(4) := fGet_Value_From_String(sMessageData => sMessageBuffer,
                                                                     iStartPos    => (sMessageBuffer'First - 1) + FOURTH_QUAT_INDEX,
                                                                     iEndPos      => (sMessageBuffer'First - 1) + FOURTH_QUAT_INDEX + QUAT_LENGTH);

                           fmNaiadOrientation := (((1.0-2.0*(faQuaternion(1)*faQuaternion(1)+faQuaternion(3)*faQuaternion(3))),
                                                  (2.0*(faQuaternion(1)*faQuaternion(2)+faQuaternion(4)*faQuaternion(3))),
                                                  -(2.0*(faQuaternion(2)*faQuaternion(3)-faQuaternion(4)*faQuaternion(1)))),

                                                  ((2.0*(faQuaternion(1)*faQuaternion(2)-faQuaternion(4)*faQuaternion(3))),
                                                   (1.0-2.0*(faQuaternion(2)*faQuaternion(2)+faQuaternion(3)*faQuaternion(3))),
                                                   -(2.0*(faQuaternion(1)*faQuaternion(3)+faQuaternion(4)*faQuaternion(2)))),

                                                  (-(2.0*(faQuaternion(2)*faQuaternion(3)+faQuaternion(4)*faQuaternion(1))),
                                                   -(2.0*(faQuaternion(1)*faQuaternion(3)-faQuaternion(4)*faQuaternion(2))),
                                                   (1.0-2.0*(faQuaternion(1)*faQuaternion(1)+faQuaternion(2)*faQuaternion(2)))));

                           Send_Vectors;
                        end if;
                     end if;

                  when others =>
                     iMessageState := 0;
                     iMessageBufferPosition := sMessageBuffer'First;
               end case;
            end loop;
         end if;
      end if;

   end Handle_Uart;

   procedure Main_Loop is
      use AVR.AT90CAN128.CLOCK;

      xDelayTimeMS : constant AVR.AT90CAN128.CLOCK.Time_Duration := 500;
      xSavedDeltaTimeMS : AVR.AT90CAN128.CLOCK.Time_Duration := 0;
      xDeltaTimeMS : AVR.AT90CAN128.CLOCK.Time_Duration := 0;
      xTimeStart : AVR.AT90CAN128.CLOCK.Time := AVR.AT90CAN128.CLOCK.getClockTime;
      xTimeStop : AVR.AT90CAN128.CLOCK.Time := 0;
   begin


      loop
         xSavedDeltaTimeMS := xSavedDeltaTimeMS + xDeltaTimeMS;

         if xSavedDeltaTimeMS > xDelayTimeMS then
            xSavedDeltaTimeMS := xSavedDeltaTimeMS - xDelayTimeMS;
            Flip_Alive_LED;
         end if;


         xTimeStart := xTimeStop;
         xTimeStop := AVR.AT90CAN128.CLOCK.getClockTime;
         xDeltaTimeMS := xTimeStop - xTimeStart;

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
