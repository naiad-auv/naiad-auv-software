package body PC_CAN is


   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize
     (this : in out CPCCANHardware)
   is
   begin

      -- Do whatever PC initialization stuff needs to be done here
      Ada.Text_IO.Put_Line("PC CAN Hardware initialized.");

      null;
   end Initialize;

   ----------
   -- Send --
   ----------

   overriding procedure Send
     (this : in out CPCCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage)
   is
   begin

      -- Send CAN message with PC hardware here
      Ada.Text_IO.Put_Line("PC CAN Hardware sent message.");

      null;
   end Send;

   -------------
   -- Receive --
   -------------

   overriding procedure Receive
     (this : in out CPCCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage;
      bMessageReceived : out boolean)
   is
   begin
      bMessageReceived := true;

      -- Receive CAN message with PC hardware here
      Ada.Text_IO.Put_Line("PC CAN Hardware received message.");

      null;
   end Receive;


end PC_CAN;
