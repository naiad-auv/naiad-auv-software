with Ada.Text_IO; -- for demonstration purposes only

-- This package may include as many PC hardware specific packages it wants

with CAN_Interface;

package PC_CAN is

   type CPCCANHardware is new CAN_Interface.ICANHardwareInterface with null record;


   overriding
   procedure
   Initialize(this : in out CPCCANHardware);

   overriding
   procedure
   Send(this : in out CPCCANHardware; xCANMessage : in CAN_Interface.TCANMessage);

   overriding
   procedure
   Receive(this : in out CPCCANHardware; xCANMessage : in CAN_Interface.TCANMessage; bMessageReceived : out boolean);

end PC_CAN;
