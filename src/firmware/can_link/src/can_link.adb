---------------------------------------------------------------------------
-- This code implements the CAN-link. It communicates with a Beaglebone Black
-- via UART to give the Beaglebone Black CAN capabiliies.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-05

-- TODO: Hardware testing

---------------------------------------------------------------------------


with CAN_Link_pack;

procedure CAN_Link is
   pragma Suppress (All_Checks);



begin
   CAN_Link_pack.Hardware_Init;
   CAN_Link_pack.Main_Loop;

end CAN_Link;



