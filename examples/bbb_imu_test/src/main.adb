with UartWrapper;
with Interfaces;
with Interfaces.C;

with Ada.Real_Time; -- measure time
with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;


procedure Main is
   use Ada.Real_Time;
   use Interfaces;

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
      --Ada.Text_IO.Put_Line("Checksum(" & bXor'Img & "): " & sGetHexValue(Integer(bXor)));
      --Ada.Text_IO.Put_Line("Command: " & sCommand & "*" & sGetHexValue(Integer(bXor)));
      return sCommand & "*" & sGetHexValue(Integer(bXor));
   end sGetCommandWithChecksum;



   --     fDeltaTime : float := 0.0;
   --     xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   --     xTimeStop : Ada.Real_Time.Time;
   --     xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   --     iSeconds : integer;
--     iMilliSeconds : integer;
--     iMicroSeconds : integer;
--     iNanoSeconds : integer;

--     fDelayTime : float := 0.0;

   pxUartHandler : UartWrapper.pCUartHandler;
   sIncomingByte : string(1..1);
   iBytesRead : integer := 0;
   iLoop : integer := 0;
   --sBaudrateCommand : string :=
begin

   pxUartHandler := UartWrapper.pxCreate(path       => "/dev/ttyO4",
                                         speed      => UartWrapper.B115200,
                                         vtime      => Interfaces.C.int(0),
                                         bufferSize => 200,
                                         vmin       => Interfaces.C.int(0));

   --pxUartHandler.Uart_Write(stringToBeWritten => sGetCommandWithChecksum("$VNWRG,5,115200"));
   --pxUartHandler.Uart_Write(stringToBeWritten => sGetCommandWithChecksum("$VNWNV"));

--   pxUartHandler.Uart_Write(stringToBeWritten => sGetCommandWithChecksum("$VNRRG,11"));
   --pxUartHandler.Uart_Write(stringToBeWritten => sGetCommandWithChecksum("$VNRRG,05,115200"));


   loop
     -- Time measurement -----------------------------------------------------------
--        xTimeStop := Ada.Real_Time.Clock;
--        xTimeSpan := xTimeSpan + (xTimeStop - xTimeStart);
--
--        iSeconds := xTimeSpan / Ada.Real_Time.Seconds(1);
--        xTimeSpan := xTimeSpan - (Ada.Real_Time.Seconds(1) * iSeconds);
--
--        iMilliSeconds := xTimeSpan / Ada.Real_Time.Milliseconds(1);
--        xTimeSpan := xTimeSpan - (Ada.Real_Time.Milliseconds(1) * iMilliSeconds);
--
--        iMicroSeconds := xTimeSpan / Ada.Real_Time.Microseconds(1);
--        xTimeSpan := xTimeSpan - (Ada.Real_Time.Microseconds(1) * iMicroSeconds);
--
--        iNanoSeconds := xTimeSpan / Ada.Real_Time.Nanoseconds(1);
--        xTimeSpan := xTimeSpan - (Ada.Real_Time.Nanoseconds(1) * iNanoSeconds);
--
--        fDeltaTime := fDeltaTime + float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
--          (float(iNanoSeconds) * 0.000000001);
      -------------------------------------------------------------------------------

      if iLoop mod 1000 = 0 then
         pxUartHandler.Uart_Write(stringToBeWritten => sGetCommandWithChecksum("$VNRRG,11"));
      end if;
      iLoop := iLoop + 1;

      pxUartHandler.UartReadSpecificAmount(sStringRead   => sIncomingByte,
                                           iBytesToRead  => 1,
                                           iNumBytesRead => iBytesRead);

      if iBytesRead > 0 then
         if sIncomingByte = "$" then
            Ada.Text_IO.New_Line;
         end if;
         Ada.Text_IO.Put(sIncomingByte);
         --Ada.Text_IO.Put_Line(Integer'Image(Character'Pos(sIncomingByte(1))));
         iBytesRead := 0;
      end if;


      -- Prepare timer for new iteration
--        xTimeStart := xTimeStop;

   end loop;
end Main;
