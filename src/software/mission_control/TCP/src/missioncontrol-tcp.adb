package body MissionControl.TCP is

   protected body TCP_Resource is
      procedure Send(xCANMessage : in MissionControl.SharedTypes.CAN_Message) is
      begin
         null;
      end Send;

      procedure Receive(xCANMessage : out MissionControl.SharedTypes.CAN_Message; bMessageReceived : out boolean) is
         xNewCANMessage : MissionControl.SharedTypes.CAN_Message;
      begin
         xCANMessage := xNewCANMessage;
         bMessageReceived := false;
      end Receive;
   end TCP_Resource;

   task body TASK_TCP_IN is
      xCANMessageFromShore : MissionControl.SharedTypes.CAN_Message;
      bMessageReceived : boolean;
   begin
      loop

         TCP_Resource.Receive(xCANMessage      => xCANMessageFromShore,
                              bMessageReceived => bMessageReceived);

         if bMessageReceived then
            MissionControl.SharedTypes.xCANSimulatedMessageList.Add(xCANMessage => xCANMessageFromShore);
         end if;

      end loop;
   end TASK_TCP_IN;

   task body TASK_TCP_OUT is
      xCANMessageToShore : MissionControl.SharedTypes.CAN_Message;
   begin
      loop

         if MissionControl.SharedTypes.xCANOutMessageList.iCount >= 0 then

            MissionControl.SharedTypes.xCANOutMessageList.Remove(xCANMessage => xCANMessageToShore);
            TCP_Resource.Send(xCANMessage => xCANMessageToShore);

         end if;


         if MissionControl.SharedTypes.xCANInMessageList.iCount >= 0 then

            MissionControl.SharedTypes.xCANInMessageList.Remove(xCANMessage => xCANMessageToShore);
            TCP_Resource.Send(xCANMessage => xCANMessageToShore);

         end if;

      end loop;
   end TASK_TCP_OUT;

end MissionControl.TCP;
