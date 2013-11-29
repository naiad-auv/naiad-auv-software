package body CAN_Handler is

   ------------------
   -- Set_Hardware --
   ------------------

   procedure Set_Hardware
     (this : in out CCANHandler;
      pxNewCANHardware : access CAN_Interface.ICANHardwareInterface'Class)
   is
   begin
      this.pxCANHardware := pxNewCANHardware;
      this.pxCANHardware.Initialize;
   end Set_Hardware;

   ----------
   -- Send --
   ----------

   procedure Send
     (this : in out CCANHandler;
      xCANMessage : in CAN_Interface.TCANMessage)
   is
   begin
      this.pxCANHardware.Send(xCANMessage => xCANMessage);
   end Send;

   -------------
   -- Receive --
   -------------

   procedure Receive
     (this : in out CCANHandler;
      xCANMessage : in CAN_Interface.TCANMessage;
      bMessageReceived : out boolean)
   is
   begin
      this.pxCANHardware.Receive(xCANMessage      => xCANMessage,
                                 bMessageReceived => bMessageReceived);
   end Receive;

end CAN_Handler;
