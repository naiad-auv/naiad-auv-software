---------------------------------------------------------------------------
-- This code implements the CAN-link. It communicates with a Beaglebone Black
-- via UART to give the Beaglebone Black CAN capabiliies.
-- As of now it is not using any handshake at all.
-- It has been tested in hardware and it works.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-05

---------------------------------------------------------------------------


with CAN_Link_pack;

procedure CAN_Link is
   pragma Suppress (All_Checks);



begin
   CAN_Link_pack.Hardware_Init;
   CAN_Link_pack.Main_Loop;

end CAN_Link;



