package body CAN_IO_Tasks.Resource is


   protected body CAN_Resource is
      procedure Send(xCANMessage : in CAN_Defs.CAN_Message) is
      begin
         BBB_CAN.Send(msg => xCANMessage);
      end Send;

      procedure Receive(xCANMessage : out CAN_Defs.CAN_Message; bMessageReceived : out boolean) is
         bChecksum : boolean := false;
      begin
         BBB_CAN.Get(msg             => xCANMessage,
                     bMsgReceived    => bMessageReceived,
                     bUARTChecksumOK => bChecksum);
      end Receive;

   end CAN_Resource;


end CAN_IO_Tasks.Resource;
