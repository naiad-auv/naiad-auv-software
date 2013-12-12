with MissionControl;
with MissionControl.SharedTypes;

with Ada.Text_IO; -- for testing

package MissionControl.TCP is

   protected TCP_Resource is
      procedure Send(xCANMessage : in MissionControl.SharedTypes.CAN_Message);
      procedure Receive(xCANMessage : out MissionControl.SharedTypes.CAN_Message; bMessageReceived : out boolean);
   end TCP_Resource;


   task TASK_TCP_IN is
   end TASK_TCP_IN;

   task TASK_TCP_OUT is
   end TASK_TCP_OUT;



end MissionControl.TCP;
