with Ada.Text_IO; -- for demonstration purposes only

-- This package may include as many BBB hardware specific packages it wants

with CAN_Interface;


package BBB_CAN is

   type CBBBCANHardware is new CAN_Interface.ICANHardwareInterface with null record;


   overriding
   procedure
   Initialize(this : in out CBBBCANHardware);

   overriding
   procedure
   Send(this : in out CBBBCANHardware; xCANMessage : in CAN_Interface.TCANMessage);

   overriding
   procedure
   Receive(this : in out CBBBCANHardware; xCANMessage : in CAN_Interface.TCANMessage; bMessageReceived : out boolean);


end BBB_CAN;
