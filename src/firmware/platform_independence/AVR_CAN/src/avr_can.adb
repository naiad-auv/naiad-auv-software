package body AVR_CAN is

   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize
     (this : in out CAVRCANHardware)
   is
   begin

      -- Do whatever AVR initialization stuff needs to be done here

      Ada.Text_IO.Put_Line("AVR CAN Hardware initialized.");
      null;
   end Initialize;

   ----------
   -- Send --
   ----------

   overriding procedure Send
     (this : in out CAVRCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage)
   is
   begin

      -- Send CAN message with AVR hardware here
      Ada.Text_IO.Put_Line("AVR CAN Hardware sent message.");

      null;
   end Send;

   -------------
   -- Receive --
   -------------

   overriding procedure Receive
     (this : in out CAVRCANHardware;
      xCANMessage : in CAN_Interface.TCANMessage;
      bMessageReceived : out boolean)
   is
   begin
      bMessageReceived := true;

      -- Receive CAN message with AVR hardware here
      Ada.Text_IO.Put_Line("AVR CAN Hardware received message.");

      null;
   end Receive;

end AVR_CAN;
