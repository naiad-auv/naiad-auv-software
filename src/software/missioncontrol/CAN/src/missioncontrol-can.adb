package body MissionControl.CAN is

   protected body CAN_Resource is
      procedure Send(xCANMessage : in MissionControl.SharedTypes.CAN_Message) is
      begin
         Ada.Text_IO.Put_Line("CAN_Resource: Send called."); -- for testing
         null;
      end Send;

      procedure Receive(xCANMessage : out MissionControl.SharedTypes.CAN_Message; bMessageReceived : out boolean) is
         xNewCANMessage : MissionControl.SharedTypes.CAN_Message;
      begin
         Ada.Text_IO.Put_Line("CAN_Resource: Receive called."); -- for testing
         xCANMessage := xNewCANMessage;
         bMessageReceived := true;
      end Receive;

   end CAN_Resource;

   task body TASK_CAN_IN is
      bCANMessageReceived : boolean;
      xNewCANMessage : MissionControl.SharedTypes.CAN_Message;
   begin
      loop
         CAN_Resource.Receive(xCANMessage      => xNewCANMessage,
                              bMessageReceived => bCANMessageReceived);

         if bCANMessageReceived then
            MissionControl.SharedTypes.xObjectsInList.Add(xNewObject => MissionControl.SharedTypes.xGet_Object_From_CAN_Message(xNewCANMessage));
            MissionControl.SharedTypes.xCANInMessageList.Add(xCANMessage => xNewCANMessage);
         end if;

         if MissionControl.SharedTypes.xCANSimulatedMessageList.iCount > 0 then
            MissionControl.SharedTypes.xCANSimulatedMessageList.Remove(xCANMessage => xNewCANMessage);
            CAN_Resource.Send(xCANMessage => xNewCANMessage);
         end if;

         delay 0.5;  -- for testing
      end loop;
   end TASK_CAN_IN;

   task body TASK_CAN_OUT is
      pxObject : MissionControl.SharedTypes.pTListObject;
      xNewCANMessage : MissionControl.SharedTypes.CAN_Message;
   begin
      loop
         if MissionControl.SharedTypes.xObjectsOutList.iCount > 0 then

            MissionControl.SharedTypes.xObjectsOutList.Remove(pxObjectRemoved => pxObject);
            xNewCANMessage := pxObject.xGet_CAN_Message_From_Object;
            MissionControl.SharedTypes.Dealloc(pxObject);
            MissionControl.SharedTypes.xCANOutMessageList.Add(xNewCANMessage);

            CAN_Resource.Send(xCANMessage => xNewCANMessage);

         end if;

         delay 0.5;  -- for testing
      end loop;
   end TASK_CAN_OUT;

end MissionControl.CAN;
