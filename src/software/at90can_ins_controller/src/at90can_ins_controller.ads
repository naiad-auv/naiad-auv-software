--------------------------------------------------------------------------
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-12-09

--  TODO: Hardware testing....
--------------------------------------------------------------------------

with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;

with CAN_Defs;

package AT90CAN_Ins_Controller is

   pragma Suppress (All_Checks);

   procedure Init(port : AVR.AT90CAN128.USART.USARTID; canBaud_Rate : Can_Defs.Baud_Rate; bUseExtendedID : Boolean);

   procedure Update;

   procedure SimulationModeOn;
   procedure SimulationModeOff;

private

   bSimulationMode : Boolean := false;
   bExtendedIds : Boolean;
   usart_port : AVR.AT90CAN128.USART.USARTID;

   procedure Imu_Interrupt;
   pragma Machine_Attribute (Imu_Interrupt, "signal");
   pragma Export (C, Imu_Interrupt, AVR.AT90CAN128.Vector_Int2);

end AT90CAN_Ins_Controller;
