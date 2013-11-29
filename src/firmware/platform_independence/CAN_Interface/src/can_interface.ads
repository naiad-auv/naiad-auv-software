package CAN_Interface is

   type TCANMessage is null record;
   -- all CAN types defined here
   -- all CAN types defined here
   -- all CAN types defined here
   -- all CAN types defined here
   -- all CAN types defined here



   -- interface for different hardware platforms
   type ICANHardwareInterface is interface;

   procedure
   Initialize(this : in out ICANHardwareInterface)
   is abstract;

   procedure
   Send(this : in out ICANHardwareInterface; xCANMessage : in TCANMessage)
   is abstract;

   procedure
   Receive(this : in out ICANHardwareInterface; xCANMessage : in TCANMessage; bMessageReceived : out boolean)
   is abstract;



end CAN_Interface;
