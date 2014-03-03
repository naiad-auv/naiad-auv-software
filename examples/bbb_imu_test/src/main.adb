with UartWrapper;
with Interfaces;
with Interfaces.C;

with Ada.Real_Time; -- measure time
with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Unchecked_Conversion;
with Ada.Numerics.Elementary_Functions;

with CAN_Defs;
with CAN_Utils;
with BBB_CAN;

procedure Main is
   use Ada.Real_Time;
   use Interfaces;
   use CAN_Defs;

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
      --return sString & Character'Val(13) & Character'Val(10);
      return sString & Character'Val(10);
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
         iEnd := sData'Last;
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

   procedure Write_Message(xCANMessage : in CAN_Defs.CAN_Message; fDeltaTime : in float) is
   begin
      Ada.Text_IO.Put("[");
      Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18,EXP=>0);
      Ada.Text_IO.Put_Line("] Message received. ID: " & xCANMessage.ID.Identifier'Img & ". Data: " & sGet_Data_String(xCANMessage.Data));
   end Write_Message;
   
   
   type uint19 is mod 2 ** 19;
   type uint7 is mod 2 ** 7;
   type uint15 is mod 2 ** 15;
   type uint2 is mod 2;
      
   type DataRecord is 
      record
         One : Interfaces.Unsigned_8;
         Two : Interfaces.Unsigned_8;
         Three : Interfaces.Unsigned_8;
         Four : Interfaces.Unsigned_8;
         Five : Interfaces.Unsigned_8;
         Six : Interfaces.Unsigned_8;
         Seven : Interfaces.Unsigned_8;
         Eight : Interfaces.Unsigned_8;
      end record;      
   
   type ValueRecord is
      record
         AccX : uint19;
         AccY : uint19;
         AccZ : uint19;
         Scale : uint7;
      end record;
   for ValueRecord use record
      AccX at 0 range 0 .. 18;
      AccY at 0 range 19 .. 37;
      AccZ at 0 range 38 .. 56;
      Scale at 0 range 57 .. 63;
   end record;
   
   type OrientRecord is
      record
         XVecX : uint15;
         XVecY : uint15;
         YVecX : uint15;
         YVecY : uint15;
         XVecZ : uint2;
         YVecZ : uint2;
         DummyA : uint2;
         DummyB : uint2;
      end record;
   for OrientRecord use record
      XVecX at 0 range 0 .. 14;
      XVecY at 0 range 15 .. 29;
      YVecX at 0 range 30 .. 44;
      YVecY at 0 range 45 .. 59;
      XVecZ at 0 range 60 .. 60;
      YVecZ at 0 range 61 .. 61;
      DummyA at 0 range 62 .. 62;
      DummyB at 0 range 63 .. 63;
   end record;
   
   function Data_To_Value is new Ada.Unchecked_Conversion(Source => DataRecord,
                                                          Target => ValueRecord);
   function Data_To_Orient is new Ada.Unchecked_Conversion(Source => DataRecord,
                                                           Target => OrientRecord);

   iScale : integer := 0;
   xDataToRecv : DataRecord;
   xValues : ValueRecord;
   xOrient : OrientRecord;

   xCANRecvMessage : CAN_Defs.CAN_Message;
   bMessageReceived : boolean := false;
   bChecksumOK : boolean := false;

   fDeltaTime : float := 0.0;
   fTotalTime : float := 0.0;
   iTotalMessages : integer := 0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   fSavedTime : float := 0.0;
   fDelay : float := 5.0;
   bGo : boolean := false;

   fAccX : float;
   fAccY : float;
   fAccZ : float;

   fOXX : float;
   fOXY : float;
   fOXZ : float;

   fOYX : float;
   fOYY : float;
   fOYZ : float;

   fOZX : float;
   fOZY : float;
   fOZZ : float;
begin

   BBB_CAN.Init(sPort => "ttyO4",
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

      fDeltaTime := float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
        (float(iNanoSeconds) * 0.000000001);
      fSavedTime := fSavedTime + fDeltaTime;
      
      if fSavedTime > fDelay then
         Ada.Text_IO.Put("Average time per message: ");
         Ada.Float_Text_IO.Put(fTotalTime / float(iTotalMessages), AFT=>18, EXP=>0);
         Ada.Text_IO.Put(". Messages per sec: ");
         Ada.Float_Text_IO.Put(float(iTotalMessages) / fTotalTime, AFT=>18, EXP=>0);
         Ada.Text_IO.Put_Line(".");
         fSavedTime := fSavedTime - fDelay;
         bGo := true;
      end if;
      

      BBB_CAN.Get(msg             => xCANRecvMessage,
                  bMsgReceived    => bMessageReceived,
                  bUARTChecksumOK => bChecksumOK);

      if bGo then 
         fTotalTime := fTotalTime + fDeltaTime;
         if bMessageReceived = true then
            if xCANRecvMessage.ID.Identifier = 530 then
               --iTotalMessages := iTotalMessages + 1;
            
               --fDeltaTime := 0.0;
               --bMessageReceived := false;
               -- ACC
               --              xDataToRecv.One := xCANRecvMessage.Data(1);
               --              xDataToRecv.Two := xCANRecvMessage.Data(2);
               --              xDataToRecv.Three := xCANRecvMessage.Data(3);
               --              xDataToRecv.Four := xCANRecvMessage.Data(4);
               --              xDataToRecv.Five := xCANRecvMessage.Data(5);
               --              xDataToRecv.Six := xCANRecvMessage.Data(6);
               --              xDataToRecv.Seven := xCANRecvMessage.Data(7);
               --              xDataToRecv.Eight := xCANRecvMessage.Data(8);
               --              
               --              xValues := Data_To_Value(xDataToRecv);
               --              
               --              --fValues(i) := (((fValues(i) / float(xDataToSend.Scale)) + 1.0) * 262_143.5) + 0.5;
               --              fAccX := ((float(xValues.AccX) / 262_143.5) - 1.0) * float(xValues.Scale);
               --              fAccY := ((float(xValues.AccY) / 262_143.5) - 1.0) * float(xValues.Scale);
               --              fAccZ := ((float(xValues.AccZ) / 262_143.5) - 1.0) * float(xValues.Scale);
               --              Ada.Text_IO.Put("[");
               --              Ada.Float_Text_IO.Put(fAccX, AFT=>10, EXP=>0);
               --              Ada.Text_IO.Put(", ");
               --              Ada.Float_Text_IO.Put(fAccY, AFT=>10, EXP=>0);
               --              Ada.Text_IO.Put(", ");
               --              Ada.Float_Text_IO.Put(fAccZ, AFT=>10, EXP=>0);
               --              Ada.Text_IO.Put_Line("]");
               null;
            end if;
            if xCANRecvMessage.ID.Identifier = 500 then
               iTotalMessages := iTotalMessages + 1;
            
               --fDeltaTime := 0.0;
               bMessageReceived := false;

               xDataToRecv.One := xCANRecvMessage.Data(1);
               xDataToRecv.Two := xCANRecvMessage.Data(2);
               xDataToRecv.Three := xCANRecvMessage.Data(3);
               xDataToRecv.Four := xCANRecvMessage.Data(4);
               xDataToRecv.Five := xCANRecvMessage.Data(5);
               xDataToRecv.Six := xCANRecvMessage.Data(6);
               xDataToRecv.Seven := xCANRecvMessage.Data(7);
               xDataToRecv.Eight := xCANRecvMessage.Data(8);
                           
               xOrient := Data_To_Orient(xDataToRecv);

               fOXX := (float(float(xOrient.XVecX) / 16_383.5) - 1.0);
               fOXY := (float(float(xOrient.XVecY) / 16_383.5) - 1.0);
               fOYX := (float(float(xOrient.YVecX) / 16_383.5) - 1.0);
               fOYY := (float(float(xOrient.YVecY) / 16_383.5) - 1.0);
               fOXZ := Ada.Numerics.Elementary_Functions.Sqrt(float'Max(0.0, 1.0 - (fOXX * fOXX) - (fOXY * fOXY)));-- * ((float(xOrient.XVecZ) * 2.0) - 1.0);
               fOYZ := Ada.Numerics.Elementary_Functions.Sqrt(float'Max(0.0, 1.0 - (fOYX * fOYX) - (fOYY * fOYY)));-- * ((float(xOrient.YVecZ) * 2.0) - 1.0);

               fOZX := fOXY * fOYZ - fOYY * fOXZ;
               -- u2 * v3 - v2 * u3
               
               fOZY := fOXZ * fOYX - fOXX * fOYZ;
               -- u3 * v1 - u1 * v3
               
               fOZZ := fOXX * fOYY - fOYX * fOXY;
               -- u1 * v2 - v1 * u2
               
               
               	
               Ada.Text_IO.Put("[");
               Ada.Float_Text_IO.Put(fOXX, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOXY, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOXZ, AFT=>6, EXP=>0);
               Ada.Text_IO.Put("] [");
               Ada.Float_Text_IO.Put(fOYX, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOYY, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOYZ, AFT=>6, EXP=>0);
               Ada.Text_IO.Put("] [");
               Ada.Float_Text_IO.Put(fOZX, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOZY, AFT=>6, EXP=>0);
               Ada.Text_IO.Put(", ");
               Ada.Float_Text_IO.Put(fOZZ, AFT=>6, EXP=>0);
               Ada.Text_IO.Put_Line("]");
		
            end if;
            --           Write_Message;
            --           xCANRecvMessage.Data := (others => 0);
            --           fDeltaTime := 0.0;
            --           bMessageReceived := false;
         end if;
      end if;
      -- Prepare timer for new iteration
      xTimeStart := xTimeStop;
   end loop;
end Main;
