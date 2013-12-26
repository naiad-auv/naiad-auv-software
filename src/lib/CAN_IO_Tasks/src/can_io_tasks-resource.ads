with CAN_Defs;
with BBB_CAN;

package CAN_IO_Tasks.Resource is

   protected CAN_Resource is
      procedure Send(xCANMessage : in CAN_Defs.CAN_Message);
      procedure Receive(xCANMessage : out CAN_Defs.CAN_Message; bMessageReceived : out boolean);
   end CAN_Resource;


end CAN_IO_Tasks.Resource;
