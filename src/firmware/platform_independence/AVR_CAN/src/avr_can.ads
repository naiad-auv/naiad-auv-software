with Ada.Text_IO; -- for demonstration purposes only

-- This package may include as many AVR hardware specific packages it wants

with CAN_Interface;

package AVR_CAN is

   type CAVRCANHardware is new CAN_Interface.ICANHardwareInterface with null record;



   overriding
   procedure
   Initialize(this : in out CAVRCANHardware);

   overriding
   procedure
   Send(this : in out CAVRCANHardware; xCANMessage : in CAN_Interface.TCANMessage);

   overriding
   procedure
   Receive(this : in out CAVRCANHardware; xCANMessage : in CAN_Interface.TCANMessage; bMessageReceived : out boolean);

private


end AVR_CAN;
