package body CAN_IO_Tasks.Tasks is

   task body TASK_CAN_IN is
      bCANMessageReceived : boolean;
      xCANMessageReceived : CAN_Defs.CAN_Message;
   begin
      loop
         CAN_IO_Tasks.Resource.CAN_Resource.Receive(xCANMessage      => xCANMessageReceived,
                                                    bMessageReceived => bCANMessageReceived);

         if bCANMessageReceived then
            CAN_IO_Tasks.MessageLists.xCANInMessageList.Add(xCANMessage => xCANMessageReceived);
         end if;
      end loop;
   end TASK_CAN_IN;

   task body TASK_CAN_OUT is
      xCANMessageToSend : CAN_Defs.CAN_Message;
   begin
      loop
         if CAN_IO_Tasks.MessageLists.xCANOutMessageList.iCount > 0 then

            CAN_IO_Tasks.MessageLists.xCANOutMessageList.Remove(xCANMessage => xCANMessageToSend);
            CAN_IO_Tasks.Resource.CAN_Resource.Send(xCANMessage => xCANMessageToSend);

         end if;
      end loop;
   end TASK_CAN_OUT;

end CAN_IO_Tasks.Tasks;
