with BBB_CAN;
with UartWrapper;
with CAN_Defs;

with Ada.Real_Time; -- measure time
with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Main is
   use Ada.Real_Time;

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   xCANMessage : CAN_Defs.CAN_Message;
   bMessageReceived : boolean := false;
   bChecksumOK : boolean := false;

   fDelayTime : float := 1.0;

   iMessageCount : integer := 0;
begin

   BBB_CAN.Init(sPort => "ttyO4",
                baud  => UartWrapper.B115200);

   xCANMessage.ID := CAN_Defs.MSG_IMU_ORIENTATION_ID;
   BBB_CAN.Send(msg => xCANMessage);

   loop
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

      BBB_CAN.Get(msg             => xCANMessage,
                  bMsgReceived    => bMessageReceived,
                  bUARTChecksumOK => bChecksumOK);

      if bMessageReceived then
         Ada.Text_IO.Put("[");
         Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18, EXP=>0);
         Ada.Text_IO.Put_Line("] ID:" & xCANMessage.ID.Identifier'Img & ". Len: " & xCANMessage.Len'Img);
         fDeltaTime := 0.0;
         bMessageReceived := false;
      end if;


--        if fDeltaTime >= fDelayTime then
--           fDeltaTime := fDeltaTime - fDelayTime;
--           BBB_CAN.Get(msg             => xCANMessage,
--                       bMsgReceived    => bMessageReceived,
--                       bUARTChecksumOK => bChecksumOK);
--           if bMessageReceived = true then
--              iMessageCount := iMessageCount + 1;
--              Ada.Text_IO.Put_Line("Message " & iMessageCount'Img & " received! ID: " & xCANMessage.ID.Identifier'Img);
--              xCANMessage.ID := CAN_Defs.MSG_IMU_ORIENTATION_ID;
--              BBB_CAN.Send(msg => xCANMessage);
--              bMessageReceived := false;
--           end if;
--        end if;

      xTimeStart := xTimeStop;
   end loop;
end Main;
