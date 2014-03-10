with BBB_CAN;
with UartWrapper;
with CAN_Defs;
with Interfaces;
with Ada.Real_Time; -- measure time
with Ada.Text_IO;

procedure Main is
   use Ada.Real_Time;
   use Interfaces;
   use CAN_Defs;

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   xCANMotorMessage : CAN_Defs.CAN_Message;

   fDelayTime : float := 2.5;

   iMessageCount : integer := 0;
   iMotorIndex : integer := 0;
   u8MotorValueRun : Interfaces.Unsigned_8 := 128 + 22;
   u8MotorValueStop : Interfaces.Unsigned_8 := 128;
begin

   BBB_CAN.Init(sPort => "ttyO4",
                baud  => UartWrapper.B115200);

   xCANMotorMessage.ID := CAN_Defs.MSG_THRUSTER_ID;
   xCANMotorMessage.Len := 1;

   xCANMotorMessage.Data(1) := u8MotorValueStop;

   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(0);
   BBB_CAN.Send(xCANMotorMessage);
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(1);
   BBB_CAN.Send(xCANMotorMessage);
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(2);
   BBB_CAN.Send(xCANMotorMessage);
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(3);
   BBB_CAN.Send(xCANMotorMessage);
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(4);
   BBB_CAN.Send(xCANMotorMessage);
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(5);
   BBB_CAN.Send(xCANMotorMessage);

   -- start first motor
   xCANMotorMessage.Data(1) := u8MotorValueRun;
   xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(iMotorIndex);
   BBB_CAN.Send(xCANMotorMessage);

--     xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(iMotorIndex);

   xTimeStart := Ada.Real_Time.Clock;

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

      if fDeltaTime >= fDelayTime then
         fDeltaTime := fDeltaTime - fDelayTime;

--           if xCANMotorMessage.Data(1) = u8MotorValueStop then
--              xCANMotorMessage.Data(1) := u8MotorValueRun;
--           else
--              xCANMotorMessage.Data(1) := u8MotorValueStop;
--           end if;

         xCANMotorMessage.Data(1) := u8MotorValueStop;
         xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(iMotorIndex);
         BBB_CAN.Send(xCANMotorMessage);

         iMotorIndex := (iMotorIndex + 1) mod 6;

         xCANMotorMessage.Data(1) := u8MotorValueRun;
         xCANMotorMessage.ID.Identifier := CAN_Defs.MSG_THRUSTER_ID.Identifier + CAN_Identifier(iMotorIndex);
         BBB_CAN.Send(xCANMotorMessage);

      end if;

      xTimeStart := xTimeStop;
   end loop;
end Main;
