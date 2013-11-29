package body BBB_CAN is


   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize
     (this : in out CBBBCANHardware)
   is
   begin

      -- Do whatever BBB initialization stuff needs to be done here
      Ada.Text_IO.Put_Line("BBB CAN Hardware initialized.");

      null;
   end Initialize;

   ----------
   -- Send --
   ----------

   overriding procedure Send
     (this : in out CBBBCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage)
   is
   begin

      -- Send CAN message with BBB hardware here
      Ada.Text_IO.Put_Line("BBB CAN Hardware sent message.");

      null;
   end Send;

   -------------
   -- Receive --
   -------------

   overriding procedure Receive
     (this : in out CBBBCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage;
      bMessageReceived : out boolean)
   is
   begin
      bMessageReceived := true;

      -- Receive CAN message with BBB hardware here
      Ada.Text_IO.Put_Line("BBB CAN Hardware received message.");

      null;
   end Receive;

end BBB_CAN;
