---------------------------------------------------------------------------
-- This code implements the CAN-link. It communicates with a Beaglebone Black
-- via UART to give the Beaglebone Black CAN capabiliies.
-- As of now it is not using any handshake at all.
-- It has been tested in hardware and it works.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-24

---------------------------------------------------------------------------

pragma Profile (Ravenscar);

with AT90CAN_Usart_To_Can;

procedure AT90CAN_Usart_To_Can_main is
   pragma Suppress (All_Checks);
begin
   AT90CAN_Usart_To_Can.Hardware_Init;
   AT90CAN_Usart_To_Can.Main_Loop;

end AT90CAN_Usart_To_Can_main;



