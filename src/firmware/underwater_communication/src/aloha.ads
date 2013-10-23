with AVR.AT90CAN128.CLOCK;
with Interfaces;

package Aloha is

   type Node_ID is new Interfaces.Unsigned_8;
   type Frame_ID is new Interfaces.Unsigned_32;

   TIMEOUT_ACK		: AVR.AT90CAN128.CLOCK.Time_Duration := 0;
   TIMEOUT_PAY		: AVR.AT90CAN128.CLOCK.Time_Duration := 0;
   TIMEOUT_BACKOFF	: AVR.AT90CAN128.CLOCK.Time_Duration := 0;

   type Frame_ACK is record
      niSender		: Node_ID;
      niReceiver	: Node_ID;
      fiIDFrameReceived	: Frame_ID;
   end record;

   type Frame_PAY is record
      niSender		: Node_ID;
      niReceiver	: Node_ID;
      --data
      fiID		: Frame_ID;
   end record;

--   type Buffer is array(Positive range <>);

   --sendACK
   --sendPAY
   --receiveFrame

   --function getPacketCount_TX return Interfaces.Integer_32;
   --function getPacketCount_RX return Interfaces.Integer_32;

   procedure dummy;

end Aloha;
