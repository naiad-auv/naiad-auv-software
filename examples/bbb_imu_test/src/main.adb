with UartWrapper;
with Interfaces;
with Interfaces.C;

with Ada.Real_Time; -- measure time
with Ada.Text_IO;
with Ada.Float_Text_IO;

with CAN_Defs;
with CAN_Utils;
with BBB_CAN;

procedure Main is
   use Ada.Real_Time;
   use Interfaces;

   function sGet_Data_String(bDataArray : in CAN_Defs.Byte8) return string is
   begin
      return Character'Val(bDataArray(1)) &
        Character'Val(bDataArray(2)) &
        Character'Val(bDataArray(3)) &
        Character'Val(bDataArray(4)) &
        Character'Val(bDataArray(5)) &
        Character'Val(bDataArray(6)) &
        Character'Val(bDataArray(7)) &
        Character'Val(bDataArray(8));
   end sGet_Data_String;

   function sAdd_CR_NL(sString : in string) return string is
   begin
      return sString & Character'Val(13) & Character'Val(10);
   end sAdd_CR_NL;


   function sGetCommandWithChecksum(sCommand : in string) return string is
      function sGetSimpleHex(iVal : in integer) return string is
      begin
         case iVal is
            when 0 =>
               return "0";
            when 1 =>
               return "1";
            when 2 =>
               return "2";
            when 3 =>
               return "3";
            when 4 =>
               return "4";
            when 5 =>
               return "5";
            when 6 =>
               return "6";
            when 7 =>
               return "7";
            when 8 =>
               return "8";
            when 9 =>
               return "9";
            when 10 =>
               return "A";
            when 11 =>
               return "B";
            when 12 =>
               return "C";
            when 13 =>
               return "D";
            when 14 =>
               return "E";
            when 15 =>
               return "F";
            when others =>
               return "!ERROR!";
         end case;
      end sGetSimpleHex;

      function sGetHexValue(iVal : in integer) return string is

         function sGetHexValueHigher(iVal : in integer; iPow : in integer) return string is
            iRemove : integer := 0;
         begin
            if iVal = 0 then
               return "";
            end if;

            iRemove := iVal / (16 ** iPow);
            return sGetHexValueHigher(iVal - (iRemove * (16 ** iPow)), iPow + 1) & sGetSimpleHex(iRemove);
         end sGetHexValueHigher;

         iRemove : integer := 0;
      begin
         iRemove := iVal mod 16;
         return sGetHexValueHigher(iVal - iRemove, 1) & sGetSimpleHex(iRemove);
      end sGetHexValue;


      type Unsigned_8 is mod 2 ** 8;
      bXor : Unsigned_8 := 0;
   begin
      for i in sCommand'First + 1 .. sCommand'Last loop
         bXor := bXor xor Unsigned_8(Character'Pos(sCommand(i)));
      end loop;
      return sCommand & "*" & sGetHexValue(Integer(bXor));
   end sGetCommandWithChecksum;

   procedure Send_String_Over_CAN(sData : in string; iStart : integer) is
      iLength : integer;
      iEnd : integer;
      xCANMessage : CAN_Defs.CAN_Message;
      sStr : string(1 .. 8);
      iChecksum : Interfaces.Unsigned_8;
   begin
      if iStart > sData'Last then
         return;
      end if;

      if (sData'Last + 1) - iStart > 7 then
         iEnd := iStart + 7;
      else
         iEnd := (sData'Last + 1) - iStart;
      end if;

      iLength := (iEnd + 1) - iStart;

      xCANMessage.ID := CAN_Defs.MSG_STRING_ID;
      xCANMessage.Len := CAN_Defs.DLC_Type(iLength);

      sStr := (others => ' ');
      for i in iStart .. iEnd loop
         sStr((i+1)-iStart) := sData(i);
      end loop;

      CAN_Utils.Bytes_To_Message_Data(sBuffer          => sStr,
                                      msg              => xCANMessage,
                                      u8ActualChecksum => iChecksum);

      BBB_CAN.Send(msg => xCANMessage);

      Send_String_Over_CAN(sData, iEnd + 1);
   end Send_String_Over_CAN;


   xCANRecvMessage : CAN_Defs.CAN_Message;
   bMessageReceived : boolean := false;
   bChecksumOK : boolean := false;


   fDeltaTime : float := 0.0;
   fSecondaryDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   fDelayTime : float := 5.0;
   fLastDelay : float := 10.0;

   sCommandSetOutput : string := sAdd_CR_NL(sGetCommandWithChecksum("$VNWRG,11"));
   sCommandWriteSettings : string := sAdd_CR_NL(sGetCommandWithChecksum("$VNWNV"));

begin

   BBB_CAN.Init(sPort => "/dev/ttyO4",
                baud  => UartWrapper.B115200);

   loop
      -- Time measurement -----------------------------------------------------------
      xTimeStop := Ada.Real_Time.Clock;
      xTimeSpan := xTimeSpan + (xTimeStop - xTimeStart);

      iSeconds := xTimeSpan / Ada.Real_Time.Seconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Seconds(1) * iSeconds);

      iMilliSeconds := xTimeSpan / Ada.Real_Time.Milliseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Milliseconds(1) * iMilliSeconds);

      iMicroSeconds := xTimeSpan / Ada.Real_Time.Microseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Microseconds(1) * iMicroSeconds);

      iNanoSeconds := xTimeSpan / Ada.Real_Time.Nanoseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Nanoseconds(1) * iNanoSeconds);

      fDeltaTime := fDeltaTime + float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
        (float(iNanoSeconds) * 0.000000001);

      if fSecondaryDeltaTime <= fLastDelay then
         fSecondaryDeltaTime := fSecondaryDeltaTime + fDeltaTime;
      end if;

      BBB_CAN.Get(msg             => xCANRecvMessage,
                  bMsgReceived    => bMessageReceived,
                  bUARTChecksumOK => bChecksumOK);

      if bMessageReceived = true then
         Ada.Text_IO.Put("[");
         Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18,EXP=>0);
         Ada.Text_IO.Put_Line("] Message received. ID: " & xCANRecvMessage.ID.Identifier'Img & ". Data: " & sGet_Data_String(xCANRecvMessage.Data));
         fDeltaTime := 0.0;
         bMessageReceived := false;
      end if;

      if fSecondaryDeltaTime > fDelayTime then
         fDelayTime := 1000.0;
         Send_String_Over_CAN(sCommandSetOutput, sCommandSetOutput'First);
      end if;
      if fSecondaryDeltaTime > fLastDelay then
         fLastDelay := 50000.0;
         Send_String_Over_CAN(sCommandWriteSettings, sCommandWriteSettings'First);
      end if;

      -- Prepare timer for new iteration
      xTimeStart := xTimeStop;
   end loop;
end Main;
