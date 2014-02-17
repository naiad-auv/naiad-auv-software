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
   
   BBB1_MSG_ID : CAN_Defs.CAN_ID := CAN_Defs.MSG_GYRO_YAW_ID;
   BBB2_MSG_ID : CAN_Defs.CAN_ID := CAN_Defs.MSG_THRUSTER_ID;

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
   iMessageSentCount : Interfaces.Unsigned_8 := 0;

   iLastMessageId : Interfaces.Unsigned_8 := 0;

   bTimeToSend : boolean := false;
begin

--   xCANSendMessage.ID := BBB2_MSG_ID;
   xCANSendMessage.ID := BBB1_MSG_ID;
--   xCANSendMessage.ID := BBB2_MSG_ID;
   BBB_CAN.Init(sPort => "ttyO4",
                baud  => UartWrapper.B115200);

   -- ONLY starting point does this
   if xCANSendMessage.ID.Identifier = BBB1_MSG_ID.Identifier then
      xCANSendMessage.Data(1) := iMessageSentCount;
      BBB_CAN.Send(msg => xCANSendMessage);
   end if;
   
   
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

      
      -- If message is received, prepare to send again
      if bMessageReceived = true then

         iMessageCount := iMessageCount + 1;
         if iMessageCount mod 1000 = 0 then
            fDeltaTime := fDeltaTime * 0.001;
            Ada.Text_IO.Put("[");
            Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18,EXP=>0);
            Ada.Text_IO.Put_Line("] Message " & iMessageCount'Img & " received. ID: " & xCANRecvMessage.ID.Identifier'Img & ". Data(1): " & xCANRecvMessage.Data(1)'Img);
            fDeltaTime := 0.0;
         end if;		

         if iLastMessageId + 1 /= xCANRecvMessage.Data(1) then
            Ada.Text_IO.Put_Line("Packet loss! Exiting...");
         else            
            iLastMessageId := xCANRecvMessage.Data(1);
         end if;
         
         bTimeToSend := true;
         bMessageReceived := false;
      end if;
      
      

      -- Check if it's time to send again and send a message
      if fDeltaTime >= fDelayTime then         
         if bTimeToSend = true then
            xCANSendMessage.Data(1) := iMessageSentCount;
            BBB_CAN.Send(msg => xCANSendMessage);
            iMessageSentCount := iMessageSentCount + 1;
            bTimeToSend := false;
         end if;
      end if;
      
      
      -- Prepare timer for new iteration
      xTimeStart := xTimeStop;
      
   end loop;
end Main;
