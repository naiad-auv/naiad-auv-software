with CAN_Interface;

package CAN_Handler is

   type CCANHandler is tagged private;


   procedure Set_Hardware (this : in out CCANHandler;
                           pxNewCANHardware : access CAN_Interface.ICANHardwareInterface'Class);

   procedure Send(this : in out CCANHandler; xCANMessage : in CAN_Interface.TCANMessage);
   procedure Receive(this : in out CCANHandler; xCANMessage : in CAN_Interface.TCANMessage; bMessageReceived : out boolean);

private
   type CCANHandler is tagged
      record
         pxCANHardware : access CAN_Interface.ICANHardwareInterface'Class;
      end record;

end CAN_Handler;
