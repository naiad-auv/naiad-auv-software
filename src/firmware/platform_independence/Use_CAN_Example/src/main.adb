with CAN_Handler;
with CAN_Interface;

with AVR_CAN;

procedure Main is

   xCANHandler : CAN_Handler.CCANHandler;
   xCANHardware : aliased AVR_CAN.CAVRCANHardware;
   xMyCANMessage : CAN_Interface.TCANMessage;
   bMsgReceived : boolean := false;

begin
   xCANHandler.Set_Hardware(pxNewCANHardware => xCANHardware'Access);

   loop
      xCANHandler.Receive(xCANMessage      => xMyCANMessage,
                          bMessageReceived => bMsgReceived);
      if bMsgReceived then
         xCANHandler.Send(xCANMessage => xMyCANMessage);
      end if;

      delay 1.0;
   end loop;

end Main;
