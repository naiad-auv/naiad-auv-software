with MissionControl;
with MissionControl.SharedTypes;

package MissionControl.CAN is

   protected CAN_Resource is
      procedure Send(xCANMessage : in MissionControl.SharedTypes.CAN_Message);
      procedure Receive(xCANMessage : out MissionControl.SharedTypes.CAN_Message; bMessageReceived : out boolean);
   end CAN_Resource;


   task TASK_CAN_IN is
   end TASK_CAN_IN;

   task TASK_CAN_OUT is
   end TASK_CAN_OUT;


end MissionControl.CAN;
