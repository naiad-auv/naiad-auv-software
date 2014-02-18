with BBB_CAN;
with UartWrapper;
with CAN_Defs;
with Interfaces;

with Ada.Real_Time; -- measure time
with Ada.Text_IO;
with Ada.Float_Text_IO;

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
   
   
   BBB1_MSG_ID : CAN_Defs.CAN_ID := CAN_Defs.MSG_STRING_ID;

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   xCANRecvMessage : CAN_Defs.CAN_Message;
   xCANSendMessage : CAN_Defs.CAN_Message := CAN_Defs.MSG_TORPEDO_LEFT;
   bMessageReceived : boolean := false;
   bChecksumOK : boolean := false;

   fDelayTime : float := 0.0;

   iMessageCount : integer := 0;
   iMessageSentCount : Interfaces.Unsigned_8 := 1;

   iLastMessageId : Interfaces.Unsigned_8 := 0;

   bTimeToSend : boolean := false;
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

      fDeltaTime := fDeltaTime + float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
        (float(iNanoSeconds) * 0.000000001);
      -------------------------------------------------------------------------------
      
      -- Look for new message on CAN-bus
      BBB_CAN.Get(msg             => xCANRecvMessage,
                  bMsgReceived    => bMessageReceived,
                  bUARTChecksumOK => bChecksumOK);

      if bMessageReceived = true then
            Ada.Text_IO.Put("[");
            Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18,EXP=>0);
            Ada.Text_IO.Put_Line("] Message " & iMessageCount'Img & " received. ID: " & xCANRecvMessage.ID.Identifier'Img & ". Data: " & sGet_Data_String(xCANRecvMessage.Data));
            fDeltaTime := 0.0;	
      end if;      
      
      -- Prepare timer for new iteration
      xTimeStart := xTimeStop;
      
   end loop;
end Main;
